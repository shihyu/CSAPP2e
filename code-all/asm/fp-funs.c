#include <math.h>

typedef int arg1_t;
typedef float arg2_t;
typedef long arg3_t;
typedef double arg4_t;

/* $begin fexpr1-proto-c */
double funct1a(int p, float q, long r, double s);
double funct1b(int p, long q, float r, double s);
/* $end fexpr1-proto-c */

/* $begin fexpr1-c */
double funct1(arg1_t p, arg2_t q, arg3_t r, arg4_t s) 
{ 
    return p/(q+r) - s; 
} 
/* $end fexpr1-c */

/* $begin fexpr2-proto-c */
double funct2(double w, int x, float y, long z);
/* $end fexpr2-proto-c */

/* $begin fexpr2-ans-c */
double funct2(double w, int x, float y, long z) 
{ 
    return y*x - w/z;
} 
/* $end fexpr2-ans-c */

/* $begin fexpr3-proto-c */
double funct3(int *ap, double b, long c, float *dp);
/* $end fexpr3-proto-c */

/* $begin fexpr3-ans-c */
double funct3(int *ap, double b, long c, float *dp) {
    int a = *ap;
    float d = *dp;
    if (a < b)
	return c*d;
    else
	return c+2*d;
}
/* $end fexpr3-ans-c */

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


#define EXPR(x) fabs(x)
#define EXPR2(x) 0
#define EXPR3(x) -(x)

/* $begin simplefun-c */
double simplefun(double x) {
    return EXPR(x);
}
/* $end simplefun-c */

double simplefun2(double x) {
    return EXPR2(x);
}

double simplefun3(double x) {
    return EXPR3(x);
}




