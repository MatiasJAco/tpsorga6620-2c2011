;*********** WINDLX 
;--------------------------------------------------------------------------
.data
A:		.space		4
B:		.space		4
C:		.space		4
D:		.space		4		
		.text
		.global	main

main:
	
	addi r1,r1,#4
	addi r2,r2,#5
	addi r3,r3,#7
	addui r4,r4,#3
	sw A, r1
	sw B, r2
	sw C, r3
	sw D, r4
	add r5,r2,r3 ; X= B+C
	sub r6,r4,r3 ; Y= D-C
	add r7,r1,r3 ; A+C
	sub r7,r7,r2 ; (A+C)-B
	mult r7,r7,r3 ; ((A+C)-B)*C
	sub r7,r7,r5 ; (((A+C)-B)*C)-X
	movi2fp f8,r7	
	movi2fp f7,r6	
	cvti2d  f4,f7
	cvti2d f2,f8	
		
	divd f6,f2,f4; Z=((((A+C)-B)*C)-X)/Y
	addi r8,r8,#3
	mult r9,r6,r8 ; Y*3
	mult r1,r5,r9 ; A=X*Y*3
	sw A, r1
	
	

Fin:	;***end
	trap		0
	
	

	.data
	.global		A
	.global		B
	.global		C
	.global		D
	.global		E
	
A: 	.float 4
B: 	.float 5
C: 	.float 7
D: 	.float 3
E:	.float 3

.text
.global main

main:

	lf f1, A
	lf f2, B
	lf f3, C
	lf f4, D

	addf f5, f2, f3 ;X= B+C
	subf f6, f4, f3 ;Y= D-C

	addf f7, f1, f3 ; A+C
	subf f7, f7, f2
	multf f7, f7, f3
	subf f7, f7, f5

	divf f8,f6,f7
	
	lf  f9, E
	multf f5, f5, f6
	multf f5, f5, f9

Fin:	;***end
	trap 0
