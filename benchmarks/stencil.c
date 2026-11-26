#include <stdio.h>
#include <stdlib.h>

void kernel(const int *restrict input, int *restrict output, size_t side) {
    for (size_t row = 1; row + 1 < side; ++row) {
        /* TARGET_LOOP */
        for (size_t col = 1; col + 1 < side; ++col) {
            size_t pos = row * side + col;
            output[pos] = input[pos] + input[pos - side] + input[pos + side]
                        + input[pos - 1] + input[pos + 1];
        }
    }
}

int main(int argc, char **argv) {
    size_t side = argc > 1 ? (size_t)strtoul(argv[1], NULL, 10) : 256;
    if (side < 3 || side > 1024) return 2;
    size_t count = side * side;
    int *input = malloc(count * sizeof *input);
    int *output = calloc(count, sizeof *output);
    if (!input || !output) { free(input); free(output); return 3; }
    for (size_t i = 0; i < count; ++i) input[i] = (int)(i % 13);
    kernel(input, output, side);
    long long checksum = 0;
    for (size_t row = 0; row < side; ++row) {
        for (size_t col = 0; col < side; ++col) {
            size_t pos = row * side + col;
            int expected = 0;
            if (row > 0 && row + 1 < side && col > 0 && col + 1 < side) {
                expected = (int)(pos % 13 + (pos - side) % 13 +
                                 (pos + side) % 13 + (pos - 1) % 13 +
                                 (pos + 1) % 13);
            }
            if (output[pos] != expected) { free(input); free(output); return 4; }
            checksum += output[pos];
        }
    }
    printf("PASS stencil side=%zu checksum=%lld\n", side, checksum);
    free(input); free(output);
    return 0;
}
