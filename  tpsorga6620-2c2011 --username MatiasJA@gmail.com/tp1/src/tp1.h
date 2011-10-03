/*
 * tp1.h
 *
 *  Created on: 02/10/2011
 *      Author: kira
 */

#ifndef TP1_H_
#define TP1_H_

/*
   6620 STACK API
*/
/*Inserta un nuevo valor en la pila.
   Devuelve 1 en caso de correcta insercion.
   0 en cualquier otro caso.*/
int Push(double *topePila,int tamanioPila,int *cantidadElementos,double valor);
/*Quita el elemento tope de la pila. Pasando el valor a obtener por parametro.
   Devuelve 1 en caso de haber podido obtener un elemento.
   0 en cualquier otro caso.*/
int Pop(double *topePila,int tamanioPila,int *cantidadElementos,double *valor);
/*Recorre toda la pila sumando todos los elementos que la componen
   retornando el resultado de la suma.
   Devuelve 1 en caso de haber podido obtener la suma total de los elementos.
   0 en cualquier otro caso.
*/
int SumaTotal(double *topePila,int tamanioPila,int *cantidadElementos,double *resultadoSuma);

#endif /* TP1_H_ */
