#include <stdio.h>
#include <stdlib.h>

int kernel(const int *restrict a, size_t n) {
    int sum = 0;
    /* TARGET_LOOP */
    for (size_t i = 0; i < n; ++i) {
        sum += a[i];
    }
    return sum;
}

int main(int argc, char **argv) {
    size_t n = argc > 1 ? (size_t)strtoul(argv[1], NULL, 10) : 32768;
    if (n < 1 || n > 1000000) return 2;
    int *a = malloc(n * sizeof *a);
    if (!a) return 3;
    for (size_t i = 0; i < n; ++i) a[i] = (int)(i % 17);
    int result = kernel(a, n);
    int expected = 0;
    for (size_t i = 0; i < n; ++i) expected += (int)(i % 17);
    if (result != expected) return 4;
    printf("PASS reduction n=%zu checksum=%d\n", n, result);
    free(a);
    return 0;
}
