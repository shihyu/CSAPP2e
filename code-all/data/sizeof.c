/* Demonstration of bug involving sizeof */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* $begin copy_int */
/* Copy integer into buffer is space is available */
/* WARNING: The following code is buggy */
void copy_int(int val, void *buf, int maxbytes) {
    if (maxbytes-sizeof(val) >= 0)
	/* $end copy_int */
	{
	    printf("copy_int: Copying %d bytes (room for %d)\n", sizeof(val), maxbytes);
	    /* $begin copy_int */
	    memcpy(buf, (void *) &val, sizeof(val));
	    /* $end copy_int */
	    printf("Result = 0x%x\n", *(int *) buf);
	}
    /* $begin copy_int */
}
/* $end copy_int */

/* Copy integer into buffer is space is available */
void copy_int_fixed(int val, void *buf, int maxbytes) {
    /* $begin copy_int_fix */
    if (maxbytes >= sizeof(val))
	/* $end copy_int_fix */
	{
	    printf("copy_int_fixed: Copying %d bytes (room for %d)\n", sizeof(val), maxbytes);
	    memcpy(buf, (void *) &val, sizeof(val));
	    printf("Result = 0x%x\n", *(int *) buf);
	}
}

int main(int argc, char *argv[]) {
    int val = 0xDEADBEEF;
    char buf[50];
    int maxbytes = argc > 1 ? atoi(argv[1]) : sizeof(int);
    copy_int(val, buf, maxbytes);
    copy_int_fixed(val, buf, maxbytes);
    return 0;
}
