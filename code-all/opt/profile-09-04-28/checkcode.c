#include <stdio.h>
#include <stdlib.h>

int main() {
    int c;
    while ((c = getchar()) != EOF) {
	printf("Character '%c', Code = 0x%x\n", c, c);
    }
    return 0;
}
