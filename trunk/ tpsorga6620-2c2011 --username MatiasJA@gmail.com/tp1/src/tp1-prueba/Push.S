#$2(=$v0) ->códDevolucionFuncion (int)
#$4(=$a0) ->ptrADoubleTopePila (double*)
#$5(=$a1) ->tamanioPila (int)(CANT_MAX_ELEMS)
#$6(=$a2) ->ptrCantElementos	(int*)
#$f12-$f13 ->valorDoubleAInsertar (double)
#include <mips/regdef.h>
.globl Push
Push:
subu sp,sp,8	#reservo espacio para mi función
sw $fp,4(sp)	#guardo el fp;
sw gp,0(sp)	#guardo el gp;
move $fp,sp
#guardo los 4 argumentos
sw a0,8($fp)	#guardo ptrADouleTopePila
sw a1,12($fp)	#guardo tamanioPila
sw a2,16($fp)	#guardo prtCantElementos
s.d $f12,20($fp) #guardo los 32bits menos sig. en 20($fp) y los 32 más en 24($fp) de valorDoubleAIsertar

###### chequeo de rango y si se produjo alguna excepción ######
#mfc1 t1,$f31
#bne t1,$0,NoSePuedeInsertarElemento

###### verificar que no este completo el vector ######
lw t0,0(a2)	#guardo cantElems en un reg temporal
lw t1,12($fp)	#guardo en t1 el tamanioPila
sub t2,t0,t1	#(t2 = cantElems - tamanioPila)
bgez t2,NoSePuedeInsertarElemento #(cantElems >= tamanioPila)Si->NoSePuedeInsertarElemento

###### Se puede agregar el elemento ######
#agrego elemento en la direccion=inicioArray + cantElems*8
#incremento cantElems
#devuelvo un 1
lw t0,0(a2)	#cargo la cantElems
mul t1,t0,8	#t1=cantElems*8 (t1 va a contener la cant de bytes hacia adelante donde guardar.
add t2,a0,t1	#t2=x+cantElems*8 t2 va a contener la nueva dir adonde guardar el dato
s.d $f12,0(t2)	#guardo el dato pasado por parametro
addu t0,t0,1	#incremento cantidad de Elems.
sw t0,0(a2)	#guardo la nueva cantElems en la direcc apuntada por el ptr.
lw $2,1		#códDevolucionFuncion = 1
j fin
NoSePuedeInsertarElemento: move $2,$0	#códDevoluciónFuncion = 0
fin: move sp,$fp
lw $fp,4(sp)
lw gp,0(sp) #(no estaba en un ejemplo de la practica pero si en otro)
addiu sp,sp,8 #Devuelvo los bytes reservados para el stackframe
jr ra	#ultima sentencia de mi funcion
