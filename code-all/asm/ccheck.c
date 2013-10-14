/* Study the operation of canaries */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int shift = 0;

void report(int *cpos) {
    int cval = *cpos;
    printf("Pos = %p, value = 0x%x\n",
	   cpos, cval);
}

#define BSIZE 8
void fun(char *p) {
    char buf[BSIZE];
    /* Point to word just beyond buf */
    int *cpos = (int *) (buf + BSIZE);
    report(cpos);
    //    strcpy(buf, p);
}

int main(int argc, char *argv[]) {
    char *str = "Hi!";
    if (argc > 1)
	shift = atoi(argv[1]);
    fun(str);
    return 0;
}
