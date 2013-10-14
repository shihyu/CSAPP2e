/* Check stack variations */
#include <stdio.h>
#include <stdlib.h>

/* $begin scheck-c */
int main() {
    int local;
    printf("local at %p\n", &local);
    return 0;
}
/* $end scheck-c */
