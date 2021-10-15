%option noyywrap nodefault yylineno
%{
#include "pregunta2.h"
#include "pregunta2.tab.h"
%}

EXP ([Ee][-+]?[0-9]+)

%%

"A" |
"B" |
"C" |
"D" | { return yytext[0]; }

"N" |
"S" |
"E" |
"O" | { return yytext[0]; }

\n { return FINLINEA; }
"//".* 
[ \t] { /* ignora espacios en blanco */ }
. { yyerror("Caracter no reconocido %c\n", *yytext); }
%%
