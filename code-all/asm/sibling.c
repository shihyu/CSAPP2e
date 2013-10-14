/* Test of sibling call optimization */

/* $begin sibling-c */
/* Examples of function making sibling call */
int square(int x) {
    return x * x;
}
/* $end sibling-c */

int proc1(int x, int y, int i) {
    if (i & 0x1)
	return square(x);
    else
	return square(y);
}

/* $begin sibling-c */

int proc(int x, int y, int i) {
    int b[2] = {x, y};
    return square(b[i & 0x1]);
}
/* $end sibling-c */
