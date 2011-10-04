#include "tp1.h"


int Push(double *topePila,int tamanioPila,int *cantidadElementos,double valor)
{
	if (tamanioPila !=*cantidadElementos ){
		int i = *cantidadElementos;
		i++;
		for (;i>0;i--){
			topePila[i]= topePila[i-1];
		}
		topePila[0] = valor;
		(*cantidadElementos)++;
	}

	return 1;
}

int Pop(double *topePila,int tamanioPila,int *cantidadElementos,double *valor)
{
	return 1;
}

int SumaTotal(double *topePila,int tamanioPila, int *cantidadElementos, double *resultadoSuma)
{


	return 1;
}
