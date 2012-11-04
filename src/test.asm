xor 	r0, r0, r0
ori		r1, r0, 0xdead
mvi		r2, 0x100
sb		(r2+0), r1
sh		(r2+6), r1
nop
lbu		r3, (r2+6)
lb		r4, (r2+0)
nop
.space 4,0xac #will trigger instruction 'raise' and stall the cpu


