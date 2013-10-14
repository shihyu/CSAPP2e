/* Test functions for optimizations */

/* $begin select-c */
int select(int x, int y, int i) {
    int data[2] = { x, y };
    if (i >= 0 && i < 2)
	return data[i];
    else
	return 0;
}
/* $end select-c */

/* $begin test_select-c */
int test_select() {
    return select(5, 6, 1);
}
/* $end test_select-c */

/* Sample recursive functions */
/* $begin fact_recur-c */
int fact_recur(int x) {
    if (x == 0)
	return 1;
    else
	return x * fact_recur(x-1);
}
/* $end fact_recur-c */

/* $begin fact_tail-c */
int fact_tail(int x, int sofar) {
    if (x == 0)
	return sofar;
    else
	return fact_tail(x - 1, sofar * x);
}

int fact_tail_call(int x) {
    return fact_tail(x, 1);
}
/* $end fact_tail-c */

/* $begin fact_itail-c */
int fact_itail(int x, int sofar) {
    while (x != 0) {
	int nx = x - 1;
	sofar = sofar * x;
	x = nx;
    }
    return sofar;
}
/* $end fact_itail-c */


/* Iterative conversions of factorial */

/* $begin fact_iter1-c */
int fact_iter1(int x) {
    int r = 1;
    while (x != 0) {
	r = r * x;
	x = x - 1;
    }
    return r;
}
/* $end fact_iter1-c */

/* $begin fact_iter2-c */
int fact_iter2(int x) {
    if (x == 0)
	return 1;
    else {
	int r = x;
	while (x-1 != 0) {
	    x = x - 1;
	    r = r * x;
	}
	/* Don't need to multiply by 1 */
	return r;
    }
}
/* $end fact_iter2-c */

/* $begin fact_iter3-c */
int fact_iter3(int x) {
    int r = 1;
    if (x == 0)
	return r;
    else {
	int t = 1;
	while (t != x) {
	    r = t * r;
	    t = t + 1;
	}
	r = x * r;
	return r;
    }
}
/* $end fact_iter3-c */
