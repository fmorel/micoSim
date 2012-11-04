.global _start
.extern  main
.section .boot,"x"

_start:
	mvi sp,  0x4000
	addi fp, sp, 4
	calli main
	nop
	.space 4,0xac #will trigger instruction 'raise' and stall the cpu

