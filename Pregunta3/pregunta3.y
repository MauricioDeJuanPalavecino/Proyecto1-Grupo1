%{
#include <stdio.h>

int yylex();
int x = 0;
int y = 0;
void yyerror(const char *s){
	fprintf(stderr, "%s\n", s);
}
%}

%token NORTE ESTE SUR OESTE CHARNOVALIDO
%token FINLINEA
%token NUMERO
%%

input	:
	| input linea
	;

linea	: FINLINEA
	| exp linea 
	| CHARNOVALIDO linea
	| NUMERO linea 
	;

exp:  	  NORTE n1 {x= x+ $1;}
	| SUR NUMERO {x= x - $2;}
	| OESTE NUMERO {y = y - $2;}
	| ESTE NUMERO {y = y + $2;}
	;
n1	: NUMERO {x= x+ $1;}
	| CHARNOVALIDO n1
	| NUMERO n1 {x= x+ $2;}
	;
	
%%

int main(int argc, char **argv){
	yyparse();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", x, y);
}
