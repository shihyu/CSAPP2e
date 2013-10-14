/* $begin incrprob-proto-c */
void incrprob_s(int x, long *q, int *t);
void incrprob_u(unsigned x, long *q, int *t);
void incrprob_sl(long x, long *q, int *t);
void incrprob_ul(unsigned long x, long *q, int *t);
/* $end incrprob-proto-c */

void incrprob(int x, long *q, int *t)
{
    /* $begin incrprob-body-c */
    *t += x;
    *q += *t;
    /* $end incrprob-body-c */
}

void incrprob_u(unsigned x, long *q, int *t)
{
    *t += x;
    *q += *t;
}

/* $begin arithprob-proto-c */
long arithprob(int a, char b, long c, int d);
/* $end arithprob-proto-c */

long arithprob(int a, char b, long c, int d)
{
    /* $begin arithprob-body-c */
    return a*b + c*d;
    /* $end arithprob-body-c */
}

/* $begin movprob-c */
long gv1;
long gv2;
unsigned long gv3;
unsigned long gv4;

void moveprob(char v1, int v2, unsigned char v3, unsigned v4)
{
    gv1 = (long) v1;
    gv2 = (long) v2;
    gv3 = (unsigned long) v3;
    gv4 = (unsigned long) v4;
}
/* $end movprob-c */

void incrprob_ls(long x, long *q, int *t)
{
    *t += x;
    *q += *t;
}

void incrprob_lu(long unsigned x, long *q, int *t)
{
    *t += x;
    *q += *t;
}
