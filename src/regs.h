#define REGS_BASE 	0x40000

#define REG_LEDS 	0x00
#define REG_TTY 	0x10
#define REG_KEYBD	0x20

#define READ_REG(nAME) 	(*((volatile unsigned int *)(REGS_BASE + REG_ ## nAME)))
#define WRITE_REG(nAME,vAL)	READ_REG(nAME)=vAL

