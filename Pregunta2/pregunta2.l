%{
#include "pregunta2.tab.h"

%}
%option noinput
%option nounput
%%

"NE" 	{return NORESTE;}
"NO" 	{return NOROESTE;}
"SE"	{return SURESTE;}
"SO"	{return SUROESTE;}
"EN" 	{return NORESTE;}
"ON" 	{return NOROESTE;}
"ES"	{return SURESTE;}
"OS"	{return SUROESTE;}
\n	{return FINLINEA;}
[ \t]   {}
.	{}



