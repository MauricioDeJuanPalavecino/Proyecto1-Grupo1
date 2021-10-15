Pregunta2: pregunta2.l pregunta2.y pregunta2.h
	bison -d pregunta2.y
	flex pregunta2.l lex.yy.c
	gcc -o $@ pregunta2.tab.c lex.yy.c pregunta2.c
clean:
	rm pregunta2.tab.* Pregunta2 lex.yy.c
