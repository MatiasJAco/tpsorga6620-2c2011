#include <mips/regdef.h>

# Valores de retorno: 	$v0 = 0 --> Salida Ok, se carga el valor del tope de la pila en elemento
# 			$v0 = 1 --> Salida NoOk, no hay elementos en la pila

.globl	Pop
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
	bgtz		v0,Procesar		# if (cantidadElementos > 0) Procesar , else retorno 1
	li		v0,1
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
	li		v0,0
	j		Fin

Fin:
	move		sp,$fp
	lw		$fp,12(sp)
	addu		sp,sp,16
	j		ra
