
/* Example of while loop */

/* $begin while-old-c */
int loop_while_old(int a, int b)
{
    int i = 0;
    int result = a;
    while (i < 256) {
	result += a;
	a -= b;
	i += b;
    }
    return result;
}
/* $end while-old-c */

/* $begin while-old-gotoc */
int loop_while_old_goto(int a, int b)
{
    int i = 0;
    int result = a;
 loop:
    result += a;
    a -= b;
    i += b;
    if (i <= 255)
	goto loop;
    return result;
}
/* $end while-old-gotoc */

/* $begin while-c */
int loop_while(int a, int b)
{
    int result = 1;
    while (a < b) {
	result *= (a+b);
	a++;
    }
    return result;
}
/* $end while-c */

/* $begin while-goto-c */
int loop_while_goto(int a, int b)
{
    int result = 1;
    if (a >= b)
	goto done;
    /* apb has same value as a+b in original code */
    int apb = a+b;  
 loop:
    result *= apb;
    a++;
    apb++;
    if (b > a)
	goto loop;
 done:
    return result;
}
/* $end while-goto-c */
