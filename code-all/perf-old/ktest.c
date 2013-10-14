/* Code to test kbest method of measuring performance */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "load.h"
#include "fcyc.h"
#include "clock.h"
#include "options.h"
#include "lsquare.h"

/* Things to vary:
   + Program being measured
   + Load factor and type
   + Parameters k, epsilon, maxsamples
   + Duration of activity being measured
*/

/* Want to know:
   + Classify each measurement series as either:
       Underestimate
       Overestimate
       Success
       Nonconvergent
   + How many tests to get convergence
*/

/* Test procedure.  Something that is memory intensive */
#define MSIZE (1<<12)

#ifndef MSTRIDE
#define MSTRIDE 1
#endif
#define MWT 3

int sink;

static int data[MSIZE];
/* Normal function being tested is very cache intensive */
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

/* CPU-intensive test function */
void cpufunct(int mcnt)
{
  int iter;
  int i;
  int t = 0;
  sink = 0;
  for (iter = 0; iter < mcnt*MWT; iter++) {
    /* Operation that requires multiple cycles */
    for (i = 0; i < MSIZE; i += MSTRIDE)
      t += (i * i) * i;
  }
  sink = t;
}

double Mhz = 0.0;

/* Find absolute performance */
void find_abs_performance(double *intercept, double *slope,
			  int clear_cache,  int verbose, int cpubench)
{
  int min_param = 1;
  int pcount = 10;
  int i;
  /* Try to get precise measurements at max_params points */
  double *xval = calloc(pcount, sizeof(double));
  double *yval = calloc(pcount, sizeof(double));
  for (i = 0; i < pcount; i++) {
    xval[i] = i+min_param;
    if (cpubench)
      yval[i] = fcyc_full(cpufunct, i+min_param, clear_cache, 3, 0.00000, 1000, 0);
    else
      yval[i] = fcyc_full(funct, i+min_param, clear_cache, 3, 0.00000, 1000, 0);      
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

int main(int argc, char *argv[])
{
  int load = 0;
  int k = 3;
  double epsilon = 0.001;
  int maxsamples = 100;
  int minparam = 11;
  int pcount = 14;
  int lcount = 1;
  int clear_cache = 0;
  int tod = 0;
  double slope, intercept;
  int i,p,bcount;
  int cpubench = 0;
  int compensate = 0;
  int sleeptime = 10;

  add_int_option("load", &load);
  add_int_option("k", &k);
  add_double_option("epsilon", &epsilon);
  add_int_option("maxsamples", &maxsamples);
  add_int_option("minparam", &minparam);
  add_int_option("clear", &clear_cache);
  add_int_option("pcount", &pcount);
  add_int_option("lcount", &lcount);
  add_int_option("cpubench", &cpubench);
  add_int_option("tod", &tod);
  add_int_option("compensate", &compensate);
  add_int_option("sleeptime", &sleeptime);
  

  parse_options(argc, argv, NULL);
  show_options(stdout);

  Mhz = mhz_full(1,sleeptime);
  /* Do callibrations */
  find_abs_performance(&intercept, &slope, clear_cache, 1, cpubench);

  add_load(load, CACHE_LOAD);

  p = minparam;
  bcount = lcount;
  for (i = 0; i < pcount; i++)
  {
    double cycs;
    double expected = slope*p + intercept;
    double error;
    if (tod) {
      if (cpubench) 
	cycs = fcyc_full_tod(cpufunct, p, clear_cache, k, epsilon, maxsamples, compensate);
      else {
	cycs = fcyc_full_tod(funct, p, clear_cache, k, epsilon, maxsamples, compensate);
      }
    } else {
      if (cpubench)
	cycs = fcyc_full(cpufunct, p, clear_cache,
			 k, epsilon, maxsamples, compensate);
      else {
	cycs = fcyc_full(funct, p, clear_cache,
			 k, epsilon, maxsamples, compensate);
      }
    }
    printf("Iters= %d, Err= %0.4f, Cycs= %.0f, ms= %.3f",
	   has_converged(k, epsilon, maxsamples), err(k), cycs,
	   cycs / (1e3 * Mhz));
    error = (cycs-expected)/expected;
    printf(", Exp-cyc= %.1f, Exp-ms= %.3f, Actual-Err= %f\n", expected,
	   expected / (Mhz * 1e3), error);
    p += minparam;
    bcount--;
    if (bcount == 0) {
      bcount = lcount;
      minparam += 2;
    }
  }
  kill_loads();
  return 0;
}
