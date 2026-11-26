#include <stdio.h>
#include <stdlib.h>

enum { STRIDE = 3 };

void kernel(const int *restrict input, int *restrict output, size_t n) {
    /* TARGET_LOOP */
    for (size_t i = 0; i < n; ++i) {
        output[i * STRIDE] = input[i * STRIDE] * 2 + 1;
    }
}

int main(int argc, char **argv) {
    size_t n = argc > 1 ? (size_t)strtoul(argv[1], NULL, 10) : 32768;
    if (n < 1 || n > 1000000) return 2;
    size_t count = n * STRIDE;
    int *input = malloc(count * sizeof *input);
    int *output = calloc(count, sizeof *output);
    if (!input || !output) { free(input); free(output); return 3; }
    for (size_t i = 0; i < count; ++i) input[i] = (int)(i % 97);
    kernel(input, output, n);
    long long checksum = 0;
    for (size_t i = 0; i < count; ++i) {
        int expected = i % STRIDE == 0 ? (int)(i % 97) * 2 + 1 : 0;
        if (output[i] != expected) { free(input); free(output); return 4; }
        checksum += output[i];
    }
    printf("PASS strided n=%zu stride=%d checksum=%lld\n", n, STRIDE, checksum);
    free(input); free(output);
    return 0;
}
