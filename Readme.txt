Reglas ocupadas en la pregunta 1:

Si apreto N, suma 1 en y
Si apreto S, resta 1 en y
Si apreto O, resta 1 en x
Si apreto E, suma 1 en x
Cualquier otro caracter es tomado como default y no sucede nada

---------------------------------------

Reglas ocupadas en la pregunta 2:

Si apreto N, suma 1 en y
Si apreto S, resta 1 en y
Si apreto O, resta 1 en x
Si apreto E, suma 1 en x
Si apreto A, suma 1 en x y en y haciendo referencia a noreste
Si apreto B, suma 1 en x y resta 1 en y haciendo referencia a sureste
Si apreto C, resta 1 en x y resta 1 en y haciendo referencia a suroeste
Si apreto D, resta 1 en x y suma 1 en y haciendo referencia a noroeste
Cualquier otro caracter es tomado como default y no sucede nada

----------------------------------------

Reglas ocupadas en la pregunta 3

Si apreto N, la dirección quedara en el Norte para sumar cuadradas recorridas en y
Si apreto S, la dirección quedara en el Sur para restar cuadradas recorridas en y
Si apreto E, la dirección quedara en el Este para sumar cuadradas recorridas en x
Si apreto O, la dirección quedara en el Oeste para restar cuadradas recorridas en x
Cualquier otro caracter es tomado como default y no sucede nada
----------------------------------------

Reglas ocupadas en la pregunta 4

Si apreto N, la dirección quedara en el Norte para sumar cuadradas recorridas en y
Si apreto S, la dirección quedara en el Sur para restar cuadradas recorridas en y
Si apreto E, la dirección quedara en el Este para sumar cuadradas recorridas en x
Si apreto O, la dirección quedara en el Oeste para restar cuadradas recorridas en x
Si apreto NO ó ON, la dirección quedara en el Noroeste para hacer operaciones en x y en y
Si apreto SE ó ES, la dirección quedara en el Sureste para hacer operaciones en x y en y
Si apreto NE ó EN, la dirección quedara en el Noreste para hacer operaciones en x y en y
Si apreto SO ó OS, la dirección quedara en el Suroeste para hacer operaciones en x y en y
Cualquier otro caracter es tomado como default y no sucede nada
----------------------------------------

Instrucciones de compilado pregunta 1
Para compilar la pregunta 1 hay que poner lo siguiente por consola:

cd Pregunta1
make
./pregunta1

Si necesita limpiar los archivos compilados utilice:
make clean

A continuación el programa comenzará y puede poner los caracteres puestos en "Reglas ocupadas en la pregunta 1"

Para finalizar aprete las teclas control+d y aparecerá la dirección en la cual quedo despues de las reglas ocupadas  

----------------------------------------

Instrucciones de compilado pregunta 2
Para compilar la pregunta 2 hay que poner lo siguiente por consola:
cd Pregunta2
make
./Pregunta2

Si necesita limpiar los archivos compilados utilice:
make clean

A continuación el programa comenzará y puede poner los caracteres puestos en "Reglas ocupadas en la pregunta 2"

Para finalizar aprete las teclas control+d y aparecerá la dirección en la cual quedo despues de las reglas ocupadas  

también aparecerá el arbol AST creado desde la compilación
----------------------------------------

Instrucciones de compilado pregunta 3
Para compilar la pregunta 3 hay que poner lo siguiente por consola:

cd Pregunta3
make
./Pregunta3

Si necesita limpiar los archivos compilados utilice:
make clean

A continuación el programa comenzará y puede poner los caracteres puestos en "Reglas ocupadas en la pregunta 3"

Para finalizar aprete las teclas control+d y aparecerá la dirección en la cual quedo despues de las reglas ocupadas  

también aparecerá el arbol AST creado desde la compilación
----------------------------------------

Instrucciones de compilado pregunta 4
Para compilar la pregunta 3 hay que poner lo siguiente por consola:

cd Pregunta4
make
./Pregunta4

Si necesita limpiar los archivos compilados utilice:
make clean

A continuación el programa comenzará y puede poner los caracteres puestos en "Reglas ocupadas en la pregunta 4"

Para finalizar aprete las teclas control+d y aparecerá la dirección en la cual quedo despues de las reglas ocupadas  

también aparecerá el arbol AST creado desde la compilación
----------------------------------------

Entrada y salida de ejemplo pregunta 1

Un ejemplo de esto sería:

Entrada:
NSOEN
Salida:
La posición del individuo en x es: 0, la posición del individuo en y es: 1
----------------------------------------

Entrada y salida de ejemplo pregunta 2

Entrada:
ABAB

Salida:

La posición del individuo en x es: 4, la posición del individuo en y es: 0
- nodo = A
    - hoja = E
    - hoja = N

- nodo = B
    - hoja = E
    - hoja = S

- nodo = A
    - hoja = E
    - hoja = N

- nodo = B
    - hoja = E
    - hoja = S

----------------------------------------

Entrada y salida de ejemplo pregunta 3
Entrada:
N
3
3
Salida:
La posición del individuo en x es: 0, la posición del individuo en y es: 6
-nodo NORTE:
	-hoja: 6
-nodo SUR:
	-hoja: 0
-nodo ESTE:
	-hoja: 0
-nodo OESTE:
	-hoja: 0


----------------------------------------
Entrada y salida de ejemplo pregunta 4

Entrada:
NE
2
2
NO
3
4
Salida:
La posición del individuo en x es: -3, la posición del individuo en y es: -3
-nodo NORTE:
	-hoja: 0
-nodo SUR:
	-hoja: 0
-nodo ESTE:
	-hoja: 0
-nodo OESTE:
	-hoja: 0
-nodo NORESTE:
	-hoja: 4
-nodo SURESTE:
	-hoja: 0
-nodo SUROESTE:
	-hoja: 7
-nodo NOROESTE:
	-hoja: 0


