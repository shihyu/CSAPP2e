/* Benchmark list access to measure load / store interactions */
#include <stdio.h>
#include <string.h>
#include "cpe.h"

#define ASIZE 1024

int data[ASIZE+1];
int data2[ASIZE+1];

/* $begin write_read */
/* Write to dest, read from src */
void write_read(int *src, int *dest, int n)
{
    int cnt = n;
    int val = 0;

    while (cnt--) {
	*dest = val;
	val = (*src)+1;
    }
}
/* $end write_read */


/* $begin copy_array */
void copy_array(int *src, int *dest, int n)
{
    int i;
    for (i = 0; i < n; i++)
	dest[i] = src[i];
}
/* $end copy_array */

/* $begin clear_array */
/* Set elements of array to 0 */
void clear_array(int *dest, int n) {
    int i;
    for (i = 0; i < n; i++)
	dest[i] = 0;
}
/* $end clear_array */

/* $begin clear_array_4 */
/* Set elements of array to 0, Unrolled X 4 */
void clear_array_4(int *dest, int n) {
    int i;
    int limit = n-3;
    for (i = 0; i < limit; i+= 4) {
	dest[i] = 0;
	dest[i+1] = 0;
	dest[i+2] = 0;
	dest[i+3] = 0;
    }
    for (; i < limit; i++)
	dest[i] = 0;
}
/* $end clear_array_4 */

void array_copy(int *src, int *dest, int n)
{
    int i;
    for (i = 0; i < n; i++)
	dest[i] = src[i];
}

/* Set element of array to 0 */
void array_clear(int *src, int *dest, int n)
{
    int i;

    for (i = 0; i < n; i++)
	dest[i] = 0;
}

static void mem_clear(int *src, int *dest, int n)
{
    memset((void *) dest, '\0', n*sizeof(int));
}


static void array_copy_2(int *src, int *dest, int n)
{
    int i;
    int len = n-1;
    for (i = 0; i < len; i+=2) {
	dest[i] = src[i];
	dest[i+1] = src[i+1];
    }
    for (; i < n; i++)
	dest[i] = src[i];
}

static void array_clear_2(int *src, int *dest, int n)
{
    int i;
    int len = n-1;
    for (i = 0; i < len; i+=2) {
	dest[i] = 0;
	dest[i+1] = 0;
    }
    for (; i < n; i++)
	dest[i] = 0;
}

static void array_copy_4(int *src, int *dest, int n)
{
    int i;
    int len = n-3;
    for (i = 0; i < len; i+=4) {
	dest[i] = src[i];
	dest[i+1] = src[i+1];
	dest[i+2] = src[i+2];
	dest[i+3] = src[i+3];
    }
    for (; i < n; i++)
	dest[i] = src[i];
}

static void array_clear_3(int *src, int *dest, int n)
{
    int i;
    int len = n-2;
    for (i = 0; i < len; i+=3) {
	dest[i] = 0;
	dest[i+1] = 0;
	dest[i+2] = 0;
    }
    for (; i < n; i++)
	dest[i] = 0;
}

static void array_clear_4(int *src, int *dest, int n)
{
    int i;
    int len = n-3;
    for (i = 0; i < len; i+=4) {
	dest[i] = 0;
	dest[i+1] = 0;
	dest[i+2] = 0;
	dest[i+3] = 0;
    }
    for (; i < n; i++)
	dest[i] = 0;
}

typedef void (*copy_fun)(int *, int *, int);


#define TEST_COUNT 9

static copy_fun copier[TEST_COUNT] = 
    {
	write_read,
	array_clear, array_clear_2, array_clear_3, array_clear_4,
	mem_clear,
	array_copy, array_copy_2, array_copy_4,
    };

static char *test_descr[TEST_COUNT] = 
    {
	"Write-read",
	"Array clear",
	"Array clear  x2",
	"Array clear  x3",
	"Array clear  x4",
	"Mem clear",
	"Array copy",
	"Array copy  x2",
	"Array copy  x4"
    };

int idx = 0;

#define CASE_COUNT 4

static void test2a(int n)
{
    copier[idx](data,data,n);
}

static void test2b(int n)
{
    copier[idx](data,data+1,n);
}
#if CASE_COUNT == 4
static void test2c(int n)
{
    copier[idx](data+1,data,n);
}

static void test2d(int n)
{
    copier[idx](data, data2, n);
}
#endif



typedef void (*test_fun)(int);

static test_fun case_fun[CASE_COUNT] =
{ test2a, test2b
#if CASE_COUNT == 4
  , test2c, test2d
#endif
};

static char *case_descr[CASE_COUNT] = 
{ "data --> data",
  "data --> data+1",
#if CASE_COUNT == 4
  "data+1 --> data",
  "data1 --> data2"
#endif
};

static void run_test(int i, int c) 
{
    double cpe;
    printf("Description: %s, %s, ",
	   test_descr[i], case_descr[c]);
    idx = i;
    cpe = find_cpe(case_fun[c], ASIZE);
    /* print results */
    printf("CPE = %.2f\n", cpe);
}

int main()
{
    int i, c;

    for (i = 0; i < TEST_COUNT; i++)
	for (c = 0; c < CASE_COUNT; c++)
	    run_test(i,c);

    return 0;
}

