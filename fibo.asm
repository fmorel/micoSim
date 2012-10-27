xor 	r0, r0, r0 		#r0 should be set to 0	
mvi 	r1, 1			#r1 and r2 hols first value of fibo
mvi		r2, 1
mvi		r10, 10			#r10 is loop counter

loop:
add		r3, r1, r2		#Fibo core
mv		r1, r2
mv		r2, r3

addi	r10, r10, -1	#decrement loop counter
bne		r10, r0, loop	#End of loop
sw 		(r0+64), r3		#Store result somewhere in RAM
nop
