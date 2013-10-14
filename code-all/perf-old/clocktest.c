
/* Code to test accuracy of interval clocks for measuring system performance */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/times.h>
#include <sys/times.h>

#include "load.h"
#include "fcyc.h"
#include "clock.h"
#include "options.h"
#include "lsquare.h"

/* Things to vary:
   + Program being measured
   + Load factor and type
   + Duration of activity being measured
*/

/* Want to know:
   + Classify each measurement series as either:
       Underestimate
       Overestimate
       Success
*/

/* Test procedure.  Something that is memory intensive */
#define MSIZE (1<<12)
#define MSTRIDE 1
#define MWT 3

int sink;

static int data[MSIZE];
void funct(int mcnt)
{
  int iter;
  int i;
  for (iter = 0; iter < mcnt*MWT; iter++) {
    /* Write array */
    for (i = 0; i < MSIZE; i += MSTRIDE)
      data[i] = i;
    /* Read it back */
    sink = 0;
    for (i = 0; i < MSIZE; i += MSTRIDE)
      sink += data[i];
  }
}

#define CLOCK2SEC(c) ((double) (c)/CLOCKS_PER_SEC)
#define TICK2SEC(c) ((double) (c)/CLK_TCK)

double Mhz = 0.0;

/* Use times function to compute time */
double time_funct(int clear_cache, int mcnt)
{
  struct tms tstart, tfinish;
  clock_t user;
  /* Warm up caches */
  funct(mcnt);
  if (clear_cache)
    /* Not implemented */
    ;
  times(&tstart);
  funct(mcnt);
  times(&tfinish);
  user = tfinish.tms_utime - tstart.tms_utime;
  return TICK2SEC(user) * 1e6 * Mhz;
}

/* Find absolute performance */
void find_abs_performance(double *intercept, double *slope,
			  int clear_cache,  int verbose)
{
  int min_param = 1;
  int pcount = 10;
  int i;
  /* Try to get precise measurements at max_params points */
  double *xval = calloc(pcount, sizeof(double));
  double *yval = calloc(pcount, sizeof(double));
  for (i = 0; i < pcount; i++) {
    xval[i] = i+min_param;
    yval[i] = fcyc_full(funct, i+min_param, clear_cache, 3, 0.00000, 1000);
  }
  /* Now perform least squares fit */
  *intercept = ls_intercept(xval, yval, pcount);
  *slope = ls_slope(xval, yval, pcount);
  if (verbose) {
    double avg_err = ls_error(xval, yval, pcount, LS_AVG);
    double max_err = ls_error(xval, yval, pcount, LS_MAX);
    printf("Slope = %0.1f, Intercept = %.1f, max err = %f, avg err = %f\n",
	   *slope, *intercept, max_err, avg_err);
  }
}

/* Express seconds in more meaningful units */
static void bigsecs(int x)
{
  int s,m,h,d,y;
  s = x % 60;
  x /= 60;
  m = x % 60;
  x /= 60;
  h = x % 24;
  x /= 24;
  d = x % 365;
  x /= 365;
  y = x;
  printf("%d y, %d d, %d h, %d m, %d s\n", y, d, h, m, s);
}

static void report_times()
{
    struct tms t;
    double ct = CLOCK2SEC(clock());
    double upt = TICK2SEC(times(&t));
    double ut = TICK2SEC(t.tms_utime);
    double st = TICK2SEC(t.tms_stime);
    double cut = TICK2SEC(t.tms_cutime);
    double cst = TICK2SEC(t.tms_cstime);
    printf("clock() = %.2f secs, time () =", ct);
    bigsecs(upt);

    printf("user = %.2f, sys = %.2f, children user = %.2f, children sys = %.2f, total = %.2f\n",
	   ut, st, cut, cst, ut+st+cut+cst);
}


int main(int argc, char *argv[])
{
  int load = 0;
  int minparam = 11;
  int pcount = 14;
  int linear = 0;
  int clear_cache = 0;
  double slope, intercept;
  int i,p;

  add_int_option("load", &load);
  add_int_option("minparam", &minparam);
  add_int_option("clear", &clear_cache);
  add_int_option("pcount", &pcount);
  add_int_option("linear", &linear);

  parse_options(argc, argv, NULL);
  show_options(stdout);

  Mhz = mhz_full(1, 10);
  printf("This processor has CLOCKS_PER_SEC = %d\n", CLOCKS_PER_SEC);
  printf("This processor has CLK_TCK = %d\n", CLK_TCK);
  /* Do callibrations */
  find_abs_performance(&intercept, &slope, clear_cache, 1);

  add_load(load, CACHE_LOAD);

  p = minparam;
  for (i = 0; i < pcount; i++)
  {
    double cycs;
    double expected = slope*p + intercept;
    double error;

    cycs = time_funct(clear_cache, p);

    printf("Cycs= %.0f, ms= %.3f",
	   cycs,
	   cycs / (1e3 * Mhz));
    error = (cycs-expected)/expected;
    printf(", Exp-cyc= %.1f, Exp-ms= %.3f, Actual-Err= %f\n", expected,
	   expected / (Mhz * 1e3), error);
    if (linear)
      p += minparam;
    else
      p *= 2;
  }
  report_times();
  printf("Killing children\n");
  kill_loads();
  report_times();
  return 0;
}




