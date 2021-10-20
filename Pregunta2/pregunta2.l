%option noyywrap
%option noinput
%option nounput
%{
#include "pregunta2.tab.h" // se incluye pregunta2.tab.h para la compilacion de bison
//el resto de reglas ocupadas funcionan para hacer la compilacion de los calculos:
%}
%%
"N"	{ return N; }
"S"	{ return S; }
"E"	{ return E; }
"O"	{ return O; }
"A"	{ return A; }
"B"	{ return B; }
"C"	{ return C; }
"D"	{ return D; }
\n { return FINLINEA; }
[ \t]   {}
.	{}
