//============================================================================
// Name        : tp0.cpp
// Author      : Matías
// Version     : 1.00
// Copyright   : Your copyright notice
// Description : Join command simple implementation.
//============================================================================

#include <iostream>
#include <fstream>
#include <iomanip>

using namespace std;

int main() {
	ifstream arch1("archivo1");
	ifstream arch2("archivo2");
	char clave1;
	char clave2;
	string linea,cadena1,cadena2;

	bool encontrada,fin=false;
	if (arch1.good())
	cout << "El archivo archivo1 fue abierto correctamente";
	else
	cout << "El archivo archivo1 no pudo ser abierto correctamente";
	cout << endl;
	while (arch1>>clave1 && !fin ){
		getline(arch1,cadena1);
		//Buscar clave en el segundo archivo.
		while (!encontrada && arch2>>clave2 ){
			if(clave1==clave2){
				encontrada =true;
				getline(arch2,cadena2);
			} else {
			//Saltear  linea
				getline(arch2,linea);
			}
		}
	//Mostrar cadenas unidas.
		if (encontrada){
			cout<<clave1<<" "<<cadena1<<" "<<cadena2<<"\n";
			encontrada=false;
			arch2.seekg (0, ios::beg);
		} else {
			fin =true;
		}
	}
	if (fin) {
		cerr<<"No se encontro la clave en el segundo archivo \n";
		}

	arch1.close();
	arch2.close();
	return 0;
}
