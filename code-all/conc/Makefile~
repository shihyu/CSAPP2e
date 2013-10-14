CC = gcc

CSAPP_INC = ../../include
CSAPP_SRC = ../src

CFLAGS = -O1 -Wall -I $(CSAPP_INC) -I .
LDLIBS = -lpthread -lm

COUNTERARGS = -O1 -Wall -I $(CSAPP_INC)

# NOTE: we expect sharing.c to generate warnings
PROGS =	hello\
	badcnt\
	goodcnt\
	echoclient\
	echoserveri\
	echoservers\
	echoserverp\
	echoservert\
	echoservert_cnt\
	echoservert_pre\
	ctime_ts\
	race\
	norace\
	sharing\
	rand\
	rand_r\
	threadunsafe\
	hellobug\
	tfgets-main.o\
	select\
	psum\
	vsum\
	rw0.o\
	rw1.o\
	rw2.o\
	rw3.o\

all: $(CSAPP_SRC)/csapp.o $(PROGS)
$(PROGS): $(CSAPP_SRC)/csapp.o 
$(CSAPP_SRC)/csapp.o: $(CSAPP_SRC)/csapp.c $(CSAPP_INC)/csapp.h

# The two programs that we use to illustrate synchronization
goodcnt: goodcnt.c 
	$(CC) $(COUNTERARGS) -o goodcnt goodcnt.c $(CSAPP_SRC)/csapp.o -lpthread
	$(CC) $(COUNTERARGS) -S goodcnt.c

badcnt: badcnt.c
	$(CC) $(COUNTERARGS) -o badcnt badcnt.c $(CSAPP_SRC)/csapp.o -lpthread
	$(CC) $(COUNTERARGS) -S badcnt.c

# Programs that need more than one .o file
echoserveri: echoserveri.o echo.o
echoserverp: echoserverp.o echo.o
echoservert: echoservert.o echo.o
echoservert_cnt: echoservert_cnt.o echo_cnt.o
echoservert_pre: echoservert_pre.o echo_cnt.o sbuf.o
echoservers: echoservers.o echo.o
select: select.o echo.o

clean:
	rm -f $(PROGS) *.o *~
