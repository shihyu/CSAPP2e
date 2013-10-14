/* $begin fcvt-c */
double fcvt(int i, float *fp, double *dp, long *lp)
{
    float f = *fp; double d = *dp; long l = *lp; 
    *lp = (long)    d;
    *fp = (float)   i;
    *dp = (double)  l;
    return (double) f;
}
/* $end fcvt-c */

#define val1 d
#define val2 i
#define val3 l
#define val4 f

/* $begin fcvt2-prob-c */
double fcvt2(int *ip, float *fp, double *dp, long l)
{
    int i = *ip; float f = *fp; double d = *dp;
    *ip = (int)     val1;
    *fp = (float)   val2;
    *dp = (double)  val3;
    return (double) val4;
}
/* $end fcvt2-prob-c */

void mf2md(float *src, double *dest) {
    float f = (double) *src;
    *dest = (double) f;
}

/* $begin f2d-c */
double f2d(float f) {
    return (double) f;
}
/* $end f2d-c */

/* $begin d2f-c */
float d2f(double d) {
    return (float) d;
}
/* $end d2f-c */
