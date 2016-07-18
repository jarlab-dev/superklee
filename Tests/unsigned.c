#include <stdio.h>
#include <limits.h>
#include "klee.h"

int main(void) {
	unsigned long a = ULONG_MAX;
	klee_make_symbolic(&a, sizeof(a), "a");
	unsigned int c = a;
	printf("c: %d \n", c);
	return 0;
}
