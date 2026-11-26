#include <stdio.h>
#include <stdlib.h>

enum { BUCKETS = 64 };

void kernel(const unsigned char *restrict input, size_t n,
            unsigned int *restrict buckets) {
    /* TARGET_LOOP */
    for (size_t i = 0; i < n; ++i) {
        ++buckets[input[i]];
    }
}

int main(int argc, char **argv) {
    size_t n = argc > 1 ? (size_t)strtoul(argv[1], NULL, 10) : 32768;
    if (n < 1 || n > 1000000) return 2;
    unsigned char *input = malloc(n * sizeof *input);
    if (!input) return 3;
    unsigned int buckets[BUCKETS] = {0};
    unsigned int expected[BUCKETS] = {0};
    for (size_t i = 0; i < n; ++i) {
        input[i] = (unsigned char)(((i * 37) ^ (i >> 4)) % BUCKETS);
    }
    kernel(input, n, buckets);
    for (size_t i = 0; i < n; ++i) ++expected[input[i]];
    unsigned long long checksum = 0;
    for (size_t bucket = 0; bucket < BUCKETS; ++bucket) {
        if (buckets[bucket] != expected[bucket]) { free(input); return 4; }
        checksum += (bucket + 1) * buckets[bucket];
    }
    printf("PASS histogram n=%zu buckets=%d checksum=%llu\n",
           n, BUCKETS, checksum);
    free(input);
    return 0;
}
