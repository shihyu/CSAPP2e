#include <stdio.h>
#include <stdlib.h>
#include "fcyc.h"

/* $begin max */
/* Return maximum of x and y */
int max(int x, int y)
{
    return (x < y) ? y : x;
}
/* $end max */

int bmax(int x, int y)
{
    int mask = -(x>y);
    return (mask & x) | (~mask & y);
}

int bvmax(int x, int y)
{
    volatile int t = (x>y);
    int mask = -t;
    return (mask & x) | (~mask & y);
}

int cmax(int x, int y)
{
    int result = y;
    asm("cmpl %1, %2;cmovll %1,%0"
        : "=r" (result) /* Output */
        : "r" (x), "r" (y) /* Inputs */
    );
    return result;
}

volatile int tcnt = 0;
int bjtmax(int x, int y)
{
    if (x < y) {
	tcnt++;
	return y;
    }
    return x;
}

volatile int ecnt = 0;
int bjemax(int x, int y)
{
    if (x < y) {
	return y;
    }
    ecnt++;
    return x;
}

#define NELE 512

int one[NELE];
int zero[NELE];
int pm1[NELE];
int m1[NELE];

static void init()
{
    int i;
    for (i = 0; i < NELE; i++) {
	one[i] = 1;
	zero[i] = 0;
	m1[i] = -1;
	pm1[i] = random() & 0x1 ? 1 : -1;
    }
}

volatile int cnt;
/* Test routines */
void test_max(int *arg2)
{
    int i;
    int msum = 0;
    for (i = 0; i < NELE; i++)
	msum += max(zero[i], arg2[i]);
    cnt = msum;
}

void test_bmax(int *arg2)
{
    int i;
    int msum = 0;
    for (i = 0; i < NELE; i++)
	msum += bmax(zero[i], arg2[i]);
    cnt = msum;
}

void test_bvmax(int *arg2)
{
    int i;
    int msum = 0;
    for (i = 0; i < NELE; i++)
	msum += bvmax(zero[i], arg2[i]);
    cnt = msum;
}

void test_cmax(int *arg2)
{
    int i;
    int msum = 0;
    for (i = 0; i < NELE; i++)
	msum += cmax(zero[i], arg2[i]);
    cnt = msum;
}

void test_bjtmax(int *arg2)
{
    int i;
    int msum = 0;
    for (i = 0; i < NELE; i++)
	msum += bjtmax(zero[i], arg2[i]);
    cnt = msum;
}

void test_bjemax(int *arg2)
{
    int i;
    int msum = 0;
    for (i = 0; i < NELE; i++)
	msum += bjemax(zero[i], arg2[i]);
    cnt = msum;
}

void test_ref(int *arg2)
{
    int i;
    int msum = 0;
    for (i = 0; i < NELE; i++)
	msum += (zero[i]+arg2[i]);
    cnt = msum;
}

double cpt(test_funct tf, int *arg2)
{
    double t = fcyc(tf, arg2);
    return t/NELE;
}

void run_tests(test_funct tf, char *descr)
{
    printf("Function: %s\tmax(0, +1)\tCPT = %.2f\n", descr, cpt(tf, one));
    printf("Function: %s\tmax(0, -1)\tCPT = %.2f\n", descr, cpt(tf, m1));
    printf("Function: %s\tmax(0,+-1)\tCPT = %.2f\n", descr, cpt(tf, pm1));
}

int main()
{
    init();
    run_tests((test_funct) test_max, "max");
    run_tests((test_funct) test_bmax, "bmax");
    run_tests((test_funct) test_bvmax, "bvmax");
    run_tests((test_funct) test_cmax, "cmax");
    run_tests((test_funct) test_bjtmax, "bjtmax");
    run_tests((test_funct) test_bjemax, "bjemax");
    run_tests((test_funct) test_ref, "reference");
    return 0;
}
