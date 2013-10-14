/* $begin fpident-c */
double ident_x(double x) 
{ 
    double s = x * x; 
    double result = s / x; 

    return result; 
} 
 
int i = 0; 
 
double ident_d(double x) 
{ 
    double result; 
    double a[1]; 

    a[0]  = x * x; 
    result = a[i] / x; 
    return result; 
}
/* $end fpident-c */

/* $begin fpfunct-c */
double funct(double a, float x, double b, int i) 
{ 
    return a*x - b/i; 
} 
/* $end fpfunct-c */

/* $begin fpless-c */
int less(double x, double y) 
{ 
    return x < y; 
} 
/* $end fpless-c */

/* $begin fplesseq-c */
int lesseq(double x, double y) 
{ 
    return x <= y; 
} 
/* $end fplesseq-c */
