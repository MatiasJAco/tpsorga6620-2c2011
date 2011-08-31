#include <stdio.h>
#include <getopt.h>

typedef enum {TRUE, FALSE} bool;

//Headers.
void print_help(void);

int main(int argc, char **argv)
{
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
