#include <stdlib.h>
#include <stdio.h>

#include "clock.h"


int main (int argc, char *argv[])
{
  int iters = 1000000;
  double MHz = mhz(1);
  int i;
  int sum = 0;
  double cycs;
  start_counter();
  for (i = 0; i < iters; i++) {
    sum += i;
    cycs = get_counter();
  }
  printf("%d calls in %.0f clock cycles = %.3f usec/call\n",
	 iters, cycs, cycs / (MHz * iters));
  return 0;
}
