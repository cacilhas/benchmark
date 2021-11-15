#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define POPULATION 100

static int cmpint(const void*, const void*);

int main() {
    /* Setup */
    time_t t;
    time(&t);
    srand((unsigned int) t);
    u_int32_t data[POPULATION];
    for (size_t i = 0; i < POPULATION; ++i)
        data[i] = (u_int32_t) rand() % 100;

    /* Process */
    qsort(
        data,
        POPULATION,
        sizeof(u_int32_t),
        (int (*)(const void *, const void *)) cmpint
    );

    /* Output */
    for (size_t i = 0; i < POPULATION; ++i)
        printf("%u\t", data[i]);
    printf("\n");

    return EXIT_SUCCESS;
}

int cmpint(const void *a, const void *b) {
    return *(u_int32_t *) a - *(u_int32_t *) b;
}
