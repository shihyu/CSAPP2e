#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int i;
    int j;
    for (i = 1; i < 10; i++) {
	void *p = malloc(i * sizeof(float));
	float *fp = (float *) p;
	for (j = 0; j < i; j++) {
	    fp[j] = j * 3.3;
	}
	printf("Allocated %d.  Address = %p\n", sizeof(float)*i, p);
    }
    return 0;
}
