#include "combine.h"

void combine3(vec_ptr v, data_t *dest);
void combine4(vec_ptr v, data_t *dest);

/* $begin loop-problem-funs */
int min(int x, int y) { return x < y ? x : y; }
int max(int x, int y) { return x < y ? y : x; }  
void incr(int *xp, int v) { *xp += v; }
int square(int x) { return x*x; }
/* $end loop-problem-funs */

void fragments() 
{
    int i, x=0, y=0, t;
    vec_ptr v = 0;

    /* $begin loop-problem-a */
    for (i = min(x, y); i < max(x, y); incr(&i, 1))
	t += square(i);
    /* $end loop-problem-a */

    /* $begin loop-problem-b */
    for (i = max(x, y) - 1; i >= min(x, y); incr(&i, -1))
	t += square(i);
    /* $end loop-problem-b */

    {
    /* $begin loop-problem-c */
    int low = min(x, y);
    int high = max(x, y);

    for (i = low; i < high; incr(&i, 1))
	t += square(i);
    /* $end loop-problem-c */
    }
 
    /* $begin aliasing */
    combine3(v, get_vec_start(v) + 2);
    combine4(v, get_vec_start(v) + 2);
    /* $end aliasing */

}


