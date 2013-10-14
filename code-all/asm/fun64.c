/* $begin fun_c-ans-c */
long fun_c(unsigned long x) {
    long val = 0;
    int i;
    for (i = 0; i < 8; i++) {
	val += x & 0x0101010101010101L;
	x >>= 1;
    }
    val += (val >> 32);
    val += (val >> 16);
    val += (val >> 8);
    return val & 0xFF;
}
/* $end fun_c-ans-c */

#if 0
/* $begin fun_c-proto-c */
long fun_c(unsigned long x) {
    long val = 0;
    int i;
    for ( ... ; ... ; ... ) {
	...
    }
    ...
    return ...;
}
/* $end fun_c-proto-c */
#endif

long test_fun_c(unsigned long x)
{
    long val = 0;
    int i;
    for (i = 0; i < 64; i++)
	val += (x & (1<<i)) != 0;
    return val;
}



