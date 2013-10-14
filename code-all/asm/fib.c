/* $begin fibdw-c */
int fib_dw(int n) 
{ 
    int i = 0; 
    int val = 0; 
    int nval = 1; 

    do { 
	int t = val + nval; 
	val = nval; 
	nval = t; 
	i++; 
    } while (i < n); 

    return val; 
} 
/* $end fibdw-c */
/* $begin fibw-c */
int fib_w(int n) 
{ 
    int i = 1; 
    int val = 1; 
    int nval = 1; 

    while (i < n) { 
	int t = val+nval; 
	val = nval; 
	nval = t; 
	i++; 
    } 

    return val; 
} 
/* $end fibw-c */

/* $begin fibf-c */
int fib_f(int n) 
{ 
    int i; 
    int val = 1; 
    int nval = 1; 

    for (i = 1; i < n; i++) { 
	int t = val+nval; 
	val = nval; 
	nval = t; 
    } 

    return val; 
} 
/* $end fibf-c */

/* $begin fibrec-c */
int fib_rec(int n) 
{ 
    int prev_val, val; 

    if (n <= 2) 
	return 1; 
    prev_val = fib_rec(n-2); 
    val = fib_rec(n-1); 
    return prev_val + val; 
} 
/* $end fibrec-c */

/* $begin fibdow-goto-c */
int fib_dow_goto(int n) 
{
    int i, val, nval, t;
    i = 0;
    val = 0;
    nval = 1;
 loop:
    t = nval + val;
    i++;
    if (i >= n)
	goto done;
    val = nval;
    nval = t;
    goto loop;
 done:
    return nval; 
} 
/* $end fibdow-goto-c */


/* $begin fibw-goto-c */
int fib_w_goto(int n) 
{
    int i, val, nval, t;
    nval = 1;
    if (n <= 1)
	goto done;
    i = 1;
    val = 1;
    nval = 1;
 loop:
    t = nval + val;
    i++;
    if (n <= i)
	goto done;
    val = nval;
    nval = t;
    goto loop;
 done:
    return nval; 
} 
/* $end fibw-goto-c */
