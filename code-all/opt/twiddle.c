
/* $begin twiddle */
void twiddle1(int *xp, int *yp)
{
    *xp += *yp;
    *xp += *yp;
}

void twiddle2(int *xp, int *yp)
{
    *xp += 2* *yp;
}
/* $end twiddle */

void twiddle1x(int *xp)
{
    /* $begin twiddle1frag */
    *xp += *xp;  /* Double value at xp */
    *xp += *xp;  /* Double value at xp */
    /* $end twiddle1frag */
}

void twiddle2x(int *xp)
{
    /* $begin twiddle2frag */
    *xp += 2* *xp;  /* Triple value at xp */
    /* $end twiddle2frag */
}

void multipointers(int *p, int *q)
{
    int x, y;
    int t1;
    /* $begin pqfrag */
    x = 1000; y = 3000;
    *q = y;   /* 3000 */
    *p = x;   /* 1000 */
    t1 = *q;  /* 1000 or 3000 */
    /* $end pqfrag */
    *q += t1;
}
