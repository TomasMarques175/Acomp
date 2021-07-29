.data

	u1: .word 1		#f(1)
	u2: .word 1


.text

	la x10, u1		#Load do adress de f(1)
	li x14, 1		#inicializa a 2 pois ja temos os 2 primeiros valores da sucessao
	li x15, 10		#pretende-se fazer a contagem ate ao 10 termo da sucessao
	li x17, 1

for:

	bge x14, x15, end	#repete o ciclo ate atingir o decimo termo da sucessao defenido no li da linha 10

	lw x11, 0(x10)		#Load do valor da memoria referente a f(n-1)

	Mul x12, x12, x11
	sub x12, x12, x17
	sw x12, 4(x10)		#Store do valor da soma no adress X13

	addi x14, x14, 1	#contagem do numero de ciclos
	addi x10, x10, 4	#salta para a posicao de memoria seguinte

	j for

end:

	li x17,10		#termina o programa
	ecall