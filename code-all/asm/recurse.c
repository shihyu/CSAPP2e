#if 0
/* $begin recurse-proto-c */
int rfun(unsigned x) {
    if ( ____ )
	return _____;
    unsigned nx = _____;
    int rv = rfun(nx);
    return _____;
}
/* $end recurse-proto-c */
#endif

/* $begin recurse-c */
int rfun(unsigned x) {
    if (x == 0)
	return 0;
    unsigned nx = x>>1;
    int rv = rfun(nx);
    return (x & 0x1) + rv;
}
/* $end recurse-c */

unsigned prange(unsigned min, unsigned max)
{
    if (min > max)
	return 0;
    if (min == max)
	return min;
    unsigned mid = (min+max)/2;
    unsigned v1 = prange(min, mid);
    unsigned v2 = prange(mid+1, max);
    return v1*v2;
}

int o(unsigned x);

int e(unsigned x) {
    if (x == 0)
	return 0;
    int bit = x & 0x1;
    int rest = x >> 1;
    if (bit)
	return o(rest);
    else
	return e(rest);
}

int o(unsigned x) {
    if (x == 0)
	return 1;
    int bit = x & 0x1;
    int rest = x >> 1;
    if (bit)
	return e(rest);
    else
	return o(rest);
}
