#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <mach/mach_time.h>

#ifndef BENCHMARK_ID
#error BENCHMARK_ID is required
#endif

#if BENCHMARK_ID == 1
extern void kernel(const int *, const int *, int *, size_t);
static int *a, *b, *out;
static void setup(size_t n) {
    a = malloc(n * sizeof *a); b = malloc(n * sizeof *b); out = malloc(n * sizeof *out);
    if (!a || !b || !out) exit(3);
    for (size_t i = 0; i < n; ++i) { a[i] = (int)(i % 97); b[i] = (int)(i % 31); }
}
static void run(size_t n) { kernel(a, b, out, n); }
static uint64_t consume(void) { return (uint64_t)(unsigned)out[0]; }
#elif BENCHMARK_ID == 2
extern int kernel(const int *, size_t);
static int *a;
static volatile int result;
static void setup(size_t n) {
    a = malloc(n * sizeof *a); if (!a) exit(3);
    for (size_t i = 0; i < n; ++i) a[i] = (int)(i % 17);
}
static void run(size_t n) { result = kernel(a, n); }
static uint64_t consume(void) { return (uint64_t)(unsigned)result; }
#elif BENCHMARK_ID == 3
extern void kernel(const int *, int *, size_t);
static int *a, *out;
static void setup(size_t n) {
    a = malloc(n * sizeof *a); out = malloc(n * sizeof *out);
    if (!a || !out) exit(3);
    for (size_t i = 0; i < n; ++i) a[i] = (int)(i % 101);
}
static void run(size_t n) { kernel(a, out, n); }
static uint64_t consume(void) { return (uint64_t)(unsigned)out[0]; }
#elif BENCHMARK_ID == 4
extern void kernel(const int *, int *, size_t);
static int *a, *out;
static void setup(size_t side) {
    size_t count = side * side;
    a = malloc(count * sizeof *a); out = calloc(count, sizeof *out);
    if (!a || !out) exit(3);
    for (size_t i = 0; i < count; ++i) a[i] = (int)(i % 13);
}
static void run(size_t side) { kernel(a, out, side); }
static uint64_t consume(void) { return (uint64_t)(unsigned)out[1025]; }
#elif BENCHMARK_ID == 5
extern void kernel(const int *, int *, size_t);
static int *a, *out;
static void setup(size_t n) {
    a = malloc(3 * n * sizeof *a); out = calloc(3 * n, sizeof *out);
    if (!a || !out) exit(3);
    for (size_t i = 0; i < 3 * n; ++i) a[i] = (int)(i % 97);
}
static void run(size_t n) { kernel(a, out, n); }
static uint64_t consume(void) { return (uint64_t)(unsigned)out[0]; }
#elif BENCHMARK_ID == 6
extern void kernel(const int *, const size_t *, int *, size_t);
static int *a, *out;
static size_t *index_data;
static void setup(size_t n) {
    a = malloc(n * sizeof *a); out = malloc(n * sizeof *out);
    index_data = malloc(n * sizeof *index_data);
    if (!a || !out || !index_data) exit(3);
    for (size_t i = 0; i < n; ++i) {
        a[i] = (int)(i % 101); index_data[i] = ((i * 73) ^ (i >> 3)) % n;
    }
}
static void run(size_t n) { kernel(a, index_data, out, n); }
static uint64_t consume(void) { return (uint64_t)(unsigned)out[0]; }
#elif BENCHMARK_ID == 7
extern void kernel(const unsigned char *, size_t, unsigned int *);
static unsigned char *a;
static unsigned int buckets[64];
static void setup(size_t n) {
    a = malloc(n); if (!a) exit(3);
    for (size_t i = 0; i < n; ++i) a[i] = (unsigned char)(((i * 37) ^ (i >> 4)) % 64);
}
static void run(size_t n) { kernel(a, n, buckets); }
static uint64_t consume(void) { return buckets[0]; }
#elif BENCHMARK_ID == 8
extern float kernel(const float *, size_t);
static float *a;
static volatile float result;
static void setup(size_t n) {
    a = malloc(n * sizeof *a); if (!a) exit(3);
    for (size_t i = 0; i < n; ++i) a[i] = 1.0f / (float)(i % 17 + 1);
}
static void run(size_t n) { result = kernel(a, n); }
static uint64_t consume(void) { return (uint64_t)result; }
#else
#error Unknown BENCHMARK_ID
#endif

static mach_timebase_info_data_t clock_timebase;

static uint64_t nanoseconds(void) {
    uint64_t ticks = mach_absolute_time();
    uint64_t whole = ticks / clock_timebase.denom;
    uint64_t remainder = ticks % clock_timebase.denom;
    return whole * clock_timebase.numer
        + remainder * clock_timebase.numer / clock_timebase.denom;
}

static volatile uint64_t sink;

static uint64_t batch(size_t n, unsigned iterations) {
    uint64_t start = nanoseconds();
    for (unsigned i = 0; i < iterations; ++i) run(n);
    uint64_t elapsed = nanoseconds() - start;
    sink += consume();
    return elapsed;
}

int main(int argc, char **argv) {
    if (mach_timebase_info(&clock_timebase) != KERN_SUCCESS
            || clock_timebase.numer == 0 || clock_timebase.denom == 0) return 5;
    if (argc != 3) return 2;
    size_t n = (size_t)strtoul(argv[1], NULL, 10);
    unsigned samples = (unsigned)strtoul(argv[2], NULL, 10);
    if (n == 0 || samples == 0 || samples > 100) return 2;
    setup(n);
    unsigned iterations = 1;
    while (batch(n, iterations) < 20000000ULL && iterations < 1024) iterations *= 2;
    for (int i = 0; i < 3; ++i) batch(n, iterations);
    puts("sample,iterations,total_ns,ns_per_call");
    for (unsigned i = 0; i < samples; ++i) {
        uint64_t elapsed = batch(n, iterations);
        printf("%u,%u,%llu,%.3f\n", i + 1, iterations,
               (unsigned long long)elapsed, (double)elapsed / iterations);
    }
    fprintf(stderr, "sink=%llu\n", (unsigned long long)sink);
    return 0;
}
