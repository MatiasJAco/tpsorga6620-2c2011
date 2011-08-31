#include <stdio.h>
#include <getopt.h>
#include "string.h"

typedef enum {TRUE, FALSE} bool;

//Headers.
void print_help(void);
void funcionJoin(char* filepath1, char* filepath2);
void limpiar (char *cadena);

int main(int argc, char **argv) {
	//Variables especiales para la función 'getopt_long'.
	static struct option long_options[] =
	{
		{"version", no_argument, 0, 'V'},
		{"help", no_argument, 0, 'h'},
		{"ignore-case", required_argument, 0, 'i'},
		{0, 0, 0, 0}
	};
	int option_index = 0;

	//Variables de estado de los argumentos del programa.
	bool h_flag, v_flag,i_flag;
//	bool ejecutar = FALSE;
	int c;

	//Utilizo la función 'getopt_long' para analizar los argumentos.
	h_flag = v_flag = i_flag = FALSE;
	while ((c = getopt_long (argc, argv, "hVi:", long_options, &option_index)) != -1) {
		switch (c) {
		case 'h':
			h_flag = TRUE;
			break;
		case 'V':
			v_flag = TRUE;
			break;
		case 'i':
			i_flag = TRUE;
			break;
		case '?': // Hubo un error en los argumentos, termino el programa.
			return 1;
			break;
		}
	}

	//Tomo acción en base a los argumentos pasados.
	if (v_flag == TRUE) {
		printf("Version 1.00\n");
		return 0;
	}
	if (h_flag == TRUE) {
		print_help();
		return 0;
	}
	if (i_flag == TRUE) {
		return 0;
	}
	char* filepath1;
	char* filepath2;
	char filepathConsole [100];
	if (argc > 1){
		filepath1=argv[1];
		if(argc >2){
			filepath2 = argv[2];
		} else{
			fgets(filepathConsole, 100, stdin);
			limpiar(filepathConsole);
			filepath2=&filepathConsole[0];
		}
		funcionJoin(filepath1, filepath2);
	}
	return 0;
}

//Imprime la ayuda.
void print_help(void) {

	printf("\nUsage: join [OPTION]... FILE1 FILE2\n");
	printf("For each pair of input lines with identical join fields, write a line to\n");
	printf("standard output. The default join field is the first, delimited\n");
	printf("by whitespace. When FILE1 or FILE2 (not both) is -, read standard input.\n");
	printf("  -i, --ignore-case  ignore differences in case when comparing fields\n");
	printf("  -h, --help         display this help and exit\n");
	printf("  -v, --version      output version information and exit\n");
	printf("Important: FILE1 and FILE2 must be sorted on the join fields.\n");
	printf("E.g., use ‘sort -k 1b,1’ if ‘join’ has no options.\n");
	printf("Note, comparisons honor the rules specified by ‘LC_COLLATE’.\n");
	printf("If the input is not sorted and some lines cannot be joined, a\n");
	printf("warning message will be given.\n\n");

	return;
}

void limpiar (char *cadena) {
  char *p;
  p = strchr (cadena, '\n');
  if (p)
    *p = '\0';
}
void funcionJoin(char* filepath1, char* filepath2){

	FILE* arch1 = fopen(filepath1, "r");
	FILE* arch2 = fopen(filepath2, "r");
	char clave1;
	char clave2;
	char linea [100];
	char cadena1 [100];
	char cadena2 [100];

	bool encontrada = FALSE;
	bool fin = FALSE;
	bool archivosAbiertos = TRUE;

	if (arch1==NULL) {
	   fprintf(stderr,"Error al abrir %s \n", filepath1);
	   archivosAbiertos= FALSE;
	}
	if (arch2==NULL) {
	   fprintf(stderr,"Error al abrir %s \n", filepath2);
	   archivosAbiertos= FALSE;
	}

	if (archivosAbiertos == TRUE){
		clave1 = fgetc(arch1);
		while (feof(arch1)==0  && (fin == FALSE) ){
			fgets(cadena1, 100, arch1);
			limpiar(cadena1);
			//Buscar clave en el segundo archivo.
			while (encontrada == FALSE && feof(arch2)==0 ){
				clave2 = fgetc(arch2);
				if(clave1==clave2){
					encontrada = TRUE;
					fgets(cadena2, 100, arch2);
					limpiar(cadena2);
				} else {
					//Saltear  linea
					fgets(linea, 100, arch2);
				}
			}
			//Mostrar cadenas unidas.
			if (encontrada == TRUE){
				printf("%c %s %s \n",clave1, cadena1, cadena2);
				encontrada = FALSE;
				clave1 = fgetc(arch1);
				rewind(arch2);
			} else {
				fin =TRUE;
			}
		}
		if (fin == TRUE) {
			fprintf(stderr,"No se encontro la clave en el segundo archivo \n");
		}
		fclose(arch1);
		fclose(arch2);
	}
}

