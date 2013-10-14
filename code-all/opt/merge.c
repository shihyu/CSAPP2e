/* Variations on merge operation of mergesort */
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include "clock.h"

/* $begin merge */
void merge(int src1[], int src2[], int dest[], int n) {
    int i1 = 0;
    int i2 = 0;
    int id = 0;
    while (i1 < n && i2 < n) { 
	if (src1[i1] < src2[i2]) //line:opt:merge:compare
	    dest[id++] = src1[i1++];
	else 
	    dest[id++] = src2[i2++]; //line:opt:merge:compareend
    } 
    while (i1 < n) 
	dest[id++] = src1[i1++];
    while (i2 < n)
	dest[id++] = src2[i2++];
}
/* $end merge */

void merge2(int src1[], int src2[], int dest[], int n) {
    int i1 = 0;
    int i2 = 0;
    int id = 0;
    /* $begin merge-cmov */
    while (i1 < n && i2 < n) { 
	int v1 = src1[i1];
	int v2 = src2[i2];
	int take1 = v1 < v2;
	dest[id++] = take1 ? v1 : v2;
	i1 += take1;
	i2 += (1-take1);
    } 
    /* $end merge-cmov */
    while (i1 < n) 
	dest[id++] = src1[i1++];
    while (i2 < n)
	dest[id++] = src2[i2++];
}

#define LEN 2048
int a1[LEN], a2[LEN], d[2*LEN];
int b1[LEN], b2[LEN];

void show(char *label, int a[], int n) {
    int i;
    printf("%s: ", label);
    for (i = 0; i < n; i++)
	printf("%d ", a[i]);
    printf("\n");
}
void init(unsigned seed) {
    /* Initialize by un-merging set of values */
    int id, i1, i2;
    srandom(seed);
    for (id = 0; id < 2*LEN; id++)
	d[id] = id;
    i1 = 0; i2 = 0; id = 0;
    int take1 = 0;
    while (i1 < LEN && i2 < LEN) {
	if (seed == 0)
	    take1 = 1-take1;
	else
	    take1 = random() & 0x1;
	if (take1) {
	    a1[i1] = b1[i1] = d[id++];
	    i1++;
	} else {
	    a2[i2] = b2[i2] = d[id++];
	    i2++;
	}
    }
    while (i1 < LEN) {
	a1[i1] = b1[i1] = d[id++];
	i1++;
    }
    while (i2 < LEN) {
	a2[i2] = b2[i2] = d[id++];
	i2++;
    }
}

void run(int len, int trials, unsigned seed) {
    double t1, t2;
    int t;
    for (t = 0; t < trials; t++) {
	init(seed);
	if (t == 0) {
	    if (len <= 10) {
		show("a1", a1, len);
		show("a2", a2, len);
	    }
	}
	start_counter();
	merge(a1, a2, d, len);
	if (t == 0 && len <= 10)
	    show("d1", d, 2*len);
	t1 = get_counter();
	start_counter();
	merge2(b1, b2, d, len);
	t2 = get_counter();
	if (t == 0 && len <= 10) {
	    show("d2", d, 2*len);
	}
	printf("%d\t%.2f\t%.2f\n", len, t1/(2*len), t2/(2*len));
    }
}

int main(int argc, char *argv[]) {
    int len = LEN;
    int trials = 5;
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
