#include <stdlib.h>
#include <stdio.h>
#include <signal.h>

void float_handler(int sig) {
  printf("Caught FPE signal\n");
}

float b2f(unsigned int b)
{
  union {
    float f;
    unsigned u;
  } b4;
  b4.u = b;
  return b4.f;
}

typedef enum {NEG, ZERO, POS, OTHER} range_t;

char *ranges[4] = {"negative", "zero", "positive", "other"};

range_t find_range(float x)
{
  if (x < 0)
    return NEG;
  if (x == 0)
    return ZERO;
  if (x > 0)
    return POS;
  return OTHER;
}

int main(int argc, char *argv[])
{
  int i;
  float last_f = 0.0;
  signal(SIGFPE, float_handler);
  for (i = 1; i < argc; i++) {
    unsigned x = strtoul(argv[i], NULL, 0);
    float f = b2f(x);
    range_t r = find_range(f);
    char ce = (f == f) ? '=' : '!';
    printf("%g (0x%.8x) is %s.  %g %c= %g\n",
	   f, x, ranges[r], f, ce, f);
    if (i > 1) {
      char c = (f == last_f) ? '=' : '!';
      printf("\t%g %c= %g\n", f, c, last_f);
    }
    last_f = f;
  }
  return 0;
}
