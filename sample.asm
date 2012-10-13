xor 	r0, r0, r0 		#r0 should be set to 0	
or 		r1, r0, r0 		#reset r1 and r2 (with 2 different operation :p)
bi		8
addi	r1, r1, 0xbad
addi	r1, r1, 0xbee
sw		(r0+64), r1
nop	
nop
nop
nop
nop
