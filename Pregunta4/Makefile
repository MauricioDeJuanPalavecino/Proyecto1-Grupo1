Pregunta4: pregunta4.l pregunta4.y
	bison -d pregunta4.y
	flex pregunta4.l lex.yy.c
	gcc -o $@ pregunta4.tab.c lex.yy.c
clean:
	rm pregunta4.tab.* Pregunta4 lex.yy.c
