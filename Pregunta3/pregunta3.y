%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

void yyerror(char *s);

char CURRENT_DIRECTION = '\0';

int x = 0;
int y = 0;

typedef struct{
  char nodetype;
  int steps;
}NODE;

NODE norte = { .nodetype = 'N', .steps = 0 };
NODE sur = { .nodetype = 'S', .steps = 0 };
NODE este = { .nodetype = 'E', .steps = 0 };
NODE oeste = { .nodetype = 'O', .steps = 0 };

void newdirection(char card){
  CURRENT_DIRECTION = card;
}

void walk(int steps){
    switch (CURRENT_DIRECTION){
      case 'N': //NORTE
      	printf("%d\n", norte.steps);
      	printf("%d\n", steps);
        norte.steps = norte.steps + steps;
        break;
      case 'S': //SUR
        sur.steps = sur.steps + steps;
        break;
      case 'E': //ESTE
        este.steps = este.steps + steps;
        break;
      case 'O': //OESTE
        oeste.steps = oeste.steps + steps;
        break;
      case 'A': //NORESTE
        norte.steps = norte.steps + steps;
        este.steps = este.steps + steps;
        break;
      case 'B': //SURESTE
        sur.steps = sur.steps + steps;
        este.steps = este.steps + steps;
        break;
      case 'C': //SUROESTE
        sur.steps = sur.steps + steps;
        oeste.steps = oeste.steps + steps;
        break;
      case 'D': //NOROESTE
        norte.steps = norte.steps + steps;
        oeste.steps = oeste.steps + steps;
        break;
      default:
        printf("Por favor escoja una dirección");
    }
}

void printtree(){
  printf("-nodo NORTE:\n");
  printf("	-hoja: %d\n", norte.steps);
}


int yylex();
void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}



%}

%union {
  char c;
}

%union {
  int d;
}

%token N S E O
%token A B C D
%token <d> NUMERO
%token FINLINEA

%type <a> exp

%%

input	:
	| input linea
	;
linea	: FINLINEA
	| exp linea
	;
	
exp:  	  N {y++; newdirection('N');}
	| S {y--; newdirection('S');}
	| E {x++; newdirection('E');}
	| O {x--; newdirection('O');}
	| A {y++; x++; newdirection('A');}
	| B {y--; x++; newdirection('B');}
	| C {y--; x--; newdirection('C');}
	| D {y++; x--; newdirection('D');}
	| NUMERO { printf("%d\n", NUMERO); walk( (int) NUMERO); }
	;

%%

int main(int argc, char **argv){
	yyparse();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", x, y);
	printtree();
	
}
