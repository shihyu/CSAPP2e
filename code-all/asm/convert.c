/* Experiment with long and regular ints */


/* $begin gfun-c */
long int gfun(int x, int y)
{
    long int t1 = (long) x + y;   /* 64-bit addition */  // line:asm:gfun_c:t1
    long int t2 = (long) (x + y); /* 32-bit addition */  // line:asm:gfun_c:t2
    return t1 | t2;
}
/* $end gfun-c */

/* $begin gfun_u-c */
unsigned long gfun_u(unsigned x, unsigned y)
{
    unsigned long t1 = (unsigned long) x + y;   /* 64-bit addition */
    unsigned long t2 = (unsigned long) (x + y); /* 32-bit addition */
    return t1 | t2;
}
/* $end gfun_u-c */
