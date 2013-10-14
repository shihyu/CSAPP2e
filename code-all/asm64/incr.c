#include <stdio.h>
#include <stdlib.h>
#ifdef TIME
#include "fcyc.h"
#endif

/*
  Increment stored value by y.
  Return new stored value (from CSAPP Section 3.2)
*/
int simple(int *xp, int y)
{
    int t = *xp + y;
    *xp = t;
    return t;
}

/* $begin simple_l-c */
long int simple_l(long int *xp, long int y)
{
    long int t = *xp + y;
    *xp = t;
    return t;
}
/* $end simple_l-c */

int call_simple()
{
    int v = 37;
    int z = simple(&v, 12);
    return v + z;
}
   
/* $begin call_simple_l-c */
long int gval1 = 567;
long int gval2 = 763;

long int call_simple_l()
{
    long int z = simple_l(&gval1, 12L);
    return z + gval2;
}
/* $end call_simple_l-c */

/*
  Increment stored value by y.
  Return original stored value
*/
int post_incr(int *xp, int y)
{
    int t = *xp;
    *xp = t + y;
    return t;
}

long int post_incr_l(long int *xp, long int y)
{
    long int t = *xp;
    *xp = t + y;
    return t;
}

#define NELE 512

int val[NELE];
long int val_l[NELE];

static void init()
{
    int i;
    for (i = 0; i < NELE; i++) {
	val[i] = random();
	val_l[i] = (long int) val[i];
    }
}

#ifdef TIME
volatile int store;
volatile long int store_l;

/* Test code ignores argument */
void test_simple(int *arg)
{
    int i;
    int result = 0;
    for (i = 0; i < NELE; i++) {
	result = simple(&val[i], result);
    }
    store = result;
}

/* Test code ignores argument */
void test_simple_l(int *arg)
{
    int i;
    long int result = 0;
    for (i = 0; i < NELE; i++) {
	result = simple_l(&val_l[i], result);
    }
    store_l = result;
}

double cpt(test_funct tf, int *arg2)
{
    double t = fcyc(tf, arg2);
    return t/NELE;
}
#endif

int main()
{
    init();
#ifdef TIME
    printf("Function: %s\tCPC = %.2f\n", "simple", cpt(test_simple, val));
    printf("Function: %s\tCPC = %.2f\n", "simple_l", cpt(test_simple_l, val));
#endif
    return 0;
}
