%{
int x = 0;
int y = 0;

%}

%%

N 	 {y++;}
S	 {y--;}
E	 {x++;}
O	 {x--;}
\n	 {x=x;y=y;}
[a-zA-DF-MP-RT-Z]	 {x=x;y=y;}
[0-9]	 {x=x;y=y;}
[ ]      {x=x;y=y;}
.	  {x=x;y=y;}
%%

int main(int argc, char** argv){
	yylex();
	printf("La posición del individuo en x es: %d, la posición del individuo en y es: %d\n", x, y);
}
