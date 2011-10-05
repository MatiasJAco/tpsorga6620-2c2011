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
	double suma = 0;
	int n = 0;
	
	if (tamanioPila > (*cantidadElementos))
		n = (*cantidadElementos);
	else
		n = tamanioPila;

	for (n; n > 0; n--)
	{
		suma += topePila[n-1];
	}
	
	(*resultadoSuma) = suma;
	
	return 1;
}
