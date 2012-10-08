xor 	r0, r0, r0 		#r0 should be set to 0	
or 		r1, r0, r0 		#reset r1 and r2 (with 2 different operation :p)
and		r2, r0, r0
addi 	r1, r1, 1 
addi	r2, r2, 5
add 	r2, r2, r1
sw		(r0+64), r1 	#store r1 @address 
add		r1, r2, r2		#overwrite r1
nop
lw		r1, (r0+64) 	#load r1 from same address	
nop

