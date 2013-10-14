/* Various ways of representing TMIN */

#include <stdio.h>

long int long_tmin() {
  return
    /* $begin long_tmin_solve */
    /* Shift 1 over by 8*sizeof(long) - 1 */
    1L  << (sizeof(long)<<3) - 1
    /* $end long_tmin_solve */
    ;
}


int main()
{
    printf("2147483648 < 0? %c\n",
	   2147483648 < 0 ? 'y' : 'n');
    printf("-2147483648 < 0? %c\n",
	   -2147483648 < 0 ? 'y' : 'n');
    printf("-(1+2147483647) < 0? %c\n",
	   -(1+2147483647) < 0 ? 'y' : 'n');
    printf("-1-2147483647 < 0? %c\n",
	   -1-2147483647 < 0 ? 'y' : 'n');
    printf("(int) 2147483648u < 0? %c\n",
	   (int) 2147483648u < 0 ? 'y' : 'n');
    printf("1<<31 < 0? %c\n",
	   1<<31 < 0 ? 'y' : 'n');
    printf("0x80000000 < 0? %c\n",
 	    0x80000000 < 0 ? 'y' : 'n');
    printf("-0x7fffffff-1 < 0? %c\n",
 	    -0x7fffffff-1 < 0 ? 'y' : 'n');
    printf("0x80000000u < 0? %c\n",
 	    0x80000000u < 0 ? 'y' : 'n');
    printf("~(1<<31) > 0? %c\n",
	   ~(1<<31) > 0 ? 'y' : 'n');
    printf("sizeof(long) = %d\n", sizeof(long));
    printf("long_tmin -> 0x%llx\n", long_tmin());
    return 0;
}
