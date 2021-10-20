%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

void yyerror(char *s);

char CURRENT_DIRECTION = '\0';//se senializa la direccion como nulo al inicio para dejar establecido despues cuando llegan los parametros
//se instancian las posiciones
int x = 0;
int y = 0;


//estructura de los nodos y sus pasos
typedef struct{
  char nodetype;
  int steps;
}NODE;


//se definen los nodos para el arbol
NODE norte = { .nodetype = 'N', .steps = 0 };
NODE sur = { .nodetype = 'S', .steps = 0 };
NODE este = { .nodetype = 'E', .steps = 0 };
NODE oeste = { .nodetype = 'O', .steps = 0 };
NODE noreste = { .nodetype = 'A', .steps = 0 };
NODE sureste = { .nodetype = 'B', .steps = 0 };
NODE noroeste = { .nodetype = 'C', .steps = 0 };
NODE suroeste = { .nodetype = 'D', .steps = 0 };


//se senializa la dirección encargada
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
      case 'A': //NORESTE
        noreste.steps = noreste.steps + steps;
        break;
      case 'B': //SURESTE
        sureste.steps = sureste.steps + steps;
        break;
      case 'C': //SUROESTE
        suroeste.steps = suroeste.steps + steps;
        break;
      case 'D': //NOROESTE
        noroeste.steps = noroeste.steps + steps;
        break;
      default:
        printf("Por favor escoja una dirección");
    }
}

//se obtiene x para el resultado final
int getX(){
  return (este.steps + sureste.steps + noreste.steps) - (oeste.steps + suroeste.steps + noroeste.steps);
}
//se obtiene y para el resultado final
int getY(){
  return (norte.steps + noreste.steps + noroeste.steps) - (sur.steps + sureste.steps + suroeste.steps);
}

//se imprime el arbol dado
void printtree(){
  printf("-nodo NORTE:\n");
  printf("	-hoja: %d\n", norte.steps);
  printf("-nodo SUR:\n");
  printf("	-hoja: %d\n", sur.steps);
  printf("-nodo ESTE:\n");
  printf("	-hoja: %d\n", este.steps);
  printf("-nodo OESTE:\n");
  printf("	-hoja: %d\n", oeste.steps);
  printf("-nodo NORESTE:\n");
  printf("	-hoja: %d\n", noreste.steps);
  printf("-nodo SURESTE:\n");
  printf("	-hoja: %d\n", sureste.steps);
  printf("-nodo SUROESTE:\n");
  printf("	-hoja: %d\n", suroeste.steps);
  printf("-nodo NOROESTE:\n");
  printf("	-hoja: %d\n", noroeste.steps);
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
%token NE NO SE SO
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
	| NE { newdirection('A');}
	| SE { newdirection('B');}
	| NO { newdirection('C');}
	| SO { newdirection('D');}
	| NUMERO { walk($1); }
	;

%%

int main(int argc, char **argv){
	yyparse();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", getX(), getY());
	printtree();
	
}
