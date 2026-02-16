// example1.c

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static double random_double() {
    return (double) rand() / (double) RAND_MAX;
}

static double calculate(long n) {
    long inside = 0;
    srand(time(NULL));
    for (long i = 0; i < n; i++) {
        double x = random_double();
        double y = random_double();
        if (x*x + y*y <= 1.0)
            inside++;
    }
    return (double) inside * 4 / n;
}

int main(const int argc, const char *argv[]) {
    long n = 100000000;
    if (argc > 1)
        n = atol(argv[1]);
    printf("%lf\n", calculate(n));
    return 0;
}
