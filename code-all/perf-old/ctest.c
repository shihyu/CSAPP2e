/* Test of cache effects */
#include <stdio.h>
#include <stdlib.h>
#include "clock.h"

double data[8*50];

double *b1, *b2, *b3;

void procA(double *p)
{
  p[0] = 0.0;
  p[1] = 0.0;
  p[2] = 0.0;
  p[3] = 0.0;
  p[4] = 0.0;
  p[5] = 0.0;
  p[6] = 0.0;
  p[7] = 0.0;
}

int sink;
/* Something to make sure the two procs are in different cache blocks */
void fillproc(int x)
{
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
}

void procB(double *p)
{
  p[0] = 0.0;
  p[1] = 0.0;
  p[2] = 0.0;
  p[3] = 0.0;
  p[4] = 0.0;
  p[5] = 0.0;
  p[6] = 0.0;
  p[7] = 0.0;
}

/* Something to make sure the two procs are in different cache blocks */
void fillproc2(int x)
{
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
}

#define NTIMES 8
double times[NTIMES];

/* Function to be tested takes pointer to double and integer as arguments */
typedef void (*test_funct)(double *); 

double time_funct(test_funct f, double *a)
{
  start_counter();
  f(a);
  return get_counter();
}

/* Something to make sure the two procs are in different cache blocks */
void fillproc3(int x)
{
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
  sink += x;
}

void setup_pointers()
{
  int pd = (int) data;
  while (pd & 0x1F)
    pd++;
  b1 = (double *) pd;
  b2 = b1 + 16;
  b3 = b2 + 16;
}

#define CBYTES (1<<19)
#define CINTS (CBYTES/sizeof(int))
int junk[CINTS];
int sink2;

void clear_cache()
{
  int i;
  int sum = 0;
  for (i = 0; i < CINTS; i++)
    junk[i] = 3;
  for (i = 0; i < CINTS; i++)
    sum += junk[i];
  sink2 = sum;
}

int main(int argc, char *argv[])
{
  /* Initialize times to get them in the cache */
  int i, n;
  clear_cache();
  setup_pointers();
  for (i = 0; i < NTIMES; i++)
    times[i] = 0.0;
  n = 0;
  times[n++] = time_funct(procA, b1);
  times[n++] = time_funct(procA, b2);
  times[n++] = time_funct(procA, b3);
  times[n++] = time_funct(procA, b1);
  times[n++] = time_funct(procB, b1);
  times[n++] = time_funct(procB, b2);
  for (i = 0; i < n; i++)
    printf("%.0f cycles\n", times[i]);
  return 0;  
}
