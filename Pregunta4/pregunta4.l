%option noyywrap
%option noinput
%option nounput
%option nodefault
%option yylineno
%{
#include "pregunta4.tab.h"
%}

%%
"N"	{ return N; }
"S"	{ return S; }
"E"	{ return E; }
"O"	{ return O; }
"NO" |
"ON"	{ return NO; }
"NE" |
"EN"	{ return NE; }
"SO" |
"OS"	{ return SO; }
"SE" |
"ES"	{ return SE; }
[-0-9]+ { yylval.d = atof(yytext); return NUMERO; }
\n { return FINLINEA; }
[ \t]   {}
.	{}
