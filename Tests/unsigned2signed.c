#include <stdio.h>
#include <limits.h>
#include "klee.h"

int main(void) {
	unsigned int a = UINT_MAX;
	klee_make_symbolic(&a, sizeof(a), "a");
	char c = a;
	printf("c: %d \n", c);
	return 0;
}
