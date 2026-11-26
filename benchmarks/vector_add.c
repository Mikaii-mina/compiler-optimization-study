#include <stdio.h>
#include <stdlib.h>

void kernel(const int *restrict a, const int *restrict b, int *restrict out, size_t n) {
    /* TARGET_LOOP */
    for (size_t i = 0; i < n; ++i) {
        out[i] = a[i] + b[i];
    }
}

int main(int argc, char **argv) {
    size_t n = argc > 1 ? (size_t)strtoul(argv[1], NULL, 10) : 32768;
    if (n < 1 || n > 1000000) return 2;
    int *a = malloc(n * sizeof *a), *b = malloc(n * sizeof *b), *out = malloc(n * sizeof *out);
    if (!a || !b || !out) return 3;
    for (size_t i = 0; i < n; ++i) { a[i] = (int)(i % 97); b[i] = (int)(i % 31); }
    kernel(a, b, out, n);
    long long checksum = 0;
    for (size_t i = 0; i < n; ++i) {
        if (out[i] != (int)(i % 97 + i % 31)) return 4;
        checksum += out[i];
    }
    printf("PASS vector_add n=%zu checksum=%lld\n", n, checksum);
    free(a); free(b); free(out);
    return 0;
}
