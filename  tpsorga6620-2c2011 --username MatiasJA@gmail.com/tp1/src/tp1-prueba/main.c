#include <unistd.h>
#include <strings.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <err.h>
#include <math.h>
#include <string.h>


#define TAMANIO_PILA 4

/*Inserta un nuevo valor en la pila.
 Devuelve 1 en caso de correcta insercion.
 0 en cualquier otro caso.*/
extern int Push(double *topePila, int tamanioPila, int *cantidadElementos,
		double valor);

/*Quita el elemento tope de la pila. Pasando el valor a obtener por parametro.
 Devuelve 1 en caso de haber podido obtener un elemento.
 0 en cualquier otro caso.*/
extern int Pop(double *topePila, int tamanioPila, int *cantidadElementos,
		double *valor);

/*Recorre toda la pila sumando todos los elementos que la componen
 retornando el resultado de la suma.
 Devuelve 1 en caso de haber podido obtener la suma total de los elementos.
 0 en cualquier otro caso.
 */
extern int SumaTotal(double *topePila, int tamanioPila, int *cantidadElementos,
		double *resultadoSuma);


void VerificarError(int resultadoOperacion) {
	if (resultadoOperacion != 1) {
		exit(1);
	}
}

int main(void) {

	double pila[TAMANIO_PILA];
	int cantidadElementos = 4;
	double elemento = 0;

	pila[0] = 1.0;
	pila[1] = 2.0;
	pila[2] = 3.0;
	pila[3] = 4.0;

	int res;

	res = Pop(pila,TAMANIO_PILA,&cantidadElementos,&elemento);
	printf("Res: %i :: Tome %f\n",res,elemento);

	res = Pop(pila,TAMANIO_PILA,&cantidadElementos,&elemento);
	printf("Res: %i :: Tome %f\n",res,elemento);

	res = Pop(pila,TAMANIO_PILA,&cantidadElementos,&elemento);
	printf("Res: %i :: Tome %f\n",res,elemento);

	res = Pop(pila,TAMANIO_PILA,&cantidadElementos,&elemento);
	printf("Res: %i :: Tome %f\n",res,elemento);

	res = Pop(pila,TAMANIO_PILA,&cantidadElementos,&elemento);
	printf("Res: %i :: Tome %f\n",res,elemento);

	return 0;
}
