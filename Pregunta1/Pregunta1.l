%{

//Declaracion de variables X,Y en sus coordenadas 0,0
int x = 0;
int y = 0;
//Declaracion de reglas de gramática libre de contexto
%}

%%
N 	 {y++;}/*Si es Norte la entrada suma 1 en y  */
S	 {y--;} /*Si es Sur la entrada resta 1 en y  */
E	 {x++;} /*Si es Este la entrada suma 1 en x  */
O	 {x--;} /*Si es Oeste la entrada resta 1 en x  */
\n	 {x=x;y=y;} /*Resto de situaciones x=x, y=y  */
[a-zA-DF-MP-RT-Z]	 {x=x;y=y;}
[0-9]	 {x=x;y=y;}
[ ]      {x=x;y=y;}
.	  {x=x;y=y;}
%%

int main(int argc, char** argv){
	yylex(); //lectura de analizador lexico para realizar la compilacion en flex
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", x, y);
}
