/* $begin fibdw-c */
long int fib_dw(long int n) 
{ 
    long int i = 0; 
    long int val = 0; 
    long int nval = 1; 

    do { 
	long int t = val + nval; 
	val = nval; 
	nval = t; 
	i++; 
    } while (i < n); 

    return val; 
} 
/* $end fibdw-c */

/* $begin fibw-c */
long int fib_w(long int n) 
{ 
    long int i = 1; 
    long int val = 1; 
    long int nval = 1; 

    while (i < n) { 
	long int t = val+nval; 
	val = nval; 
	nval = t; 
	i++; 
    } 

    return val; 
} 
/* $end fibw-c */

/* $begin fibw-goto-c */
long int fib_w_goto(long int n) 
{ 
    long int val = 1; 
    long int nval = 1; 
    long int nmi, t; 

    if (val >= n) 
	goto done; 
    nmi = n-1; 

 loop: 
    t = val+nval; 
    val = nval; 
    nval = t; 
    nmi--; 
    if (nmi) 
	goto loop; 

 done: 
    return val; 
} 
/* $end fibw-goto-c */

/* $begin fibf-c */
long int fib_f(long int n) 
{ 
    long int i; 
    long int val = 1; 
    long int nval = 1; 

    for (i = 1; i < n; i++) { 
	long int t = val+nval; 
	val = nval; 
	nval = t; 
    } 

    return val; 
} 
/* $end fibf-c */

/* $begin fibrec-c */
long int fib_rec(long int n) 
{ 
    long int prev_val, val; 

    if (n <= 2) 
	return 1; 
    prev_val = fib_rec(n-2); 
    val = fib_rec(n-1); 
    return prev_val + val; 
} 
/* $end fibrec-c */

