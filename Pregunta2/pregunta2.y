%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

void yyerror(char *s); //En caso de haber error de sintaxsis señala un error

char TREE[1000]; //definimos un arbol de tipo char para ejecutar el ast
int nNodes = 0; //los nodos determinan el arbol para trabajarlo en la funcion prtree
int x = 0; //coordenada x
int y = 0; //coordenada y

typedef struct{ //estructura para los nodos del arbol
  char nodetype;
  char x_cardinal;
  char y_cardinal;
}NODE;

void newnode(char c[]){ //se instancia un nuevo nodo
  strcat(TREE,c);
}
void checklen(){ //se chequea el tamaño del arbol
  nNodes = strlen(TREE);
}

void prtree(){ //impresion del arbol
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


//luego aparecen las reglas de produccion ocupadas en esta pregunta
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

int main(int argc, char **argv){//finalmente se define el arbol y la posicion del individuo
	yyparse();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", x, y);
	checklen();
	prtree();
}
