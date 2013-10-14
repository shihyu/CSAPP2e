/* Different conditionals */

/* $begin max-c */
int max(int x, int y) {
    return (x < y) ? y : x;
}
/* $end max-c */

int wa_max(int x, int y)
{
    return (x < y) ? 17+y : 23+x;
}

int wm_max(int x, int y)
{
    return (x < y) ? 17*y : 23*x;
}

int wm_max2(int x, int y)
{
    return (x < y) ? 16*y : x;
}

int wm_max3(int x, int y)
{
    return (x < y) ? 17*y : x;
}

int abs(int x)
{
    return (x < 0) ? -x : x;
}

int cmul(int x, int y)
{
    return (y == 0) ? 0 : x*y;
}

int cmul2(int x, int y)
{
    return (y == 1) ? x : x*y;
}

int cdiv(int x, int y)
{
    return (y == 0) ? 0 : x/y;
}

int cdiv2(int x, int y)
{
    return (y == 1) ? x : x/y;
}

/* $begin cread-c */
int cread(int *xp) {
    return (xp ? *xp : 0);
}
/* $end cread-c */

/* $begin se_max-c */
int lcount = 0;
int se_max(int x, int y) {
    return (x < y) ? (lcount++, y) : x;
}
/* $end se_max-c */

#define OP /
#if 0
/* $begin arith2-c */
#define OP _____ /* Unknown operator */

/* $end arith2-c */
#endif
/* $begin arith2-c */
int arith(int x) {
    return x OP 4;
}
/* $end arith2-c */
