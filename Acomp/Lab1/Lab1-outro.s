.data
    a: .word 1   
    b: .zero  40 
    
    .text
    la x10, b  # arreio com 10 posi??es, seriam 11, mas o 0 est? no in?cio
    li x12, 1  # m?nimo da fun??o while
    li x14, 2  # primeiro fatorial, neste caso ? o 2, porque o 0 est? na data e o 1 ? dado por defeito como 0
    li x15, 0  # primeiro valor do contador
    li x16, 9  # fatorial m?ximo
    li x17,1   # vai servir como -1

    fatorialdequalquerum: # Vamos passar para o i seguinte
    add x13, x14, x0      # mover o valor de x14 para x13
    sub x11, x13, x17     # x13 - 1, fica guardado em x11
    
    while:                #vamos calcular i!
    mul x13, x13, x11     # multiplico i por i-1, fica guardado em x13
    sub x11, x11, x17    # i-1-1, fica guardado em x11
    bge x11, x12, while   # enquanto o x11>1, vai continuar a multiplicar

    sub x13, x13, x14     # Vamos subtrair i! por i
    addi x10, x10, 4      # Vamos passar para a posi??o seguinte [1], que corresponde ao 2
    sw x13, 0(x10)        # Vamos guardar o valor de x13 (i!-i) em x10

    
    addi x14, x14, 1      				# i+1 - n?mero da posi??o seguinte do arreio
    addi x15, x15, 1      				# O contador vai incrementar
    blt x15, x16, fatorialdequalquerum 	# Enquanto x15<9 o ciclo ir? realizar-se


    li x17, 10
    ecall

	
	
	
	





	

	