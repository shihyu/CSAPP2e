/* Observe variations in stack pointer due to randomization */

#include <stdio.h>
#include <stdlib.h>

/* Allocate enugh space on stack to derandomize
   up to n bits of stack position */
#define DERANDOMIZE(n) { int p; alloca((int) &p & (1<<(n+1))-1); }


void stackpos() {
    int p;
    printf("New stack at %p\n", &p);
}

main(int argc, char *argv[]) {
    int n = 14;
    int p;
    printf("Initial stack at %p\n", &p);
    if (argc > 1)
	n = atoi(argv[1]);
    DERANDOMIZE(n);
    stackpos();
}
