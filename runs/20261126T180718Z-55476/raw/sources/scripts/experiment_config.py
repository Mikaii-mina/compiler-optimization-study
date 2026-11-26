"""Shared configuration for the full eight-program experiment."""

from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BENCHMARKS = (
    'vector_add', 'reduction', 'conditional', 'stencil',
    'strided', 'indirect_gather', 'histogram', 'float_reduction',
)
OPTIMIZATIONS = ('O0', 'O2', 'O3')
COMPILERS = {
    'gcc': ('/opt/homebrew/bin/gcc-16', '-fopt-info-vec-all'),
    'clang': (
        '/usr/bin/clang', '-Rpass=loop-vectorize',
        '-Rpass-missed=loop-vectorize', '-Rpass-analysis=loop-vectorize',
    ),
}


def correctness_size(benchmark):
    return 256 if benchmark == 'stencil' else 32768


def timing_size(benchmark):
    return 1024 if benchmark == 'stencil' else 1000000
