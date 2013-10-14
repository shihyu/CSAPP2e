CC = gcc
CSAPP_INC = ../include
CSAPP_SRC = ../src
CFLAGS = -Wall -O2 -I $(CSAPP_INC) -I . 
LDLIBS = -lpthread

PROGS = fragments.o\
	procmask1\
	procmask2\
	counterprob\
	waitprob0\
	waitprob1\
	waitprob3\
	fork1\
	fork2\
	fork3\
	forkprob1\
	forkprob2\
	forkprob3\
	forkprob4\
	forkprob5\
	forkprob6\
	forkprob7\
	forkprob8\
	setjmp\
	alarm\
	restart\
	signal1\
	signal2\
	signal3\
	signal4\
	sigint1\
	shellex\
	kill\
	psignal\
	getpid\
	fork\
	waitpid1\
	waitpid2\
	myecho\
	stack\
	sigfpe\
	sigbus\
	sigsegv\
	forkprob0\
	signalprob0\
	snooze\
	test\
	pg\
	pgchild\
	hello-asm\
	jmpbuf\
	rfork.o\
	rfork-driver

all: $(CSAPP_SRC)/csapp.o $(PROGS)

# rfork-driver doesn't use csapp.c
rfork-driver: rfork-driver.c rfork.c
	$(CC) -o rfork-driver rfork-driver.c rfork.c

# hello-asm.s is a handwritten asm program that show how to invoke syscalls
hello: hello-asm.s
	$(CC) -o hello-asm hello-asm.s

$(PROGS): $(CSAPP_SRC)/csapp.o

$(CSAPP_SRC)/csapp.o: $(CSAPP_SRC)/csapp.c $(CSAPP_INC)/csapp.h

clean:
	rm -f $(PROGS) *.o *~


