#include <stdio.h>

/* $begin simple-if-c */
void cond(int a, int *p)
{
    if (p && a > 0)
	*p += a;
}
/* $end simple-if-c */


/* $begin simple-if-goto-c */
void goto_cond(int a, int *p) {
    if (p == 0)
	goto done;
    if (a <= 0)
	goto done;
    *p += a;
 done:
    return;
}
/* $end simple-if-goto-c */

/* $begin simple-if-prob-c */
void cond_alt(int a, int *p)
{
    if ((p != NULL) & (a > 0))
	*p += a;
}
/* $end simple-if-prob-c */


/* $begin simple-if-prob-goto-c */
void goto_cond_alt(int a, int *p) {
    int t = (p != NULL) & (a > 0);
    if (!t)
	goto done;
    *p += a;
 done:
    return;
}
/* $end simple-if-prob-goto-c */


