#include <mips/regdef.h>

.globl SumaTotal
SumaTotal:

	subu 	sp,sp,16
	sw		$fp,12(sp)
	sw		gp,8(sp)
	move	$fp,sp

	sw		a0,16($fp)		//puntero a tope de fila
	sw		a1,20($fp)		//tamaño de la pila
	sw		a2,24($fp)		//puntero a cantidad de elementos
	sw		a3,28($fp)		//puntero al resultado


//valido cant > 0, sino SumaExitFail
	lw		t0,24($fp)		//cargo el puntero
	lw		t0,0(t0)		//cargo el valor al que apunta
	blez	t0,SumaExitFail

//inicializo el punteo a los elementos
	lw		t1,16($fp)		//cargo el puntero
	l.d		$f0,0(t1)		//cargo el valor al que apunta

sumar:
	subu	t0,t0,1			//decremento la cantidad
	blez	t0,SumaExitOK	//si ya no hay elementos dejo de sumar
	addi	t1,t1,8			//incremento el puntero 8 bytes = double
	l.d		$f2,0(t1)		//cargo el siguiente valor
	add.d	$f0,$f0,$f2		//sumo el nuevo valor al acumulado
	//TODO hacer checkeo de over/underflow
	j		sumar



SumaExitOK:
	lw		t3,28($fp)
	s.d		$f0,0(t3)
	addi	v0,zero,1
	j		SumaExit

SumaExitFail:
	li		v0,0

SumaExit:
	move	sp,$fp
	lw		$fp,12(sp)
	lw		gp,8(sp)
	addu	sp,sp,16
	j		ra
