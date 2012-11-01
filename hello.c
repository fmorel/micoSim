#include "stdio.h"

/*
int fibo(int n) {
	if (n <= 1)
		return 1;
	return (fibo(n-1) + fibo (n-2));
}
*/

int add(int a, int b) {
	return a+b;
}

volatile int *result = (volatile int *)0x200;

int main(void) {
	
	//*result = fibo(8);
	*result = add(64, 63);
	//printf("Hello world!\n");
	return 0;
}
