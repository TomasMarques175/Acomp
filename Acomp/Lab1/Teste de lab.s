.data
    a: .word 1
    vcc: .zero 10

    .text
    la x10, a
    lw x10, a
    la x11, a
    li x12, 10

    li x15, 1
    li x14, 1

fatorial: addi x11, x11, 4 #n[i]= y

        mul x14, x14, x15  #i!
        sub x10, x14, x15   #i!-i

        sw x10, 0(x11)

    #operacao de incremento
    addi x15, x15, 1
    blt x15, x12, fatorial

   

end: li x17,10
    ecall