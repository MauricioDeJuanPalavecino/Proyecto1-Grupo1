Pregunta3: pregunta3.l pregunta3.y
	bison -d pregunta3.y
	flex pregunta3.l lex.yy.c
	gcc -o $@ pregunta3.tab.c lex.yy.c
clean:
	rm pregunta3.tab.* Pregunta3 lex.yy.c
