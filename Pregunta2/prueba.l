%{
#include "prueba.tab.h"

%}

%%

"NE" 	{return NORESTE;}
"NO" 	{return NOROESTE;}
"SE"	{return SURESTE;}
"SO"	{return SUROESTE;}
\n	{return FINLINEA;}
[ \t]   {}
.	{}



