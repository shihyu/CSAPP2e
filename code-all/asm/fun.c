/* Different variations on pop count and related functions */
int test_fun_a(unsigned x)
{
    int i;
    int val = 0;
    for (i = 0; i < 32; i++)
	val ^= (x & (1<<i)) != 0;
    return val;
}

/* $begin fun_a-ans-c */
int fun_a(unsigned x) {
    int val = 0;
    while (x) {
	val ^= x;
	x >>= 1;
    }
    return val & 0x1;
}
/* $end fun_a-ans-c */

#if 0
/* $begin fun_a-proto-c */
int fun_a(unsigned x) {
    int val = 0;
    while ( ... ) {
	...
    }
    return ...;
}
/* $end fun_a-proto-c */
#endif

/* $begin fun_b-ans-c */
int fun_b(unsigned x) {
    int val = 0;
    int i;
    for (i = 0; i < 32; i++) {
	val = (val << 1) | (x & 0x1);
	x >>= 1;
    }
    return val;
}
/* $end fun_b-ans-c */

#if 0
/* $begin fun_b-proto-c */
int fun_b(unsigned x) {
    int val = 0;
    int i;
    for ( ... ; ... ; ... ) {
	...
    }
    return val;
}
/* $end fun_b-proto-c */
#endif

int test_fun_b(unsigned x)
{
    int l, r;
    int val = 0;
    for (l = 0, r = 31; l < 32; l++, r--) {
	int bit = (x & (1<<l)) != 0;
	if (bit)
		val |= (1<<r);
	}
    return val;
}

/* $begin fun_c-ans-c */
int fun_c(unsigned x) {
    int val = 0;
    int i;
    for (i = 0; i < 8; i++) {
	val += x & 0x01010101;
	x >>= 1;
    }
    val += (val >> 16);
    val += (val >> 8);
    return val & 0xFF;
}
/* $end fun_c-ans-c */

#if 0
/* $begin fun_c-proto-c */
int fun_c(unsigned x) {
    int val = 0;
    int i;
    for ( ... ; ... ; ... ) {
	...
    }
    ...
    return ...;
}
/* $end fun_c-proto-c */
#endif

int test_fun_c(unsigned x)
{
    int i;
    int val = 0;
    for (i = 0; i < 32; i++)
	val += (x & (1<<i)) != 0;
    return val;
}

int test_count_p(unsigned x)
{
    int i;
    int val = 0;
    for (i = 0; i < 32; i++)
	val += (x & (1<<i)) != 0;
    return val;
}

int count_p(unsigned x) {
    int val = 0;
    while (x) {
	val += (x >> (32-1));
	x <<= 1;
    }
    return val;
}

int count_q(unsigned x) {
    int val = 0;
    unsigned mask = 1<<31;
    while (mask) {
	val += (x & mask) != 0;
	mask >>= 1;
    }
    return val;
}

int test_count_q(unsigned x)
{
    int i;
    int val = 0;
    for (i = 0; i < 32; i++)
	val += (x & (1<<i)) != 0;
    return val;
}

int count_r(unsigned x) {
    int val = 0;
    unsigned mask;
    for (mask = 1; mask; mask <<= 1)
	if (x & mask)
	    val ++;
    return val;
}

int test_count_r(unsigned x)
{
    int i;
    int val = 0;
    for (i = 0; i < 32; i++)
	val += (x & (1<<i)) != 0;
    return val;
}


