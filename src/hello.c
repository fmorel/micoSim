#include "regs.h"

int add(int a, int b) {
	return a+b;
}

int main(void) {
	WRITE_REG(LEDS, 1);	
	//*result = fibo(8);
	puts("Hello world!\n");
	
	int i= add(2,2);
	char buf[32];
	
	intToString(i, 10, buf);
	puts("2+2 = ");
	puts(buf);
	return 0;
}
