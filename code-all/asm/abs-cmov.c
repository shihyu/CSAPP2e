#include <stdio.h>
#include <stdlib.h>

/* $begin absdiff-c */
/* $begin absdiff-expr-c */
int absdiff(int x, int y) {
/* $end absdiff-expr-c */
    if (x < y) 
	return y - x; 
    else 
	return x - y; 
} 
/* $end absdiff-c */

/* $begin gotodiff-c */
int gotodiff(int x, int y) {
    int result;
    if (x >= y) 
	goto x_ge_y;   //line:asm:abs:goto
    result =  y - x; //line:asm:abs:cyx
    goto done;
 x_ge_y: //line:asm:abs:xgey
    result = x - y;
 done:
    return result;
} 
/* $end gotodiff-c */

int absdiff2(int x, int y) { 
    int result; 

    if (x < y) 
	result = y-x; 
    else 
	result = x-y; 
    return result; 
} 

/* $begin cmovdiff-c */ 
int cmovdiff(int x, int y) {
    int tval = y-x;
    int rval = x-y;
    int test = x < y;
    /* Line below requires
       single instruction: */
    if (test) rval = tval; //line:asm:abs:cmovdiff:xfer
    return rval;
}
/* $end cmovdiff-c */

int absdiff_e(int x, int y) {
/* $begin absdiff-expr-c */
    return x < y ? y-x : x-y; 
} 
/* $end absdiff-expr-c */

/* $begin absdiff-se-c */
/* Global variable */
int lcount = 0; 
int absdiff_se(int x, int y) {
    return x < y ? (lcount++, y-x) : x-y; 
} 
/* $end absdiff-se-c */


/* $begin gotodiff-alt-c */
int gotodiff_alt(int x, int y) {
    int result;
    if (x < y) 
	goto true;
    result = x - y;
    goto done;
 true: //line:asm:abs:false
    result =  y - x;
 done:
    return result;
} 
/* $end gotodiff-alt-c */



int main(int argc, char *argv[]) {
  int x = atoi(argv[1]);
  int y = atoi(argv[2]);
  int z1 = absdiff(x,y);
  int z2 = gotodiff(x,y);
  int z3 = cmovdiff(x,y);
  printf("x = %d, y = %d, |x-y| = (%d,%d,%d)\n", x, y, z1, z2, z3);
  return 0;
}
