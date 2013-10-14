/* Simple procedure to illustrate assembly code formatting */

/* $begin simple-c */
int simple(int *xp, int y)
{
  int t = *xp + y;
  *xp = t;
  return t;
}
/* $end simple-c */
