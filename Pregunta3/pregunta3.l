%{
#include "pregunta3.tab.h"
int yylval;
%}
%option noinput
%option nounput
%%

N	{return NORTE;}
S	{return SUR;}
O	{return OESTE;}
E	{return ESTE;}
[-0-9]+ {yylval = atoi(yytext); return NUMERO;}
\n	{return FINLINEA;}
[ \t]   {}
.	{}


