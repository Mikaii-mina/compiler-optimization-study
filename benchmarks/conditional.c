#include <stdio.h>
#include <stdlib.h>

void kernel(const int *restrict a, int *restrict out, size_t n) {
    /* TARGET_LOOP */
    for (size_t i = 0; i < n; ++i) {
        if (a[i] > 50) out[i] = a[i] * 2;
        else out[i] = a[i] + 3;
    }
}

int main(int argc, char **argv) {
    size_t n = argc > 1 ? (size_t)strtoul(argv[1], NULL, 10) : 32768;
    if (n < 1 || n > 1000000) return 2;
    int *a = malloc(n * sizeof *a), *out = malloc(n * sizeof *out);
    if (!a || !out) return 3;
    for (size_t i = 0; i < n; ++i) a[i] = (int)(i % 101);
    kernel(a, out, n);
    long long checksum = 0;
    for (size_t i = 0; i < n; ++i) {
        int expected = (int)(i % 101);
        expected = expected > 50 ? expected * 2 : expected + 3;
        if (out[i] != expected) return 4;
        checksum += out[i];
    }
    printf("PASS conditional n=%zu checksum=%lld\n", n, checksum);
    free(a); free(out);
    return 0;
}
