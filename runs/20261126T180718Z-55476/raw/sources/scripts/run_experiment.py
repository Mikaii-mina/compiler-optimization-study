#!/usr/bin/env python3
"""Compile, validate, and time the complete matrix in one preserved run."""

import argparse
import hashlib
import json
import os
import platform
import random
import shutil
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

from experiment_config import (
    BENCHMARKS, COMPILERS, OPTIMIZATIONS, ROOT,
    correctness_size, timing_size,
)


def timestamp():
    return datetime.now(timezone.utc).isoformat(timespec='seconds')


def save_json(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n')


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run_command(command, stdout, stderr, log, label, timeout=180):
    with stdout.open('xb') as out, stderr.open('xb') as err:
        try:
            status = subprocess.run(command, cwd=ROOT, stdout=out, stderr=err,
                                    timeout=timeout, check=False).returncode
        except subprocess.TimeoutExpired:
            err.write(b'\nTIMEOUT\n')
            status = 124
    with log.open('a') as file:
        file.write(json.dumps({'at': timestamp(), 'label': label,
                               'command': command, 'status': status}) + '\n')
    return status


def capture(command, path):
    result = subprocess.run(command, cwd=ROOT, capture_output=True,
                            timeout=30, check=True)
    path.write_bytes(result.stdout)
    return result.stdout.decode(errors='replace').strip()


def source_snapshot(run_dir):
    files = [ROOT / 'benchmarks' / f'{name}.c' for name in BENCHMARKS]
    files += [ROOT / 'scripts' / name for name in (
        'timing_harness.c', 'experiment_config.py', 'run_experiment.py',
        'analyze_results.py', 'validate_benchmarks.sh',
    )]
    hashes = {}
    for source in files:
        relative = source.relative_to(ROOT)
        destination = run_dir / 'sources' / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, destination)
        hashes[str(relative)] = sha256(destination)
    return hashes


