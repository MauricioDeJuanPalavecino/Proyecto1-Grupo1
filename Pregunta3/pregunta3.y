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
      default:
        printf("Por favor escoja una dirección");
    }
}

int getX(){
  return este.steps - oeste.steps;
}
int getY(){
  return norte.steps - sur.steps;
}

void printtree(){
  printf("-nodo NORTE:\n");
  printf("	-hoja: %d\n", norte.steps);
  printf("-nodo SUR:\n");
  printf("	-hoja: %d\n", sur.steps);
  printf("-nodo ESTE:\n");
  printf("	-hoja: %d\n", este.steps);
  printf("-nodo OESTE:\n");
  printf("	-hoja: %d\n", oeste.steps);
}


int yylex();
void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}



%}

%union {
  struct ast *a;
  double d;
}

%token N S E O
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
	
exp:  	  N { newdirection('N');}
	| S { newdirection('S');}
	| E { newdirection('E');}
	| O { newdirection('O');}
	| NUMERO { walk($1); }
	;

%%

int main(int argc, char **argv){
	yyparse();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", getX(), getY());
	printtree();
	
}
