#include <math.h>

typedef int arg1_t;
typedef float arg2_t;
typedef long arg3_t;
typedef double arg4_t;

/* $begin fexpr1-c */
double funct1(arg1_t p, arg2_t q, arg3_t r, arg4_t s) 
{ 
    return p/(q+r) - s; 
} 
/* $end fexpr1-c */

double funct2(double w, int x, float y, long z);



double funct2(double w, int x, float y, long z) 
{ 
    return y*x - w/z;
} 

double funct3(int *ap, double b, long c, float *dp);

double funct3(int *ap, double b, long c, float *dp) {
    int a = *ap;
    float d = *dp;
    if (a < b)
	return c*d;
    else
	return c+2*d;
}

double d_max(double x, double y) {
    return x < y ? y : x;
}

float f_max(float x, float y) {
    return x < y ? y : x;
}

double dz(double *dp) {
    *dp = 0;
    return 0;
}


#define libf fabs

double libfun(double x) {
    return libf(x);
}



