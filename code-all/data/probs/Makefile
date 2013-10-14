CC = gcc
CFLAGS = -g -Wall

pprob1.tex: bh_pprob
	./bh_pprob -n 4 -r 1 > pprob1.tex

pprob1-solve.tex: bh_pprob
	./bh_pprob -s -n 4 -r 1 > pprob1-solve.tex

cvt.o: cvt.c cvt.h
	$(CC) $(CFLAGS) -c cvt.c

bh_pprob: bh_pprob.c cvt.o
	$(CC) $(CFLAGS) -o bh_pprob bh_pprob.c cvt.o

