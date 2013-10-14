#include <stdio.h>
#include <stdlib.h>

typedef unsigned long long ull_t;

/* $begin ulmult_full-proto-c */
/* Multiply two n-bit numbers to get 2n-bit result,
   where n = 8*sizeof(unnsigned long)
*/
typedef unsigned long ulong_t;
void ulmult_full(ulong_t x, ulong_t y, ulong_t *dest);
/* $end ulmult_full-proto-c */

#ifdef IS_IA32
/* $begin ulmult_full-32-c */
/* 32-bit version */
void ulmult_full(ulong_t x, ulong_t y, ulong_t *dest) 
{ 
    asm("movl %[x],%%eax      # Get x\n\t"
	"mull %[y]            # Unsigned multiply by y\n\t"
	"movl %%eax,%[lo]     # Store low-order  4 bytes\n\t"
	"movl %%edx,%[hi]     # Store high-order 4 bytes"
	: [lo] "=r" (dest[0]), [hi] "=r" (dest[1]) /* Outputs    */  
	: [x] "r"  (x), [y] "r" (y)                /* Inputs     */  
	: "%eax", "%edx"                           /* Overwrites */ 
	);
} 
/* $end ulmult_full-32-c */
#else /* x86-64 */
/* $begin ulmult_full-64-c */
/* 64-bit version */
void ulmult_full(ulong_t x, ulong_t y, ulong_t *dest) 
{ 
    asm("movq %[x],%%rax      # Get x\n\t"
	"mulq %[y]            # Unsigned multiply by y\n\t"
	"movq %%rax,%[lo]     # Store low-order  8 bytes\n\t"
	"movq %%rdx,%[hi]     # Store high-order 8 bytes"
	: [lo] "=r" (dest[0]), [hi] "=r" (dest[1]) /* Outputs    */  
	: [x] "r"  (x), [y] "r" (y)                /* Inputs     */  
	: "%rax", "%rdx"                           /* Overwrites */ 
	);
} 
/* $end ulmult_full-64-c */
#endif

int main(int argc, char *argv[]) {
    ulong_t ux, uy, udest[2];

    /* Default values */
    ux = 0x10000lu;
    uy = 0x0fffflu;

    if (argc > 1)
	ux = strtoul(argv[1], NULL, 0);

    if (argc > 2)
	uy = strtoul(argv[2], NULL, 0);

    /* Test full multiply */
    ulmult_full(ux, uy, udest);
    #ifdef IS_IA32
    int uok;
    ull_t uresult =
	((ull_t) udest[1] << 32) + udest[0];
    ull_t uprod =
	(ull_t) ux * uy;
    uok = uresult == uprod;
    printf("Full multiply %lu (0x%lx) X %lu (0x%lx)\n  --> %llu (0x%llx), %s\n",
	   ux, ux, uy, uy, uprod, uprod,
	   uok ? "OK" : "ERR");
    if (!uok) {
	printf("Got %llu (0x%llx)n", uresult, uresult);
    }
    #else
    /* x86-64 */
    printf("Full multiply 0x%lx X 0x%lx\n  --> 0x%.16lx%.16lx\n",
	   ux, uy, udest[1], udest[0]);
    #endif
    
    exit(0);
} 
