/* Try to find how GCC allocates stack space */

#include <stdio.h>
#include <stdlib.h>

int proc1(int n) {
    int local[1];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

int proc2(int n) {
    int local[2];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

int proc3(int n) {
    int local[3];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

int proc4(int n) {
    int local[4];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

int proc5(int n) {
    int local[5];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

int proc6(int n) {
    int local[6];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

int proc7(int n) {
    int local[7];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

int proc8(int n) {
    int local[8];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

int procn(int n) {
    int local[n+1];
    if (n < 0)
	return n;
    else
	return proc1(local[n]);
}

typedef int (*proc_t)(int);

proc_t procs[] = { proc1, proc2, proc3, proc4, proc5, proc6, proc7, proc8, procn };

int main(int argc, char *argv[]) {
    int index = 0;
    if (argc > 1)
	index = atoi(argv[1]);
    procs[index](10);
    return 0;
}
