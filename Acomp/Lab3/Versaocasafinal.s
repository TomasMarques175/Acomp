# Programa L3
# Ex.5

.data
	x: .word 9
	y: .word 3

.text
	lw a0, x
	lw a1, y

	addi sp, sp, -8
	sw a0, 4(sp)
	sw a1, 0(sp)

	jal Pow

	lw a0, 0(sp)
	addi sp, sp, 4

	li a7, 1
	ecall

	li a7, 10
	ecall

Pow:
	addi sp, sp, -24
	sw ra, 20(sp)
	sw s1, 16(sp)
	sw a0, 12(sp)
	sw a1, 8(sp)
	sw a2, 4(sp)
	sw a3, 0(sp)
	
	lw a0, 24(sp) 			# y

	beq a0, zero, igual1 	# se y igual a 0 go to igual1

	srli a1, a0, 1 			# h

	li a2, 2				

	rem a2, a0, a2			# determinar se h é par ou ímpar(y%2)

	bne a2,zero, else		# se h for ímpar go to else
	
	lw a3, 28(sp) 			# x

	addi sp, sp, -8
	sw a3, 4(sp) 			# x
	sw a1, 0(sp) 			# h

	jal	Pow

	lw a0, 0(sp) 			# pow(x,h)

	addi sp, sp, -4
	sw a0, 0(sp)			

	jal Mult 				

	lw s1, 0(sp)
	addi sp, sp, 4

	j end

else:
	lw a0, 28(sp) 			# x
	
	addi sp, sp, -8
	sw a0, 4(sp) 			# x
	sw a1, 0(sp)		 	# h

	jal Pow
	
	lw a0, 0(sp) 			# pow(x,h)

	addi sp, sp, -4
	sw a0, 0(sp)

	jal Mult

	lw a0, 32(sp) 			# x

	addi sp, sp, -4
	sw a0, 0(sp)

	jal Mult

	lw s1, 0(sp)
	addi sp, sp, 4

	j end

igual1:
	li s1, 1

end:
	sw s1, 28(sp)

	lw ra, 20(sp)
	lw s1, 16(sp)
	lw a0, 12(sp)
	lw a1, 8(sp)
	lw a2, 4(sp)
	lw a3, 0(sp)
	addi sp, sp, 28

	ret

Mult:
	addi sp, sp, -12
	sw s1, 8(sp)
	sw s2, 4(sp)
	sw s3, 0(sp)

	lw s2, 16(sp)
	lw s1, 12(sp)

	li s3, 0

	beq s2, zero, OutMul
	beq s1, zero, OutMul

MulLoop:
	add s3, s3, s1
	addi, s2, s2, -1
	bne s2, zero, MulLoop

OutMul:
	sw s3, 16(sp)

	lw s3, 0(sp)
	lw s2, 4(sp)
	lw s1, 8(sp)
	addi sp, sp, 16

	ret