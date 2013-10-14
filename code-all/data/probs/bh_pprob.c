/* Practice problem converting between hex & binary */

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <unistd.h>

#include "cvt.h"

/* Make table with some binary / hex conversions */
void prob(int cnt, int solve)
{
  /* Generate table with cnt conversions, alternating hex to bin & bin to hex */
  int i;
  for (i = 0; i < cnt; i++) {
    lli_t x = random_value(24);
    char *hexval = make_tt(i2fX(x, 6));
    char *binval = make_math(i2b(x, 24));
    if (solve) {
      printf(make_row(hexval, binval, NULL));
    } else {
      if (i & 0x1)
	printf(make_row(hexval, "", NULL));
      else
	printf(make_row("", binval, NULL));
    }
  }
}

void usage(char *cmd)
{
  printf("Usage: %s [-s] [-n cnt] [-r seed]\n", cmd);
  printf("\t-s\tSolution\n");
  printf("\t-n cnt\tNumber of conversions\n");
  printf("\t-r seed\tInitial seed\n");
}

int main(int argc, char *argv[])
{
  int solve = 0;
  int cnt = 4;
  int seed = 0;
  int c;
  while ((c = getopt(argc, argv, "sn:r:")) != -1) {
    switch(c) {
    case 's':
      solve = 1;
      break;
    case 'n':
      cnt = atoi(optarg);
      break;
    case 'r':
      seed = atoi(optarg);
      break;
    default:
      usage(argv[0]);
      exit(0);
    }
  }
  srandom(seed);
  prob(cnt, solve);
  return 0;
}
