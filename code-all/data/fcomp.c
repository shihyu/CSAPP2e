/* Test of floating point comparison */
#include <stdio.h>
#include <stdlib.h>

void do_nothing() {}

/* Set machine to double-precision rounding */
/* Based on material from B.J. Gough, "Introduction to GCC" */
void set_fpu_double() {
    unsigned mode = 0x27F;
    asm("fldcw %0" : : "m" (*&mode));
}


/* $begin fcomp1-c */
volatile int rcnt = 0;  /* Used to create side effects */

double recip(int denom) {
    rcnt++;   /* Side effect to prevent optimization */
    return 1.0/(double) denom;
}

int dequal(double x, double y) {
    return x==y; //line:data:compare
}

void test1(int denom) {
    double r1, r2;
    int t1, t2;
 
    r1 = recip(denom);    /* Stored in memory               */
    r2 = recip(denom);    /* Stored in register             */ //line:data:r1store
    t1 = r1 == r2;        /* Compares register to memory    */ //line:data:t1comp
    t2 = dequal(r1,r2);   /* Compares memory to memory      */ //line:data:t2comp
    printf("test1 t1: r1 %f %c= r2 %f\n", r1, t1 ? '=' : '!', r2);  
    printf("test1 t2: r1 %f %c= r2 %f\n", r1, t2 ? '=' : '!', r2);  
}
/* $end fcomp1-c */

/* $begin fcomp2-c */
void test2(int denom) {
    double r1;
    int t1;
    r1 = recip(denom);             /* Default: register, Forced store: memory */
    t1 = (r1 == 1.0/(double) denom); /* Compares register or memory to register */
    printf("test2 t1: r1 %f %c= 1.0/10.0\n", r1, t1 ? '=' : '!');  
}
/* $end fcomp2-c */

volatile int rlcnt = 0;  /* Used to create side effects */

/* $begin fcomp3-c */
long double recip_l(int denom) {
    return 1.0/(long double) denom;
}
/* $end fcomp3-c */


int dlequal(long double x, long double y) {
    return x==y;
}

void test3(int denom) {
    long double r1, r2;
    int t1, t2, t3;
 
    r1 = recip_l(denom); /* Stored in memory               */
    r2 = recip_l(denom); /* Stored in register             */
    t1 = r1 == r2;       /* Compares register to memory    */
    t2 = dlequal(r1, r2);       /* Compares memory to memory      */
    t3 = r1 == 1.0/(long double) denom; /* Compare memory to register */
    printf("test3 t1: r1 %f %c= r2 %f\n",
	   (double) r1, t1 ? '=' : '!', (double) r2);  
    printf("test3 t2: r1 %f %c= r2 %f\n",
	   (double) r1, t2 ? '=' : '!', (double) r2);  
    printf("test3 t3: r1 %f %c= 1.0/10.0\n",
	   (double) r1, t2 ? '=' : '!');  
}

int main(int argc, char *argv[]) {
    int denom = 10;
    /*
      int denom = atoi(argv[1]);
    */
    if (argc > 1)
	set_fpu_double();
    test1(denom);

    test2(denom);

    test3(denom);

    printf("A long double on this machine requires %d bytes\n", sizeof(long double));
    return 0;
}



