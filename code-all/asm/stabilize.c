/* Check stack stabilization code */

#include <stdio.h>
#include <stdlib.h>

void fun() {
    int local;
    printf("local at %p\n", &local);
}

int main(int argc, char *argv[]) {
    int buf[16];
    long bits = 0;
    if (argc > 1) {
	bits = atoi(argv[1]);
    }
    long mask = (1L<<bits)-1;
    long offset = (((long) buf) & mask);
    int *space = (int *) alloca(offset);
    *space = 0;
    fun();
    return 0;
}

