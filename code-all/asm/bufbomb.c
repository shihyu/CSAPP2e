/* Bomb program that is solved using a buffer overflow attack */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

/* Like gets, except that characters are typed as pairs of hex digits.
   Nondigit characters are ignored.  Stops when encounters newline */
char *getxs(char *dest)
{
    int c;
    int even = 1; /* Have read even number of digits */
    int otherd = 0; /* Other hex digit of pair */
    char *sp = dest;
    while ((c = getchar()) != EOF && c != '\n') {
	if (isxdigit(c)) {
	    int val;
	    if ('0' <= c && c <= '9')
		val = c - '0';
	    else if ('A' <= c && c <= 'F')
		val = c - 'A' + 10;
	    else
		val = c - 'a' + 10;
	    if (even) {
		otherd = val;
		even = 0;
	    } else {
		*sp++ = otherd * 16 + val;
		even = 1;
	    }
	}
    }
    *sp++ = '\0';
    return dest;
}

/* $begin getbuf-c */
int getbuf()
{
    char buf[12];
    getxs(buf);
    return 1;
}

void test()
{
    int val;
    int array[1];
    printf("Local variable at %p\n", array);
    printf("Type Hex string:");
    val = getbuf();
    printf("getbuf returned 0x%x\n", val);
}
/* $end getbuf-c */

int main()
{

    int buf[16];
    /* This little hack is an attempt to get the stack to be in a
       stable position.  By experiment, found that position of stack
       varies by one program execution to the next, but only in the low
       order 23 bits.
    */
    int offset = (((int) buf) & 0x7FFFFF);
    int *space = (int *) alloca(offset);
    *space = 0; /* So that don't get complaint of unused variable */
    printf("Added offset 0x%x, should move stack to around %p\n",
	   offset, (char *) buf - offset);
    test();
    return 0;
}

