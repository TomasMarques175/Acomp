.data
	a: .word 1		#f(1)
	b: .word 1		#f(2)

.text
	la x10, a			#Load do adress de f(1)

	li x14, 2			#inicializa a 2 pois ja temos os 2 primeiros valores da sucessao
	li x15, 7			#pretende-se fazer a contagem ate ao 10 termo da sucessao

loop:	
	lw x11, 0(x10)			#Load do valor da memoria referente a f(n-1)
	lw x12, 4(x10)			#Load do valor da memoria referente a f(n)
	add x13, x12, x11		#Soma de f(n-1) com f(n)
	sw x13, 8(x10)			#Store do valor da soma no endereco X13
	
	addi x14, x14, 1	  	#contagem do numero de ciclos
	addi x10, x10, 4	  	#salta para a posicao de memoria seguinte

	blt x14, x15, loop   	#repete o ciclo ate atingir o decimo termo da sucessao
	
	li x16, 1

while:
    slli x16, x16, 1
    sw x16, 12(x10)
    blt x16, x13, while

end:
	li x17, 10         		#fim do programa
	ecall