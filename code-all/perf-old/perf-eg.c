/* Example of code to demonstrate performance effects */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "clock.h"


int wait = 0; /* Should I wait to report all statistics at the end? */

#define MAXSAMPLE 40
char *keys[MAXSAMPLE];
double milliseconds[MAXSAMPLE];
int cycles[MAXSAMPLE];
int samples = 0;

#define DSIZE (1<<22)
double data[DSIZE*2];

int size = DSIZE;
double *a, *b;

#define BSIZE (1<<22)
double dump[BSIZE];

double Mhz;

void init(int sz)
{
  int i;
  size = sz;
  a = data;
  b = data+sz;

  for (i = 0; i < size; i++)
    a[i] = b[i] = 3.0;
  for (i = 0; i < BSIZE; i++)
    dump[i] = 3.0;
  printf("Array Size = %d (%.2fKB)\n",
	 size, (double) (size*sizeof(double))/1024);
  Mhz = mhz(1);
}

int sink;

void code(double *d)
{
  int i;
  int sum = 0;
  for (i = 0; i < size; i++)
    sum += d[i];
  sink = sum;
}

void proc()
{
  int i;
  double val = sink;
  for (i = 0; i < size; i++)
    val += val;
  sink = val;
}


void code1(double *d1, double *d2)
{
  int i;
  int sum = 0;
  for (i = 0; i < size; i++)
    sum += d1[i];
  for (i = 0; i < size; i++)
    sum += d2[i];
  sink = sum;
}

void code2(double *d1, double *d2)
{
  int i;
  int sum = 0;
  for (i = 0; i < size; i++)
    sum += d1[i];
  for (i = 0; i < size; i++)
    sum += d2[i];
  sink = sum;
}

void measure1(double *dat, char *name)
{
  double d = ovhd();
  int cyc;
  double msecs;
  start_counter();
  code(dat);
  cyc = (int) (get_counter() - d);
  msecs = (double) cyc / (1e3 * Mhz);
  if (wait) {
    keys[samples] = name;
    milliseconds[samples] = msecs;
    cycles[samples++] = cyc;
  } else
    printf("%s: %d cycles, %.5f milliseconds \n", name, cyc, msecs);
}

typedef void (*test_funct)(double *, double *); 

void measure(test_funct f, char *name)
{
  double d = ovhd();
  int cyc;
  double msecs;
  start_counter();
  f(a, b);
  cyc = (int) (get_counter() - d);
  msecs = (double) cyc / (1e3 * Mhz);
  if (wait) {
    keys[samples] = name;
    milliseconds[samples] = msecs;
    cycles[samples++] = cyc;
  } else
    printf("%s: %d cycles, %.5f milliseconds \n", name, cyc, msecs);
}

void report()
{
  int i;
  for (i = 0; i < samples; i++) {
    printf("%s: %d cycles, %.5f milliseconds \n",
	   keys[i], cycles[i], milliseconds[i]);    
  }
}


/* User provides pattern, indicating to run one of
   two procedures or to sleep. */

void run(char *pattern) {
  int c;
  while ((c = *pattern++) != 0) {
    switch(c) {
    case 'a':
      measure1(a, "a");
      break;
    case 'b':
      measure1(b, "b");
      break;
    case 'c':
    case '1':
      measure(code1, "code1");
      break;
    case '2':
      measure(code2, "code2");
      break;
    case 's':
      sleep(1);
      printf("sleep\n");
      break;
    default:
      printf("Unrecognized command '%c'\n", c);
      break;
    }
  }
}

void usage(char *pname)
{
  printf("Usage: %s [-w] [-l LOGSIZE] [-L SIZE] [-p PATTERN]\n", pname);
  exit(0);
}



int main(int argc, char *argv[])
{
  char *pattern = "12s21s12s21";
  int i;
  int sz = DSIZE;
  for (i = 1; i < argc; i++) {
    if (*argv[i] != '-')
      usage(argv[0]);
    switch (argv[i][1]) {
    case 'w':
      wait = 1;
      break;
    case 'p':
      pattern = argv[++i];
      break;
    case 'l':
      sz = 1 << atoi(argv[++i]);
      break;
    case 'L':
      sz = atoi(argv[++i]);
      break;
    default:
      usage(argv[0]);
    }
  }
  init(sz);
  run(pattern);
  if (wait)
    report();
  return 0;
}
