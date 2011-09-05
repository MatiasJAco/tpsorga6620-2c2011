#include "stdio.h"
#include "getopt.h"
#include "string.h"
#include "ctype.h"

typedef enum {TRUE, FALSE} bool;

//Headers.
void print_help(void);
void funcionJoin(char* filepath1, char* filepath2, bool i);
void limpiar (char *cadena);
bool comparaClaves(char* c1, char* c2, bool i);

int main(int argc, char **argv) {
	int i = 0;
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
	bool ignore = FALSE;
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
		ignore = TRUE;
		i = 1;
	}
	char* filepath1;
	char* filepath2;
	char filepathConsole [100];
	int primerPath = i + 1;
	int segundoPath = i + 2;
	if (argc > primerPath){
		filepath1=argv[primerPath];
		if(argc > segundoPath){
			filepath2 = argv[segundoPath];
		} else{
			fgets(filepathConsole, 100, stdin);
			limpiar(filepathConsole);
			filepath2=&filepathConsole[0];
		}
		funcionJoin(filepath1, filepath2, ignore);
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

bool buscarRepetida(char* clave, FILE* archivo, bool ignore){
	bool result = FALSE;
	char cadenaLeida [100];
	char claveLeida [20];
	char* cpToken;
	int encontrados = 0;
	fgets(cadenaLeida, 100, archivo);
	while((encontrados < 2)&&(feof(archivo)==0)) {
		 cpToken = strtok (cadenaLeida, " ");
		 strcpy (claveLeida, cpToken);
		 if(comparaClaves(claveLeida,clave, ignore) == TRUE){
		 				encontrados++;
		 }
		 fgets(cadenaLeida, 100, archivo);
	 }
	if (encontrados > 1)
		result = TRUE;
	return result;
}
void funcionJoin(char* filepath1, char* filepath2, bool ignore){

	FILE* arch1 = fopen(filepath1, "r");
	FILE* arch2 = fopen(filepath2, "r");
	FILE* arch2Recorrido = fopen(filepath2, "r");
	char clave1 [20];
	char clave2[20];
	char claveComp[20];
//	char linea [100];
	char cadena1 [100];
	char cadena2 [100];
	char cadenaLeida1 [100];
	char cadenaLeida2 [100];
	char cadenaLeida2Rep [100];
	bool encontrada = FALSE;
	bool repetida = FALSE;
	bool fin = FALSE;
	bool archivosAbiertos = TRUE;
	bool desordenado = FALSE;

	if (arch1==NULL) {
	   fprintf(stderr,"Error al abrir %s \n", filepath1);
	   archivosAbiertos= FALSE;
	}
	if (arch2==NULL) {
	   fprintf(stderr,"Error al abrir %s \n", filepath2);
	   archivosAbiertos= FALSE;
	}
	char* cpToken;
	if (archivosAbiertos == TRUE){
		fgets(cadenaLeida1, 100, arch1);
		cpToken = strtok (cadenaLeida1, " ");
		strcpy (clave1, cpToken);
		while (feof(arch1)==0  && (fin == FALSE) ){
			cpToken = strtok (NULL, "\0");
			strcpy (cadena1, cpToken);
			limpiar(cadena1);
			//Buscar clave en el segundo archivo.
			fgets(cadenaLeida2, 100, arch2);
//			fgets(cadenaLeida2Rep, 100, arch2Recorrido);
//			while ((encontrada == FALSE) && (feof(arch2)==0)){
				cpToken = strtok (cadenaLeida2, " ");
				strcpy (claveComp, cpToken);
				if((comparaClaves(clave1,claveComp, ignore) == TRUE)){
					encontrada = TRUE;
					strcpy (clave2, cpToken);
					cpToken = strtok (NULL, "\0");
					strcpy (cadena2, cpToken);
					limpiar(cadena2);
					if (encontrada == TRUE)
						repetida = buscarRepetida(claveComp, arch2Recorrido, ignore);
				} else {
					desordenado = TRUE;

				}
//				fgets(cadenaLeida2, 100, arch2);
//				fgets(cadenaLeida2Rep, 100, arch2Recorrido);
//			}
			//Mostrar cadenas unidas.
			if (encontrada == TRUE && repetida ==FALSE){
				printf("%s %s %s \n",clave1, cadena1, cadena2);
				encontrada = FALSE;
				fgets(cadenaLeida1, 100, arch1);
				cpToken = strtok (cadenaLeida1, " ");
				strcpy (clave1, cpToken);
//				rewind(arch2);
				rewind(arch2Recorrido);
			} else {
				fin =TRUE;
			}
		}
		if (fin == TRUE) {
			if (repetida == TRUE)
				fprintf(stderr,"Clave repetida en el archivo2. \n");
			else
				if (desordenado == TRUE)
					fprintf(stderr,"El archivo 2 está desordenado. \n");
				else
					fprintf(stderr,"No se encontro la clave en el segundo archivo \n");
		}
		fclose(arch1);
		fclose(arch2);
		fclose(arch2Recorrido);
	}
}

bool comparaClaves(char* c1, char* c2, bool i){
	bool result = FALSE;
	if(strcmp(c1,c2) == 0)
		result = TRUE;
	if(i == TRUE){
		if(strcasecmp(c1,c2) == 0)
				result = TRUE;
	}
	return result;


}
