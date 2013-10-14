/* Compute Moore's Law Performance of Intel Microprocessors */
#define MMX

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "lsquare.h"

typedef struct {
    char *name;
    float year;
    float trans;
} micro_ele, *micro_ptr;

micro_ele intel[] = {
    {"8086", 1978,           29000},
    {"80286", 1982,         134000},
    {"i386", 1985,          275000},
    {"i486", 1989,         1900000},
    {"Pentium", 1993,      3100000},
    {"PentiumPro", 1995,   5500000},
    {"Pentium II", 1997,   7500000},
    {"Pentium III", 1999,  9500000},
    {"Pentium 4", 2000,   42000000},
    {"Pentium 4e", 2004, 125000000},
    {"Core 2 Duo", 2006, 291000000},
    {"Core i7", 2008,    781000000},
    {"", 0, 0}
};

#define MAXCNT 20

static void analyze()
{
    double xval[MAXCNT];
    double yval[MAXCNT];
    double slope, intercept;
    double dtime;
    int n;
    int i;
    /* Create entries */
    for (i = 0; intel[i].name; i++) {
	xval[i] = intel[i].year - intel[0].year;
	yval[i] = log10(intel[i].trans);
    }
    n = i-1;
    printf("Got %d values\n", n);
    for (i = 0; i < n; i++)
	printf("x = %f, y = %f\n", xval[i], yval[i]);

    slope = ls_slope(xval, yval, n);
    intercept = ls_intercept(xval, yval, n);
    printf("annual growth rate = %.4f\n", pow(10, slope));
    printf("intercept at year %d = %.2f\n", (int) intel[0].year, pow(10,intercept));
    dtime = 0.3010/slope;
    printf("Doubling time = %.2f years (%.1f months)\n", dtime, dtime*12);

    for (i = 0; i < n; i++) {
	printf("Year = %d, predicted %d, got %d\n",
	       (int) intel[i].year, (int) pow(10, intercept+xval[i]*slope),
	       (int) intel[i].trans);
	       
    }

    exit(0);
}

int main()
{
    analyze();
    return 0;
}
