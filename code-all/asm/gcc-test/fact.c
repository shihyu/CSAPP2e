/* Loop illustration using different computations of factorial */

/* $begin fact_do-c */
int fact_do(int n)
{
    int result = 1;
    do {
	result *= n;
	n = n-1;
    } while (n > 1);
    return result;
}
/* $end fact_do-c */

/* $begin fact_while-c */
int fact_while(int n)
{
    int result = 1;
    while (n > 1) {
	result *= n;
	n = n-1;
    }
    return result;
}
/* $end fact_while-c */

/* $begin fact_for-c */
int fact_for(int n)
{
    int i;
    int result = 1;
    for (i = 2; i <= n; i++)
	result *= i;
    return result;
}
/* $end fact_for-c */

/* $begin fact_for_while-c */
int fact_for_while(int n)
{
    int i = 2;
    int result = 1;
    while (i <= n) {
	result *= i;
	i++;
    }
    return result;
}
/* $end fact_for_while-c */

/* $begin fact_for_do-c */
int fact_for_do(int n)
{
    int i = 2;
    int result = 1;
    if (!(i <= n))
	goto done;
    do {
	result *= i;
	i++;
    } while (i <= n);
 done:
    return result;
}
/* $end fact_for_do-c */

int fact_do_goto(int n)
{
    int result = 1;
 loop:
    result *= n;
    n = n-1;
    if (n > 1)
	goto loop;
    return result;
}

/* $begin fact_while_goto-c */
int fact_while_goto(int n)
{
    int result = 1;
    if (n <= 1)
	goto done;
 loop:
    result *= n;
    n = n-1;
    if (n > 1)
	goto loop;
 done:
    return result;
}
/* $end fact_while_goto-c */

/* $begin fact_for_goto-c */
int fact_for_goto(int n)
{
    int i = 2;
    int result = 1;
    if (!(i <= n))
	goto done;
 loop:
    result *= i;
    i++;
    if (i <= n)
	goto loop;
 done:
    return result;
}
/* $end fact_for_goto-c */

/* $begin rfact-c */
int rfact(int n)
{
    int result;
    if (n <= 1)
	result = 1;
    else
        result = n * rfact(n-1);
    return result;
}
/* $end rfact-c */
