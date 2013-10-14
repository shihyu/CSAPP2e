/* Generate factorials, checking for overflow */

#include <stdio.h>
#include <stdlib.h>

int tmul_ok_64(long long x, long long y, long long *dest) {
    long long z = x * y;
    *dest = z;
    return !x || z/x == y;
	 
}

void gen_table_64() {
    long long i = 0;
    long long fact = 1;
    int ok = 1;
    do {
	    i++;
	    ok = tmul_ok_64(fact, i, &fact);
	    printf("%lld! = %lld (%s)\n", i, fact, ok ? "OK" : "Overflow");
	} while (ok);
}


int tmul_ok_32(int x, int y, int *dest) {
    int z = x * y;
    *dest = z;
    return !x || z/x == y;
	 
}

void gen_table_32() {
    int i = 0;
    int fact = 1;
    int ok = 1;
    do {
	    i++;
	    ok = tmul_ok_32(fact, i, &fact);
	    printf("%d! = %d (%s)\n", i, fact, ok ? "OK" : "Overflow");
	} while (ok);
}

int main() {
    printf("32 bits:\n");
    gen_table_32();
    printf("64 bits:\n");
    gen_table_64();
}
