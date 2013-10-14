/* Binary search */
int find_nearest(long key, long *vals, int lower, int upper)
{
  if (upper == lower)
    return upper;
  else {
    /* lower <= middle < upper */
    int middle = (lower + upper)/2;
    int mval = vals[middle];
    if (key <= mval)
      return find_nearest(key, vals, lower, middle);
    else
      return find_nearest(key, vals, middle+1, upper);
  }
}
