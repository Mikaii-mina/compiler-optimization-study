#!/usr/bin/env python3
"""Verify one complete run and derive its structured results."""

import argparse
import csv
import hashlib
import json
import math
import re
import statistics

from experiment_config import BENCHMARKS, COMPILERS, OPTIMIZATIONS, ROOT


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def percentile(values, fraction):
    ordered = sorted(values)
    position = (len(ordered) - 1) * fraction
    lower = math.floor(position)
    upper = math.ceil(position)
    return ordered[lower] + (ordered[upper] - ordered[lower]) * (position - lower)


def target_line(source):
    lines = source.read_text().splitlines()
    markers = [index for index, line in enumerate(lines) if '/* TARGET_LOOP */' in line]
    if len(markers) != 1:
        raise ValueError(f'Expected exactly one target-loop marker: {source}')
    for index in range(markers[0] + 1, len(lines)):
        if lines[index].strip():
            if not re.match(r'for\s*\(', lines[index].strip()):
                raise ValueError(f'Target marker is not followed by a for loop: {source}')
            return index + 1
    raise ValueError(f'Target marker is at end of file: {source}')


def classify_report(path, line_number):
    relevant = []
    for line in path.read_text().splitlines():
        match = re.search(r'\.c:(\d+):\d+:', line)
        if match and int(match.group(1)) == line_number:
            relevant.append(line)
    text = '\n'.join(relevant)
    success = bool(re.search(r'optimized: loop vectorized|remark: vectorized loop', text))
    missed = bool(re.search(
        r'missed: (?:couldn.t vectorize loop|not vectorized)|remark: loop not vectorized', text))
    interleaved = 'remark: interleaved loop' in text
    if success and missed:
        state = 'Success and Missed'
    elif success:
        state = 'Vectorized'
    elif missed:
        state = 'Missed'
    elif interleaved:
        state = 'Interleaved Only'
    else:
        state = 'No Relevant Report'
    return state, success, missed, interleaved


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('run_id')
    args = parser.parse_args()
    run_id = args.run_id
    run_root = ROOT / 'runs' / run_id
    raw_dir = run_root / 'raw'
    processed = run_root / 'processed'
    manifest = json.loads((raw_dir / 'manifest.json').read_text())
    if manifest['run_id'] != run_id:
        raise ValueError('Run ID does not match manifest')
    for relative, expected in manifest['source_sha256'].items():
        source = raw_dir / 'sources' / relative
        if sha256(source) != expected:
            raise ValueError(f'Source snapshot changed: {relative}')
    loop_lines = {
        benchmark: target_line(raw_dir / 'sources' / 'benchmarks' / f'{benchmark}.c')
        for benchmark in BENCHMARKS
    }
    summary = []
    samples = []
    output_values = {}
    for compiler in COMPILERS:
        for opt in OPTIMIZATIONS:
            for benchmark in BENCHMARKS:
                key = (compiler, opt, benchmark)
                dest = raw_dir / compiler / f'{benchmark}-{opt}'
                status = json.loads((dest / 'status.json').read_text())
                expected_steps = ('assembly', 'compile', 'kernel_object', 'timing_exe',
                                  'correctness_small', 'correctness_large')
                expected_steps += tuple(f'round_{i:02d}' for i in range(1, manifest['rounds'] + 1))
                if any(status.get(step) != 0 for step in expected_steps):
                    raise ValueError(f'Incomplete configuration: {key}: {status}')
                assembly = dest / 'benchmark.s'
                if not assembly.is_file():
                    raise ValueError(f'Missing assembly: {key}')
                outputs = {}
                for size in ('small', 'large'):
                    output = (dest / f'correctness_{size}.stdout').read_text().strip()
                    if not output.startswith(f'PASS {benchmark} '):
                        raise ValueError(f'Incorrect output: {key} {size}')
                    outputs[size] = output
                    output_values.setdefault((benchmark, size), set()).add(output)
                state, success, missed, interleaved = classify_report(
                    dest / 'compile.stderr', loop_lines[benchmark])
                values = []
                round_medians = []
                for round_index in range(1, manifest['rounds'] + 1):
                    timing = dest / 'timing' / f'round_{round_index:02d}.csv'
                    with timing.open(newline='') as file:
                        timing_rows = list(csv.DictReader(file))
                    if len(timing_rows) != manifest['samples_per_round']:
                        raise ValueError(f'Wrong sample count: {key} round {round_index}')
                    block = []
                    for sample_index, row in enumerate(timing_rows, 1):
                        iterations = int(row['iterations'])
                        total_ns = int(row['total_ns'])
                        ns = float(row['ns_per_call'])
                        if (int(row['sample']) != sample_index or iterations < 1 or total_ns < 1
                                or not math.isfinite(ns) or ns <= 0
                                or abs(ns - total_ns / iterations) > 0.01):
                            raise ValueError(f'Invalid timing sample: {key} round {round_index}')
                        block.append(ns)
                        samples.append([run_id, *key, round_index, sample_index,
                                        iterations, total_ns, ns])
                    values.extend(block)
                    round_medians.append(statistics.median(block))
                median = statistics.median(values)
                p10 = percentile(values, 0.1)
                p90 = percentile(values, 0.9)
                mad = statistics.median(abs(value - median) for value in values)
                spread = (p90 - p10) / median * 100
                round_range = (max(round_medians) - min(round_medians)) / median * 100
                summary.append({
                    'run_id': run_id, 'compiler': compiler,
                    'version': manifest['environment'][compiler]['version'],
                    'target': manifest['environment'][compiler]['target'],
                    'optimization': opt, 'benchmark': benchmark,
                    'compile_success': True, 'assembly_success': True,
                    'assembly_sha256': sha256(assembly),
                    'correctness_small': 'Pass', 'correctness_large': 'Pass',
                    'report_state': state, 'vectorized_report': success,
                    'missed_report': missed, 'interleaved_report': interleaved,
                    'rounds': manifest['rounds'], 'samples': len(values),
                    'median_ns': round(median, 3), 'p10_ns': round(p10, 3),
                    'p90_ns': round(p90, 3), 'mad_ns': round(mad, 3),
                    'p10_p90_spread_pct': round(spread, 2),
                    'round_median_range_pct': round(round_range, 2),
                    'timing_quality': 'High Variability' if spread > 20 or round_range > 10 else 'Acceptable',
                    'round_medians_ns': ';'.join(f'{value:.3f}' for value in round_medians),
                    'output_small': outputs['small'], 'output_large': outputs['large'],
                })
    for (benchmark, size), outputs in output_values.items():
        if benchmark != 'float_reduction' and len(outputs) != 1:
            raise ValueError(f'Outputs differ across configurations: {benchmark} {size}')
    with (processed / 'summary.csv').open('w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=summary[0].keys())
        writer.writeheader()
        writer.writerows(summary)
    with (processed / 'timing_samples.csv').open('w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['run_id', 'compiler', 'optimization', 'benchmark', 'round',
                         'sample', 'iterations', 'total_ns', 'ns_per_call'])
        writer.writerows(samples)
    (processed / 'analysis_status.json').write_text(json.dumps({
        'run_id': run_id, 'configurations': len(summary),
        'timing_samples': len(samples),
        'source_hashes_verified': True,
        'high_variability_configurations': sum(
            row['timing_quality'] == 'High Variability' for row in summary),
    }, indent=2) + '\n')
    print(f'Run {run_id}: {len(summary)} configurations, {len(samples)} timing samples')


if __name__ == '__main__':
    main()
