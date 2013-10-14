/* Experiments with floating point code */
double ffun(float f, double d)
{
  float t1 = f*d + 3.0;
  double t2 = f+d - t1;
  double t3 = t1/t2;
  if (t1 < t2)
    return t3;
  else if (t1 != t2)
    return t3;
  else
    return 0;
}

double dfact(double n)
{
  if (n <= 1)
    return 1.0;
  else
    return n * dfact(n-1.0);
}

float ffact(float n)
{
  if (n <= 1)
    return 1.0;
  else
    return n * ffact(n-1.0);
}

/* Adjust x to be between [0.5,1] */
double frac(double x)
{
  while (x < 0.5)
    x += x;
  while (x >= 1.0)
    x *= 0.5;
  return x;
}
