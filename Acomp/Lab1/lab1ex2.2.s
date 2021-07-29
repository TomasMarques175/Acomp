.data
	a: .word 1		
	b: .word 1		

.text
	la x10, a			

	li x14, 2			
	li x15, 7			

loop:	
	lw x11, 0(x10)			
	lw x12, 4(x10)			
	add x13, x12, x11		
	sw x13, 8(x10)			
	addi x14, x14, 1	  
	addi x10, x10, 4	  	

	blt x14, x15, loop   	
	
	li x16, 1

while:
    slli x16, x16, 1
    sw x16, 12(x10)
    blt x16, x13, while

end:
	li x17, 10         		#fim do programa
	ecall