/* Test fcyc */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include "clock.h"
#include "fcyc.h"


void fun1(int n)
{
  sleep(n);
}

#define ITER 500000
double sink = 1.0;
void fun(int n)
{
  int i;
  double x = 1;
  int cnt = ITER*n;
  for (i = 0; i < cnt; i++)
    x = x*1.00001;
  sink = x;
}


static double Mhz = 0.0;

double cyc2msec(double c)
{
  if (Mhz == 0.0)
    Mhz = mhz(1);
  return c /(Mhz*1e3);
}

int main(int argc, char *argv[])
{
  int maxn = 5;
  int i;
  for (i = 1; i <= maxn; i++) {
    double c = fcyc(fun, i, 0);
    double ms = cyc2msec(c);
    double ct = fcyc_tod(fun, i, 0);
    double mst = cyc2msec(ct);
    printf("i = %d.  Cycle Counter: %.0f cycles (%.2fms), TOD: %.0f cycles (%.2fms)\n",
	   i, c, ms, ct, mst);
  }
  return 0;
}
