#include <stdio.h>
#include <stdlib.h>

/* Import from assembly code */
int tmult_ok_asm(int x, int y, int *dest);
unsigned umult_ok_asm(unsigned x, unsigned y, unsigned *dest);

/* $begin tmult_ok-proto-c */
/* Multiply x and y.  Store result at dest.
   Return 1 if multiplication did not overflow
*/
int tmult_ok(int x, int y, int *dest);
/* $end tmult_ok-proto-c */

/* $begin tmult_ok1-c */
/* First attempt.  Does not work */ 
int tmult_ok1(int x, int y, int *dest) 
{ 
    int result = 0; 
    *dest = x*y; 
    asm("setae %al"); 
    return result; 
} 
/* $end tmult_ok1-c */

/* $begin tmult_ok2-c */
int tmult_ok2(int x, int y, int *dest) 
{ 
    int result; 

    *dest = x*y; 
    asm("setae %%bl          # Set low-order byte\n\t"
	"movzbl %%bl,%[val]  # Zero extend to be result"  
	: [val] "=r" (result)  /* Output    */  
	:                      /* No inputs */  
	: "%bl"                /* Overwrites */  
	);  
    return result; 
} 
/* $end tmult_ok2-c */

/* $begin tmult_ok3-c */
/* Uses extended asm to get reliable code */
int tmult_ok3(int x, int y, int *dest) 
{
    unsigned char bresult; 
    *dest = x*y; 

    asm("setae %[b]            # Set result"  
	: [b] "=r" (bresult)  /* Output    */  
	);  

    return (int) bresult; 
} 
/* $end tmult_ok3-c */

/* $begin umult_ok-proto-c */
/* Multiply x and y.  Store result at dest.
   Return 1 if multiplication did not overflow
*/
int umult_ok(unsigned x, unsigned y, unsigned *dest);
/* $end umult_ok-proto-c */


/* $begin umult_ok-c */
int umult_ok(unsigned x, unsigned y, unsigned *dest) 
{ 
    unsigned char bresult; 

    asm("movl %[x],%%eax      # Get x\n\t"
	"mull %[y]            # Unsigned multiply by y\n\t"
	"movl %%eax,%[p]      # Store low-order 4 bytes at dest\n\t"
	"setae %[b]           # Set result"
	: [p] "=r" (*dest), [b] "=r" (bresult) /* Outputs    */  
	: [x] "r"  (x), [y] "r" (y)            /* Inputs     */  
	: "%eax", "%edx"                       /* Overwrites */ 
	); 

    return (int) bresult; 
} 
/* $end umult_ok-c */


int main(int argc, char *argv[]) {
    int sx, sy, sdest, sprod, sok;
    unsigned ux, uy, udest, uprod;
    int uok;
    int result;

    /* Default values
       should overflow with signed multiply, but not with unsigned */
    long int arg1 = 0x10000;
    long int arg2 = 0x0ffff;

    if (argc > 1)
	arg1 = strtol(argv[1], NULL, 0);

    if (argc > 2)
	arg2 = strtol(argv[2], NULL, 0);

    sx = (int) arg1;
    sy = (int) arg2;

    sok = sx == 0 || (sx*sy)/sx == sy;
    sprod = sx*sy;

    printf("Signed multiply: %d*%d->%d, ok = %d\n",
	   sx, sy, sx*sy, sok);

    /* test tmult_ok_asm */
    result = tmult_ok_asm(sx, sy, &sdest);
    printf("%s tmult_ok_asm: %d*%d->%d, ok = %d\n",
	   result == sok && sdest == sprod
	   ? "OK" : "ERR",
	   sx, sy, sdest, result);

    /* test tmult_ok1 */
    result = tmult_ok1(sx, sy, &sdest);
    printf("%s tmult_ok1: %d*%d->%d, ok = %d\n",
	   result == sok && sdest == sprod
	   ? "OK" : "ERR",
	   sx, sy, sdest, result);

    /* test tmult_ok2 */
    result = tmult_ok2(sx, sy, &sdest);
    printf("%s tmult_ok2: %d*%d->%d, ok = %d\n",
	   result == sok && sdest == sprod
	   ? "OK" : "ERR",
	   sx, sy, sdest, result);

    /* test tmult_ok2 */
    result = tmult_ok2(sx, sy, &sdest);
    printf("%s tmult_ok2: %d*%d->%d, ok = %d\n",
	   result == sok && sdest == sprod
	   ? "OK" : "ERR",
	   sx, sy, sdest, result);

    /* test tmult_ok3 */
    result = tmult_ok3(sx, sy, &sdest);
    printf("%s tmult_ok3: %d*%d->%d, ok = %d\n",
	   result == sok && sdest == sprod
	   ? "OK" : "ERR",
	   sx, sy, sdest, result);

    ux = (unsigned) arg1;
    uy = (unsigned) arg2;

    uok = ux == 0 || (ux*uy)/ux == uy; 
    uprod = ux*uy;

    printf("\nUnsigned multiply: %u*%u->%u, ok = %d\n",
	   ux, uy, ux*uy, uok);

    /* test umult_ok_asm */
    result = umult_ok_asm(ux, uy, &udest);
    printf("%s umult_ok_asm: %u*%u->%u, ok = %d\n",
	   result == uok && uprod == udest ? "OK" : "ERR",
	   ux, uy, udest, result);

    /* test umult_ok */
    result = umult_ok(ux, uy, &udest);
    printf("%s umult_ok: %u*%u->%u, ok = %d\n",
	   result == uok && uprod == udest ? "OK" : "ERR",
	   ux, uy, udest, result);
    
    exit(0);
} 
