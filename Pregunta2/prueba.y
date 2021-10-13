%{
#include <stdio.h>

int yylex();
int x = 0;
int y = 0;
void yyerror(const char *s){
	fprintf(stderr, "%s\n", s);
}
%}

%token NORESTE NOROESTE SURESTE SUROESTE
%token FINLINEA

%%

input	:
	| input linea
	;

linea	: FINLINEA
	| exp FINLINEA {x=x; y=y;}
	;
exp	: NORESTE {x++;y++;}
	| SURESTE {x++;y--;}
	| NOROESTE {x--;y++;}
	| SUROESTE {x--;y--;}
	;
	
%%

int main(int argc, char **argv){
	yyparse();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", x, y);
}
