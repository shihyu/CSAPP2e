/* $begin swap */
/* Swap value x at xp with value y at yp */
void swap(int *xp, int *yp)
{
    *xp = *xp + *yp; /* x+y       */
    *yp = *xp - *yp; /* x+y-y = x */
    *xp = *xp - *yp; /* x+y-x = y */
}
/* $end swap */



/* Swap value x at xp with value y at yp */
void swap_alias(int *xp, int *yp)
{
/* $begin swap-alias */
    *xp = *xp + *xp; /* 2x */
    *xp = *xp - *xp; /* 2x-2x = 0 */
    *xp = *xp - *xp; /* 0-0 = 0 */
/* $end swap-alias */
}

