#include <stdio.h>
#include <stdlib.h>

void kernel(const int *restrict data, const size_t *restrict index,
            int *restrict output, size_t n) {
    /* TARGET_LOOP */
    for (size_t i = 0; i < n; ++i) {
        output[i] = data[index[i]] * 3 + 1;
    }
}

int main(int argc, char **argv) {
    size_t n = argc > 1 ? (size_t)strtoul(argv[1], NULL, 10) : 32768;
    if (n < 1 || n > 1000000) return 2;
    int *data = malloc(n * sizeof *data);
    size_t *index = malloc(n * sizeof *index);
    int *output = malloc(n * sizeof *output);
    if (!data || !index || !output) {
        free(data); free(index); free(output); return 3;
    }
    for (size_t i = 0; i < n; ++i) {
        data[i] = (int)(i % 101);
        index[i] = ((i * 73) ^ (i >> 3)) % n;
    }
    kernel(data, index, output, n);
    long long checksum = 0;
    for (size_t i = 0; i < n; ++i) {
        int expected = (int)(index[i] % 101) * 3 + 1;
        if (output[i] != expected) {
            free(data); free(index); free(output); return 4;
        }
        checksum += output[i];
    }
    printf("PASS indirect_gather n=%zu checksum=%lld\n", n, checksum);
    free(data); free(index); free(output);
    return 0;
}
