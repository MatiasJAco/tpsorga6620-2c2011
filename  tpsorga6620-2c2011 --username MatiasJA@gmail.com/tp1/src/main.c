/*
 * main.c
 *
 *  Created on: 02/10/2011
 *      Author: kira
 */
#include <stdlib.h>
#include <stdio.h>

#include "tp1.h"


extern int Push(double *topePila,int tamanioPila,int *cantidadElementos,double valor);
extern int Pop(double *topePila,int tamanioPila,int *cantidadElementos,double *valor);
extern int SumaTotal(double *topePila,int tamanioPila, int *cantidadElementos, double *resultadoSuma);


#define TAMANIO_PILA 4


void VerificarError(int resultadoOperacion){

	if(resultadoOperacion != 1){
		exit(1);
	}
}

int main(int argc, char *argv[])
{

	double pila[TAMANIO_PILA];
	double resultadoSuma = 0;
	int cantidadElementos = 0;
	double elemento;

	VerificarError(Push(pila,TAMANIO_PILA,&cantidadElementos,1.4));
	VerificarError(Push(pila,TAMANIO_PILA,&cantidadElementos,2.6));
	VerificarError(Push(pila,TAMANIO_PILA,&cantidadElementos,6));
	VerificarError(Push(pila,TAMANIO_PILA,&cantidadElementos,-2));
	VerificarError(Pop(pila,TAMANIO_PILA,&cantidadElementos,&elemento));
	VerificarError(SumaTotal(pila,TAMANIO_PILA,&cantidadElementos,&resultadoSuma));
	printf("El resultado de la suma de los valores de la pila es: %f\n",resultadoSuma);

	return 0;
}
