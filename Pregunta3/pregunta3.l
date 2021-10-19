%option noyywrap
%option noinput
%option nounput
%option nodefault
%option yylineno
%{
#include "pregunta3.tab.h"
%}

%%
"N"	{ return N; }
"S"	{ return S; }
"E"	{ return E; }
"O"	{ return O; }
[-0-9]+ { yylval.d = atof(yytext); return NUMERO; }
\n { return FINLINEA; }
[ \t]   {}
.	{}
