%option noyywrap
%option noinput
%option nounput
%{
#include "pregunta2.tab.h"
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
