/* $begin proc-c */
void proc(long  a1, long  *a1p,
	  int   a2, int   *a2p,
	  short a3, short *a3p,
	  char  a4, char  *a4p)
{
    *a1p += a1;
    *a2p += a2;
    *a3p += a3;
    *a4p += a4;
}
/* $end proc-c */

/* $begin call_proc-c */
long int call_proc()
{
    long x1 = 1;  int  x2 = 2;
    short x3 = 3; char x4 = 4;
    proc(x1, &x1, x2, &x2, x3, &x3, x4, &x4);
    return (x1+x2)*(x3-x4);
}
/* $end call_proc-c */

long int rproc(long int a1, long int *a2p)
{
    long int t1 = a1 + *a2p;
    long int t2 = a1 - *a2p;
    long int *t1p = &t1;
    long int *t2p = &t2;
    if (t1)
	return rproc(t1, t1p) * rproc(t2, t2p)
	    * rproc(t2, t1p) * rproc(t1, t2p);
    else
	return 0;
}

/* $begin rfact-c */
long int rfact(long int x)
{
    if (x <= 0)
	return 1;
    else {
	long int xm1 = x-1;
	return x * rfact(xm1);
    }
}
/* $end rfact-c */

/* $begin sfact_helper-c */
/* Compute x! and store at resultp */
void sfact_helper(long int x, long int *resultp)
{
    if (x <= 0)
	*resultp = 1;
    else {
	long int nresult;
	sfact_helper(x-1, &nresult);
	*resultp = x * nresult;
    }
}
/* $end sfact_helper-c */

/* $begin sfact-c */
long int sfact(long int x)
{
    long int result;
    sfact_helper(x, &result);
    return result;
}
/* $end sfact-c */

long int pwr(long int val, int n)
{
    if (n == 0)
	return 1L;
    else
	return n * pwr(val, n-1);
}

long int pwr_dc(long int val, int n)
{
    if (n == 0)
	return 1L;
    if (n == 1)
	return val;
    else
	return pwr_dc(val, n/2) * pwr_dc(val, n-n/2);
}



/* See how many callee save registers can be used. */
long int multi_fact(long a1, long a2, long a3, long a4, long a5, long a6)
{
    if (a1 <= 0)
	return a2 + a3 + a4 + a5 + a6;
    else
	return
	    (multi_fact(a1-1, a2, a3, a4, a5, a6) +
	     multi_fact(a1, a2-1, a3, a4, a5, a6)) +
	    (multi_fact(a1, a2, a3-1, a4, a5, a6) +
	     multi_fact(a1, a2, a3, a4-1, a5, a6));
}

/* $begin local_array-c */
long int local_array(int i)
{
    long int a[4] = {2L, 3L, 5L, 7l};
    int idx = i & 3;
    return a[idx];
}
/* $end local_array-c */

