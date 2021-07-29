.data
	array: .word 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 		

.text
	la x10, array		
	li x14, 2		
	li x15, 10		

for:
	
	lw x11, 0(x10)		
	lw x12, 4(x10)		
	add x13, x12, x11	
	sw x13, 8(x10)		
	addi x14, x14, 1	
	addi x10, x10, 4	
	blt x14, x15, for

	lw	 x16, 4(x10)
	li	 x13, 1
	li	 x14, 2

loop:
	mul	 x13, x13, x14
	blt	 x13, x16, loop

	srai x13, x13, 1
	sw	 x13, 8(x10)

end:
	li x17,10		
	ecall