%{
#include <stdio.h>
#include <stdlib.h>
#include "pregunta2.h"
%}

%union {
  struct ast *a;
  char d;
}

%token 'N' 'E' 'O' 'S'
%token 'A' 'B' 'C' 'D'
%token FINLINEA

%type <a> exp

%%

input	:
	| input linea
	;
linea	: FINLINEA
	| exp linea
	;
  ;

exp:  'A' { $$ = newast('A'); }
  | 'B' { $$ = newast('B');}
  | 'C' { $$ = newast('C'); }
  | 'D' { $$ = newast('D'); }
  | 'N' { $$ = newnum('N'); }
  | 'E' { $$ = newnum('E'); }
  | 'O' { $$ = newnum('O'); }
  | 'S' { $$ = newnum('S'); }
  ;

%%
int main(){
  return yyparse();
  printf("HOLAaaa");
}
