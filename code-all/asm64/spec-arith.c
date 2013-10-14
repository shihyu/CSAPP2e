long int mul1(long int x, long int y)
{
    return x * y;
}

long int mul2(int x, int y)
{
    return (long) x * y;
}

long int mul3(int x, int y)
{
    return (long) (x * y);
}

/* $begin oct_mul-c */
/* Global variable for 128-bit integer */
__int128_t prod;
/* Compute 128-bit product of two 64-bit integers */
long int oct_mul(long int x, long int y)
{
    prod = (__int128_t) x * y;
    return (long) prod;
}
/* $end oct_mul-c */

long unsigned umul1(long unsigned x, long unsigned y)
{
    return x*y;
}

long unsigned umul2(unsigned x, unsigned y)
{
    return (unsigned long) x * y;
}

long int umul3(unsigned x, unsigned y)
{
    return (unsigned long) (x * y);
}

__uint128_t uprod;
long int umul4(unsigned long int x, unsigned long int y)
{
    uprod = (__uint128_t) x * y;
    return (unsigned long) prod;
}


long int gval;
long int div1(long int x, long int y)
{
    gval = x % y;
    return x / y;
}

long int div2(int x, int y)
{
    gval = (long) x % y;
    return (long) x / y;
}

long int div3(int x, int y)
{
    gval = (long) (x % y);
    return (long) (x / y);
}

long unsigned ugval;
long unsigned udiv1(long unsigned x, long unsigned y)
{
    ugval = x % y;
    return x / y;
}

long unsigned udiv2(unsigned x, unsigned y)
{
    ugval = (unsigned long) x % y;
    return (unsigned long) x / y;
}

long unsigned udiv3(unsigned x, unsigned y)
{
    ugval = (unsigned long) (x % y);
    return (unsigned long) (x / y);
}


int main()
{
    return 0;
}
