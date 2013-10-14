/* Examples of conditionals */
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include "clock.h"




/* Measure 14.5 CPE on random data, 3.0 on deterministic */
/* $begin minmax1 */
/* Rearrange two vectors so that for each i, b[i] >= a[i] */
void minmax1(int a[], int b[], int n) {
    int i;
    for (i = 0; i < n; i++) {
	if (a[i] > b[i]) {
	    int t = a[i];
	    a[i] = b[i];
	    b[i] = t;
	}
    }
}
/* $end minmax1 */

/* Measure 5.0 CPE */
/* $begin minmax2 */
/* Rearrange two vectors so that for each i, b[i] >= a[i] */
void minmax2(int a[], int b[], int n) {
    int i;
    for (i = 0; i < n; i++) {
	int min = a[i] < b[i] ? a[i] : b[i];
	int max = a[i] < b[i] ? b[i] : a[i];
	a[i] = min;
	b[i] = max;
    }
}
/* $end minmax2 */

#define MAXLEN 2048
/* Need to sets of identical data for comparisons */
int a1[MAXLEN], b1[MAXLEN];
int a2[MAXLEN], b2[MAXLEN];

void init(unsigned seed) {
    int i;
    if (seed <= 1) {
	for (i = 0; i < MAXLEN; i++) {
	    a1[i] = a2[i] = seed;
	    b1[i] = b2[i] = 1-seed;
	}
    } else if (seed == 2) {
	for (i = 0; i < MAXLEN; i++) {
	    int residue = i &  0x1;
	    a1[i] = a2[i] = residue;
	    b1[i] = b2[i] = 1-residue;
	}
    } else {
	srandom(seed);
	for (i = 0; i < MAXLEN; i++) {
	    int a = random();
	    int b = random();
	    a1[i] = a2[i] = a;
	    b1[i] = b2[i] = b;
	}
    }
}

void run(int len, int trials, unsigned seed) {
    double t1, t2;
    int t;
    for (t = 0; t < trials; t++) {
	init(seed);
	start_counter();
	minmax1(a1, b1, len);
	t1 = get_counter();
	start_counter();
	minmax2(a2, b2, len);
	t2 = get_counter();
	printf("%d\t%.2f\t%.2f\n", len, t1/len, t2/len);
    }
}


int main(int argc, char *argv[]) {
    int len = MAXLEN;
    int trials = 3;
    unsigned seed = 1;
    if (argc > 1)
	len = atoi(argv[1]);
    if (argc > 2)
	trials = atoi(argv[2]);
    if (argc > 3)
	seed = atoi(argv[3]);
    run(len, trials, seed);
    return 0;
}
