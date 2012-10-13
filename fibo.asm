xor 	r0, r0, r0 		#r0 should be set to 0	
mvi 	r1, 1			#r1 and r2 hols first value of fibo
mvi		r2, 1
mvi		r8, 1			#Loop decrement
mvi		r9, 6			#back-loop address
mvi		r10, 10			#r10 is loop counter
						#convoluted loop since back-loop not yet implemented

add		r3, r1, r2		#Fibo core
mv		r1, r2
mv		r2, r3


sub		r10, r10, r8	#decrement loop counter
be		r10, r0, 8		#Implement loop-back with 2 branches
b		r9
nop
sw 		(r0+64), r3
nop
nop
nop
