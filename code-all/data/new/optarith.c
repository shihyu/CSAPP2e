/* $begin opt-arith-ans */
#define M 15
#define N 4
/* $end opt-arith-ans */

#if 0

/* $begin opt-arith-ques */
#define M      /* Mystery number 1 */
#define N      /* Mystery number 2 */
/* $end opt-arith-ques */

#endif

/* $begin opt-arith-ques */
int arith(int x, int y)
{
  int result = 0;
  result = x*M + y/N; /* M and N are mystery numbers. */
  return result;
}
/* $end opt-arith-ques */

/* $begin opt-arith-pseudo */
/* Translation of assembly code for arith */
int optarith(int x, int y)
{
  int t = x;
  x <<= 4;
  x -= t;
  if (y < 0) y += 3;
  y >>= 2;  /* Arithmetic shift */
  return x+y;
}
/* $end opt-arith-pseudo */

int main(int argc, char *argv[])
{
  int x = atoi(argv[1]);
  int y = atoi(argv[2]);
  int a = arith(x,y);
  int b = optarith(x,y);
  if (a != b)
    printf("Whoops! ");
  printf("x = %d, y = %d, normal --> %d, opt --> %d\n", x, y, a, b);
}
