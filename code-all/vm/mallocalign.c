#include <stdlib.h>

int main() {
	int i;
	char *p;

	for (i=0; i<1000; i++) {
		p = (char *) malloc (i*100);
		printf("p=%p\n", p); 
	}
}
