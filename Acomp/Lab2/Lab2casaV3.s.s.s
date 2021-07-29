    .data
a: .word 1
b: .word 0
c: .word 1

    .text

#funcao principal
rede_neuronal_xor:
    lw x11, a
    lw x12, b
	lw x16, c

    #c
    li x13, 2    #w1
    li x14, -2    #w2
    li x15, -1    #const

    jal neuronio

    #d
    li x13, -2    #w1
    li x14, 2    #w2
    mv x17, x10    #x10 -> x17

    jal neuronio

    #y
    li x13, 2
    mv x11, x17   #x11 -> c
    mv x12, x10   #x12 -> d

    jal neuronio
	
	lw x11, c
    lw x12, a
	li x13, 2
	li x14, 2
	li x15, -1

	mv x17, x10  #valor de S

	jal neuronio
	
	mv x11, x17
	mv x12, x10
	li x13, 2
	li x14, 2
	li x15, -3

	jal neuronio

    li x17,1
    ecall

    li x17, 10
    ecall

neuronio:
    #salvaguarda de contexto
    addi sp,sp, -28
    sw x1, 24(sp)
    sw x11, 20(sp)    #x1 = a
    sw x12, 16(sp)    #x2 = b
    sw x13, 12(sp)    #w1
    sw x14, 8(sp)    #w2
    sw x15, 4(sp)    #-1
    sw x17, 0(sp)    #return

    jal multiplica

    #reposicao de contexto
    lw x18, 0(sp)    #x1 * w1
    lw x17, 4(sp)
    lw x15, 8(sp)
    lw x14, 12(sp)
    lw x13, 16(sp)
    lw x12, 20(sp)
    lw x11, 24(sp)
    lw x1, 28(sp)
    addi sp, sp, 32

    #salvaguarda de contexto
    addi sp,sp, -32
    sw x18, 28(sp)
    sw x1, 24(sp)
    sw x12, 20(sp)    #b
    sw x11, 16(sp)    #a
    sw x14, 12(sp)    #w1
    sw x13, 8(sp)    #w2
    sw x15, 4(sp)    #-1
    sw x17, 0(sp)    #return

    jal multiplica

    #reposicao de contexto
    lw x19, 0(sp)    #x2 * w2
    lw x17, 4(sp)
    lw x15, 8(sp)
    lw x13, 12(sp)
    lw x14, 16(sp)
    lw x11, 20(sp)
    lw x12, 24(sp)
    lw x1, 28(sp)
    lw x18, 32(sp)
    addi sp, sp, 36

#####################################################
    #s
    add x20, x18, x19
    add x20, x20, x15

    bge x20, zero, else #if s>=0 -> else
    addi x10, zero, 0

    ret

else:
    addi x10, zero, 0
    ret

#####################################################

multiplica:
    lw x20, 20(sp)    #xi
    lw x21, 12(sp)    #wi

    add x18, zero, zero
    add x19, zero, zero

    bgt x21, zero, mul    #if wi>0 -> mul

    #Complemento para 2
    not x21, x21    #~wi
    addi x21, x21, 1

    addi x19, x19, 1

mul:
    add x18, x18, x20    #0 + xi
    addi x21, x21, -1    #wi - 1

    bgt x21, zero, mul    #if wi>0 -> mul

    ble x19, zero, end    #if x19<= 0 -> end

    #Complemento para 2
    not x18, x18
    addi x18, x18, 1

end:
    addi sp,sp -4
    sw x18, 0(sp)
    ret