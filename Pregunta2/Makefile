Pregunta2: pregunta2.l pregunta2.y
	bison -d pregunta2.y
	flex pregunta2.l lex.yy.c
	gcc -o $@ pregunta2.tab.c lex.yy.c
clean:
	rm pregunta2.tab.* Pregunta2 lex.yy.c
