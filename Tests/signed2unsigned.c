#include <stdio.h>
#include <limits.h>
#include "klee.h"

int main(void) {
	int a = -1;
	klee_make_symbolic(&a, sizeof(a), "a");
	unsigned int c = a;
	printf("c: %u \n", c);
	return 0;
}
