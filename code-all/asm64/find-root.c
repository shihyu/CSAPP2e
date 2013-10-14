/* Find root of function using regula falsi method */

#include <math.h>

typedef double (*fun_t)(double d);

double find_root(fun_t f, double lower, double upper, double epsilon)
{
  double f_upper = f(upper);
  double f_usign = copysign(1.0, f_upper);
  double f_lower = f(lower);
  double f_lsign = copysign(1.0, f_lower);
  while (fabs(f_upper-f_lower) > epsilon) {
    double mid = (lower * f_upper - upper * f_lower)/(f_upper-f_lower);
    double f_mid = f(mid);
    double f_msign = copysign(1.0, f_mid);
    if (f_msign == f_usign) {
      upper = mid;
      f_upper = f_mid;
      f_usign = f_msign;
    } else {
      lower = mid;
      f_lower = f_mid;
      f_lsign = f_msign;
    }
  }
  return lower;
}
