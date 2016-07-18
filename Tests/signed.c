#include <stdio.h>
#include <limits.h>
#include "klee.h"

int main(void) {
	long a = LONG_MAX;
	klee_make_symbolic(&a, sizeof(a), "a");
	int c = a;
//	printf("a: %d \n", (int) a);
	printf("c: %d \n", c);
	return 0;
}
