#include "regs.h"

int puts (const char *s)
{
	char c = s[0];
	int i = 0;
	while (c!=0) {
		i++;
		WRITE_REG(TTY, (unsigned int) c);
		c=s[i];
	}
	return i;
}

static const char digits[16] =
	{'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};

int intToString(int a, unsigned int base, char *str)
{
	char buf[32];
	int i=0,n;
	unsigned int abs;

	if (a<0) {
		abs = (unsigned int) -a;
		str[0]='-';
		str++;
	} else {
		abs = (unsigned int) a;
	}
	
	//Get digits in reverse order
	while (abs > 0) {
		buf[i]= digits[abs%base];
		abs/=base;
		i++;
	}

	//reverse string
	n=i;
	for(i=0;i<n; i++) {
		str[i]=buf[n-i-1];
	}
	//NULL character at the end
	str[n]=0;
	return n;
}

