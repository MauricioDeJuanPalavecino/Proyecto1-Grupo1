%{
#include <stdio.h>

int yylex();
int x = 0;
int y = 0;
bool waiting = false;
void yyerror(const char *s){
	fprintf(stderr, "%s\n", s);
}
%}

%token NORTE ESTE SUR OESTE 
%token FINLINEA
%token NUMERO
%%

input	:
	| input linea
	;

linea	: FINLINEA
	| exp linea
	| NUMERO linea
	;

exp:  	  NORTE NUMERO {x=x+$2;}
	| SUR NUMERO {x= x - $2;}
	| OESTE NUMERO {y = y - $2;}
	| ESTE NUMERO {y = y + $2;}
	;

%%

int main(int argc, char **argv){
	yyparse();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", x, y);
}



