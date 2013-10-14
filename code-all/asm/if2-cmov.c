/* $begin if2-ans-c */
int test(int x, int y) {
    int val = 4*x;
    if (y > 0) {
	if (x < y)
	    val = x-y;
	else
	    val = x^y;
    } else if (y < -2)
	val = x+y;
    return val;
}
/* $end if2-ans-c */

#if 0
/* $begin if2-prob-c */
int test(int x, int y) {
    int val = ______;
    if (______) {
	if (______)
	    val = ______;
	else
	    val = ______;
    } else if (______)
	val = ______;
    return val;
}
/* $end if2-prob-c */
#endif
