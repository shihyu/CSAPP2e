#include <stdio.h>
#include <stdlib.h>

/* 
 * NOTE: This code is supposed to get a compiler warning:
 * 
 * printf.c: In function `main':
 * printf.c:8: warning: decimal constant is so large that it is unsigned 
*/

int main ()
{
    /* $begin printf */
    int x = -1;
    unsigned u = 2147483648; /* 2 to the 31st */

    printf("x = %u = %d\n", x, x);
    printf("u = %u = %d\n", u, u);
    /* $end printf */

    exit(0);
}
