/* This is a useless procedure to force the following one
   to push a 8 bytes onto the stack */
int shrink(long long int z)
{
  return (int) z;
}

/* Demonstration of extended precision multiplication */
int prod(int x, int y)
{
  long long z = (long long) x*y;
  return shrink(z) + (int) z + (int) (z>>32);
}

/* This is a useless procedure to force the following one
   to push two int's onto the stack */
int combine(int x, int y)
{
  return x+y;
}

/* Demonstration of division */
int div(int u, int v)
{
  int x = u/v;
  int y = u%v;
  return combine(y,x) + (x+y);
}
