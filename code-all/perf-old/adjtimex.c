#include <stdio.h>
#include <stdlib.h>
#include <sys/timex.h>

/* Test of adjtimex function */

struct timex t;

main()
{
  int rval;
  t.modes = 0;
  rval = adjtimex(&t);
  printf("Returned %d\n", rval);
  printf("Offset = %d\n", t.offset);
  printf("freq = %d\n", t.freq);
  printf("maxerror = %d\n", t.maxerror);
  printf("esterror = %d\n", t.esterror);
  printf("status = %d\n", t.status);
  printf("constant = %d\n", t.constant);
  printf("precision = %d\n", t.precision);
  printf("tolerance = %d\n", t.tolerance);
  printf("tick = %d\n", t.tick);
  return 0;
}
