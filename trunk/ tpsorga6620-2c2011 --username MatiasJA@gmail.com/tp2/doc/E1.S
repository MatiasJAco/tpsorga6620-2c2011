;*********** WINDLX 
;--------------------------------------------------------------------------
	.data
	.global		A
	.global		B
	.global		C
	.global		D	
	
A: 	.float 4
B: 	.float 5
C: 	.float 7
D: 	.float 3

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
	subf f7, f7, f2 ; (A+C)-B
	multf f7, f7, f3 ; ((A+C)-B)*C
	subf f7, f7, f5; (((A+C)-B)*C)-X

	divf f8,f6,f7 ; Z=((((A+C)-B)*C)-X)/Y	
	
	multf f5, f5, f6 ; X*Y
	multf f5, f5, f4 ; A=X*Y*3

Fin:	;***end
	trap 0
