#!/bin/bash
set -euo pipefail
root=$(cd "$(dirname "$0")/.." && pwd)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
cases=(vector_add reduction conditional stencil strided indirect_gather histogram float_reduction)
builds=0
runs=0

for benchmark in "${cases[@]}"; do
  if [ "$benchmark" = stencil ]; then sizes=(3 7 256); else sizes=(1 7 32768); fi
  for compiler in gcc clang; do
    if [ "$compiler" = gcc ]; then cc=/opt/homebrew/bin/gcc-16; else cc=/usr/bin/clang; fi
    for opt in O0 O2 O3; do
      exe="$work/$compiler-$benchmark-$opt"
      "$cc" -std=c11 -Wall -Wextra -Werror "-$opt" \
        "$root/benchmarks/$benchmark.c" -o "$exe"
      builds=$((builds + 1))
      for size in "${sizes[@]}"; do
        output=$("$exe" "$size")
        case "$output" in
          "PASS $benchmark "*) ;;
          *) printf 'Unexpected output: %s %s %s: %s\n' "$compiler" "$opt" "$benchmark" "$output" >&2; exit 1 ;;
        esac
        if [ "$benchmark" != float_reduction ]; then
          reference="$work/$benchmark-$size.expected"
          if [ -e "$reference" ]; then
            if [ "$output" != "$(< "$reference")" ]; then
              printf 'Output mismatch: %s %s %s size=%s\n' "$compiler" "$opt" "$benchmark" "$size" >&2
              exit 1
            fi
          else
            printf '%s\n' "$output" > "$reference"
          fi
        fi
        runs=$((runs + 1))
      done
    done
  done
  printf 'PASS %s: 6 builds, 18 runs\n' "$benchmark"
done
printf 'PASS: %s benchmarks, %s builds, %s correctness runs\n' "${#cases[@]}" "$builds" "$runs"
