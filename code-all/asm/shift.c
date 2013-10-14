/* Test of shift instruction */

/* $begin shift-c */
int shift_left2_rightn(int x, int n)
{
    x <<= 2;
    x >>= n;
    return x;
}
/* $end shift-c */
