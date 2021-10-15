%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

void yyerror(char *s);

char TREE[1000];
int nNodes = 0;
int x = 0;
int y = 0;

typedef struct{
  char nodetype;
  char x_cardinal;
  char y_cardinal;
}NODE;

void newnode(char c[]){
  strcat(TREE,c);
}
void checklen(){
  nNodes = strlen(TREE);
}

void prtree(){
  NODE* nodes = malloc(nNodes * sizeof *nodes);
  for (int i = 0; i<nNodes; i++){
    nodes[i].nodetype = TREE[i];
    switch (nodes[i].nodetype){
      case 'A': //NORESTE
        nodes[i].x_cardinal = 'E';
        nodes[i].y_cardinal = 'N';
        break;
      case 'B': //SURESTE
        nodes[i].x_cardinal = 'E';
        nodes[i].y_cardinal = 'S';
        break;
      case 'C': //SUROESTE
        nodes[i].x_cardinal = 'O';
        nodes[i].y_cardinal = 'S';
        break;
      case 'D': //NOROESTE
        nodes[i].x_cardinal = 'O';
        nodes[i].y_cardinal = 'N';
        break;
      default:
        nodes[i].x_cardinal = '\0';
        nodes[i].y_cardinal = '\0';
    }
  }
  for (int i = 0; i<nNodes; i++){
    if (nodes[i].x_cardinal == '\0' && nodes[i].y_cardinal == '\0'){
      printf("- hoja = %c\n\n", nodes[i].nodetype);
    }else{
      printf("- nodo = %c\n", nodes[i].nodetype);
      printf("    - hoja = %c\n", nodes[i].x_cardinal);
      printf("    - hoja = %c\n\n", nodes[i].y_cardinal);
    }

  }
}

int yylex();
void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}



%}

%union {
  struct ast *a;
  char c;
}

%token N S E O
%token A B C D
%token FINLINEA

%type <a> exp

%%

input	:
	| input linea
	;
linea	: FINLINEA
	| exp linea
	;
	
exp:  	  N {y++; newnode("N");}
	| S {y--; newnode("S");}
	| E {x++; newnode("E");}
	| O {x--; newnode("O");}
	| A {y++; x++; newnode("A");}
	| B {y--; x++; newnode("B");}
	| C {y--; x--; newnode("C");}
	| D {y++; x--; newnode("D");}
	;

%%

int main(int argc, char **argv){
	yyparse();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", x, y);
	checklen();
	prtree();
}
