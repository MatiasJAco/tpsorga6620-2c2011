;*********** WINDLX 
;--------------------------------------------------------------------------

		.text
		.global	main

main:
	add r1,r1,0  ;a = 0
	add r2,r2,0	;i=0
	add r5,r0,10
	add r6,r5,1
	add r7,r0,2
	
Loop:
	sge r8,r2,r5
	bnez r8,Fin
	andi r3,r2,#1
	bnez r3,Modulo
	add r1,r1,r2
Modulo:	sgt r8,r1,r6
	bnez r8,Fin
	add r2,r2,1  ;i++
	j Loop




Fin:	;***end
	trap		0
