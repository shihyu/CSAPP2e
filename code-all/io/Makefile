CC = gcc

CSAPP_INC = ../include
CSAPP_SRC = ../src

CFLAGS = -Wall -O2 -I $(CSAPP_INC) -I .
LDLIBS = -lpthread

PROGS =	statcheck\
	openexamples\
	fdprob1\
	fdprob2\
	cpfile\
	cpstdin\
	sharing1\
	sharing2\
	sharing3\
	iofragments.o\

all: $(CSAPP_SRC)/csapp.o $(PROGS) 
$(PROGS): $(CSAPP_SRC)/csapp.o
$(CSAPP_SRC)/csapp.o: $(CSAPP_SRC)/csapp.c $(CSAPP_INC)/csapp.h

clean:
	rm -f $(PROGS) *.o *~
