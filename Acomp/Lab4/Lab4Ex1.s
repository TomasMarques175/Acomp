# Computer Architectures
# Lab: Pipelining
# Nuno.Roma@ist.utl.pt
# IST, Lisbon-Portugal, 2020-05-04

# The following program processes two arbitrarily sized one-dimensional
# vectors composed by N integer elements, in order to execute
# the following pseudo-code algorithm:
 
#    int a[N] = { ..... }
#    int b[N] = { ..... }
#    int x = 1;
#    int n = 0;
#    register int i = 0;
#    while (b[i]>0){
#        x *= a[i] + a[N-1-i];
#        n += (N-1-i) - i;
#        i ++;
#    }

# Data section
        .data
# IMPORTANT: do not change this section
a:		.word  1, 5, 6, 6, 7, 2, 5, 2, 3, 2, 3, 4
b:		.word  4, 3, 1, 7, 2, 4, 9, -3, 5, 8, 1, 9
x: 		.word  1
n:		.word  0   

# Program section
.text
		addi    x11, x3, 0
		lw 	x14, 100(x3)			
		lw	x15, 96(x3)			
		li 	x16, 0			
		addi    x13, x11, 48
		nop				
		nop				
		nop				
		addi	x12, x13, -4		

while:	add	x20, x13, x16
		lw 	x22, 0(x11)			
		lw 	x23, 0(x12)
		nop
		lw	x21, 0(x20)
		nop
		nop
		nop			
		blez	x21, end	
		add	x22, x22, x23
		addi 	x16, x16, 4			
		nop
		addi	x12, x12, -4		
		mul 	x15, x15, x22		
		sub	x22, x12, x11	
		addi	x11, x11, 4
		nop
		nop
		srai	x22, x22, 2
		nop
		nop
		nop			
		add	x14, x14, x22		
		jal 	x0, while
		nop
		nop
end:	addi	a7, x0, 10
		sw 	x14, 100(x3)		
		sw 	x15, 96(x3)	
		nop
		ecall

# Expected result: M[x] = 1270080 = 136140h
#                  M[n] = 35      = 23h