#include <math.h>
#include <stdio.h>
#include <stdlib.h>

float kernel(const float *restrict input, size_t n) {
    float sum = 0.0f;
    /* TARGET_LOOP */
    for (size_t i = 0; i < n; ++i) {
        sum += input[i];
    }
    return sum;
}

int main(int argc, char **argv) {
    size_t n = argc > 1 ? (size_t)strtoul(argv[1], NULL, 10) : 32768;
    if (n < 1 || n > 1000000) return 2;
    float *input = malloc(n * sizeof *input);
    if (!input) return 3;
    for (size_t i = 0; i < n; ++i) input[i] = 1.0f / (float)(i % 17 + 1);
    float result = kernel(input, n);
    double reference = 0.0;
    for (size_t i = 0; i < n; ++i) reference += (double)input[i];
    double error = fabs((double)result - reference);
    double tolerance = 0.001 * fmax(1.0, fabs(reference));
    if (!isfinite(result) || error > tolerance) { free(input); return 4; }
    printf("PASS float_reduction n=%zu sum=%.9g reference=%.9g\n",
           n, result, reference);
    free(input);
    return 0;
}