def configuration_commands(compiler, opt, benchmark, dest, run_dir):
    cc, *report_flags = COMPILERS[compiler]
    source = run_dir / 'sources' / 'benchmarks' / f'{benchmark}.c'
    base = [cc, '-std=c11', '-Wall', '-Wextra', f'-{opt}']
    executable = dest / 'correctness.exe'
    timing_executable = dest / 'timing.exe'
    return {
        'assembly': base + report_flags + ['-S', str(source), '-o', str(dest / 'benchmark.s')],
        'compile': base + report_flags + [str(source), '-o', str(executable)],
        'kernel_object': base + ['-Dmain=benchmark_original_main', '-c',
                                  str(source), '-o', str(dest / 'kernel.o')],
        'timing_exe': [cc, '-std=c11', '-Wall', '-Wextra', '-O2',
                       f'-DBENCHMARK_ID={BENCHMARKS.index(benchmark) + 1}',
                       str(run_dir / 'sources' / 'scripts' / 'timing_harness.c'),
                       str(dest / 'kernel.o'), '-o', str(timing_executable)],
        'correctness_small': [str(executable), str(correctness_size(benchmark))],
        'correctness_large': [str(executable), str(timing_size(benchmark))],
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--rounds', type=int, default=3)
    parser.add_argument('--samples', type=int, default=15)
    parser.add_argument('--seed', type=int, default=20261126)
    args = parser.parse_args()
    if not 1 <= args.rounds <= 20 or not 1 <= args.samples <= 100:
        parser.error('rounds must be 1-20 and samples must be 1-100')
    if platform.system() != 'Darwin' or platform.machine() not in ('arm64', 'aarch64'):
        parser.error('This experiment requires macOS on ARM64')
    for name, (cc, *_) in COMPILERS.items():
        if not Path(cc).is_file():
            parser.error(f'{name} compiler is missing: {cc}')

    run_id = datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%SZ') + f'-{os.getpid()}'
    run_root = ROOT / 'runs' / run_id
    run_root.mkdir(parents=True, exist_ok=False)
    run_dir = run_root / 'raw'
    processed = run_root / 'processed'
    run_dir.mkdir()
    processed.mkdir()
    log = run_dir / 'run_log.jsonl'
    hashes = source_snapshot(run_dir)
    environment = {
        'system': platform.system(), 'machine': platform.machine(),
        'macos': platform.mac_ver()[0],
        'sw_vers': capture(['sw_vers'], run_dir / 'sw_vers.stdout'),
    }
    for name, (cc, *_) in COMPILERS.items():
        info = run_dir / name
        info.mkdir()
        version = capture([cc, '--version'], info / 'version.stdout')
        target = capture([cc, '-dumpmachine'], info / 'target.stdout')
        if not any(arch in target for arch in ('arm64', 'aarch64')):
            raise RuntimeError(f'{name} did not target ARM64: {target}')
        environment[name] = {'path': cc, 'version': version.splitlines()[0],
                             'target': target}
    jobs = [(compiler, opt, benchmark) for compiler in COMPILERS
            for opt in OPTIMIZATIONS for benchmark in BENCHMARKS]
    orders = []
    for round_index in range(args.rounds):
        order = jobs.copy()
        random.Random(args.seed + round_index).shuffle(order)
        orders.append(['/'.join(job) for job in order])
    save_json(run_dir / 'manifest.json', {
        'run_id': run_id, 'created_at': timestamp(), 'environment': environment,
        'source_sha256': hashes, 'benchmarks': BENCHMARKS,
        'optimizations': OPTIMIZATIONS, 'rounds': args.rounds,
        'samples_per_round': args.samples, 'round_orders': orders,
        'seed': args.seed, 'correctness_size': {'stencil_side': 256, 'other_elements': 32768},
        'timing_size': {'stencil_side': 1024, 'other_elements': 1000000},
        'clock': 'mach_absolute_time converted to nanoseconds with mach_timebase_info',
        'warmup_batches': 3,
        'calibration_target_ns': 20000000, 'driver_optimization': 'O2',
        'fast_math': False,
    })

    for index, (compiler, opt, benchmark) in enumerate(jobs, 1):
        dest = run_dir / compiler / f'{benchmark}-{opt}'
        dest.mkdir()
        commands = configuration_commands(compiler, opt, benchmark, dest, run_dir)
        save_json(dest / 'commands.json', commands)
        status = {}
        for step in ('assembly', 'compile', 'kernel_object', 'timing_exe'):
            if step == 'timing_exe' and status['kernel_object'] != 0:
                status[step] = None
                continue
            status[step] = run_command(commands[step], dest / f'{step}.stdout',
                                       dest / f'{step}.stderr', log,
                                       f'{compiler}/{opt}/{benchmark}/{step}')
        for size_label in ('correctness_small', 'correctness_large'):
            if status['compile'] != 0:
                status[size_label] = None
                continue
            out = dest / f'{size_label}.stdout'
            status[size_label] = run_command(commands[size_label], out,
                                             dest / f'{size_label}.stderr', log,
                                             f'{compiler}/{opt}/{benchmark}/{size_label}')
            if status[size_label] == 0 and not out.read_bytes().startswith(
                    f'PASS {benchmark} '.encode()):
                status[size_label] = 65
        save_json(dest / 'status.json', status)
        print(f'Compiled and checked {index:02d}/48: {compiler} {opt} {benchmark}', flush=True)

    for round_index in range(args.rounds):
        order = [tuple(item.split('/')) for item in orders[round_index]]
        for index, (compiler, opt, benchmark) in enumerate(order, 1):
            dest = run_dir / compiler / f'{benchmark}-{opt}'
            status_path = dest / 'status.json'
            status = json.loads(status_path.read_text())
            step = f'round_{round_index + 1:02d}'
            if any(status.get(key) != 0 for key in (
                    'assembly', 'compile', 'kernel_object', 'timing_exe',
                    'correctness_small', 'correctness_large')):
                status[step] = None
            else:
                timing_dir = dest / 'timing'
                timing_dir.mkdir(exist_ok=True)
                command = [str(dest / 'timing.exe'), str(timing_size(benchmark)),
                           str(args.samples)]
                status[step] = run_command(
                    command, timing_dir / f'{step}.csv',
                    timing_dir / f'{step}.stderr', log,
                    f'{compiler}/{opt}/{benchmark}/{step}', timeout=300)
            save_json(status_path, status)
            if index % 8 == 0:
                print(f'Timing round {round_index + 1}/{args.rounds}: {index}/48', flush=True)

    for name in ('analyze_results.py', 'experiment_config.py'):
        if sha256(ROOT / 'scripts' / name) != hashes[f'scripts/{name}']:
            raise RuntimeError(f'Analysis source changed during run: {name}')
    analysis = subprocess.run([sys.executable, str(ROOT / 'scripts' / 'analyze_results.py'),
                               run_id], cwd=ROOT, check=False)
    complete = all(
        all(value == 0 for value in json.loads((run_dir / compiler / f'{benchmark}-{opt}' /
                                               'status.json').read_text()).values())
        for compiler, opt, benchmark in jobs
    ) and analysis.returncode == 0
    save_json(run_dir / 'completion.json', {
        'finished_at': timestamp(), 'configurations': len(jobs),
        'rounds': args.rounds, 'samples_per_round': args.samples,
        'analysis_status': analysis.returncode, 'collection_success': complete,
    })
    print(f'RUN_ID={run_id}')
    print(f'RUN_ROOT={run_root}')
    print(f'RAW={run_dir}')
    print(f'PROCESSED={processed}')
    return 0 if complete else 1


if __name__ == '__main__':
    sys.exit(main())
