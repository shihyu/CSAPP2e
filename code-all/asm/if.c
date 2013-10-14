/* $begin if-ans-c */
int test(int x, int y) {
    int val = x^y; //line:asm:if:initialize
    if (x < -3) {
	if (y < x)
	    val = x*y;
	else
	    val = x+y;
    } else if (x > 2)
	val = x-y;
    return val;
}
/* $end if-ans-c */

#if 0
/* $begin if-prob-c */
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
/* $end if-prob-c */
#endif
