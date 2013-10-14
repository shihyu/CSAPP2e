/* See if can make compiler put loop closing jump in middle */

int loop(int x)
{
    int last = x;
    do {
	last = x;
	x += 4;
    } while (x < 0);
    return last;
}

int loop2(unsigned x, unsigned mask) {
    long val = 0;
    do {
	x = (mask & 1) ? x >> 1 : x << 2;
	mask >>= 1;
	val++;
    } while (x);
    return val;
}
