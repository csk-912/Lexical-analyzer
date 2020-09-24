a.out : lex.yy.c ass_3_18CS30013.c header.h
	cc ass_3_18CS30013.c lex.yy.c -ll
lex.yy.c : header.h  ass3_18CS30013.l
	lex ass3_18CS30013.l
clean : 
	rm a.out lex.yy.c
