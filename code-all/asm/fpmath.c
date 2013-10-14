#include <math.h>

/* Some test of math functions */

double sin_asin(double x)
{
    return sin(asin(x));
}

double hypotenuse(double a, double b) {
    double sq = a*a + b*b;
    return sqrt(sq);
}

long double long_hypotenuse(long double a, long double b) {
    long double sq = a*a + b*b;
    return sqrt(sq);
}

    
    
