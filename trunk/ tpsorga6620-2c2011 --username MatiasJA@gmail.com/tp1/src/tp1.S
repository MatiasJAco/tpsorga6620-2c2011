#include <mips/regdef.h>
#include <sys/syscall.h>

	.text
	.globl	Push
	.ent Push
Push:
	subu sp,sp,8
	sw $fp,4(sp)
	sw gp,0(sp)
	move $fp,sp

	sw a0,8(sp)
	sw a1,12(sp)
	sw a2,16(sp)
	l.d $f2,24(sp)	#24 :8+16
start:

	lw t1,0(a2) # i=cantElem
	beq t1,a1,ERROR #LLENO
	mfc1 t4, $31 #chequea underflow y overflow
	li t5, 63
	andi t5, t4, 16
	bnez t5, FIN #Overflow
	li t5, 63
	andi t5, t4, 8
	bnez t5, FIN #Underflow
	move t3,t1
	add t3,t3,1
	sw t3,0(a2)
	move t2,t1
	sub t2,t2,1 # i-1


loop:
	bgtz t1,pushElem
	j FINLOOP

pushElem:
	sll t7,t1,3  #i *8
	sll t8,t2,3  # (i-1)*8
	add t9,a0,t7
	add t6,a0,t8
	l.d $f16, 0(t6)  #$f16<-pila[i-1]
	li.s $f18,0.0
	li.s $f19,0.0
	add.d $f18,$f18,$f16
	s.d $f18, 0(t9)
	sub t1,t1,1
	sub t2,t2,1
	j loop

ERROR:
	li v0,0
	j FIN
FINLOOP:
	s.d $f2,0(a0)
	li v0,1

FIN:
	move  sp,$fp
	lw $fp,4(sp)
	lw gp,0(sp)
	addu sp,sp,8
	jr ra
.end Push

  	.text
	.align	2  	
	.globl	SumaTotal
	.ent SumaTotal 
	
SumaTotal: 	
	.frame	$fp, 16, ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 16
	.cprestore	4
	
	sw		ra, 0(sp)
	sw		$fp, 8(sp)
	move	$fp, sp  # Guarda el parametro en el stack
	
	# SumaTotal(double *topePila,int tamanioPila, int *cantidadElementos, double *resultadoSuma)	
	sw		a0,16($fp)		#double *topePila
	sw		a1,20($fp)		#int tamanioPila
	sw		a2,24($fp)		#int *cantidadElementos
	sw		a3,28($fp)		#double *resultadoSuma 	
	
	lw	t0,20($fp)	#	tamanioPila 
	lw	t1,24($fp)	# 	int* cantidadElementos
	lw	t1,0(t1)	# 	cantidadElementos
	
	# si (tamanioPila > (*cantidadElementos))
	bgt	t0,t1,init_sum	
	move t1, t0			#n = tamanioPila
	
init_sum:	
	lw	t0,16($fp)		# $f0 = topePila[n]
	l.d	$f0,0(t0)
	
sumar:
	subu	t1, t1, 1 # n--
	beqz	t1,fin	  # n < 0 ?	
	
	addi	t0, t0,8	
	l.d		$f2,0(t0)	# $f2 = topePila[n]
	add.d	$f0,$f0,$f2	# $f0 = $f0 + $f2
	
	j	sumar

	
fin:	lw		t3,28($fp)
	s.d		$f0,0(t3)
	addi	v0,zero,1	

	move	sp,$fp
	lw		ra,0(sp)
	lw		$fp,8(sp)	
	addu	sp,sp,16
	jr		ra 
	
.end SumaTotal



# Valores de retorno: 	$v0 = 0 --> Salida Ok, se carga el valor del tope de la pila en elemento
# 			$v0 = 1 --> Salida NoOk, no hay elementos en la pila

  	.text
	.globl	Pop
	.ent Pop 

Pop:
	#armo la pila
	subu 		sp,sp,16
	sw		$fp,12(sp)
	sw		gp,8(sp)
	move		$fp,sp

	sw		a0,16($fp)		#puntero a tope de fila
	sw		a1,20($fp)		#size pila
	sw		a2,24($fp)		#puntero a 'cantidadElementos'
	sw		a3,28($fp)		#puntero al double

	lw		v0,24($fp)		#cargo el puntero
	lw		v0,0(v0)		#cargo el valor al que apunta
	bgtz		v0,Procesar		# if (cantidadElementos > 0) Procesar , else retorno 0
	li		v0,0
	j		Fin

Procesar:
	addu		v0,v0,-1		#decremento 'cantidadElementos' en 1
	lw		t1,24($fp)		#cargo el puntero en t1
	sw		v0,0(t1)		#guardo el nuevo valor

	sll		t1,v0,3			#ajusto el puntero segun el tamaño de la variable
	lw		v0,16($fp)		#cargo el puntero a la base de la pila
	addu		v0,t1,v0		#me posiciono en la direccion de memoria del elemento a tomar
	l.d		$f0,0(v0)		#leo el double en f0
	lw		t2,28($fp)		#cargo el puntero al double a devolver
	s.d		$f0,0(t2)		#cargo el double en la direccion apuntada por t2

FinOK:
	li		v0,1
	j		Fin

Fin:
	move		sp,$fp
	lw		$fp,12(sp)
	addu		sp,sp,16
	j		ra
.end Pop
