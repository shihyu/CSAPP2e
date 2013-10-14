CC = gcc
CFLAGS = -Wall -O2

PROGS = p\
	p2\
	p3\
	dll\
	static.o\
	elfstructs.o\
	relo2prob.o\
	relo3prob.o\
	foobar3\
	foobar4\
	foobar5\
	foobar6\
	foobar1\
	foobar2\
	linkerror\

all: $(PROGS)

p: main.o swap.o
	$(CC) $(CFLAGS) -o p main.o swap.o
	objdump -dx main.o           > main-relo.d
	objdump -dx -j .data main.o  > maindata-relo.d
	readelf -s main.o	     > mainsym.d	
	objdump -dx swap.o           > swap-relo.d
	objdump -dx -j .data swap.o  > swapdata-relo.d
	readelf -s swap.o	     > swapsym.d
	objdump -dx p                > p-exe.d
	objdump -dx -j .data p       > pdata-exe.d

p2: main2.o addvec.o multvec.o
	$(CC) $(CFLAGS) -c main2.c addvec.c multvec.c
	ar rcs libvector.a addvec.o multvec.o
	$(CC) $(CFLAGS) -o p2 main2.o addvec.o multvec.o

p3: main.o swap2.o
	$(CC) $(CFLAGS) -o p3 main.o swap2.o

dll: dll.c addvec.c multvec.c
	$(CC) -O2 -shared -fPIC -Wall -o libvector.so addvec.c multvec.c
	$(CC) $(CFLAGS) -o dll dll.c -ldl

relo2prob.o: relo2prob.c
	$(CC) $(CFLAGS) -c relo2prob.c
	objdump -d relo2prob.o           > relo2prob-relo.d
	objdump -d -j .data relo2prob.o  > relo2probdata-relo.d

relo3prob.o: relo3prob.c
	$(CC) $(CFLAGS) -c relo3prob.c
	objdump -d relo3prob.o            > relo3prob-relo.d
	objdump -s -j .rodata relo3prob.o > relo3probdata-relo.d

foobar3: foo3.c bar3.c
	$(CC) $(CFLAGS) -o foobar3 foo3.c bar3.c

foobar4: foo4.c bar4.c
	$(CC) $(CFLAGS) -o foobar4 foo4.c bar4.c

foobar5: foo5.c bar5.c
	$(CC) $(CFLAGS) -o foobar5 foo5.c bar5.c

# This one is supposed to generate a compiler warning
foobar6: foo6.c bar6.c
	$(CC) $(CFLAGS) -o foobar6 foo6.c bar6.c


######################################### 
# These are supposed to fail at link time
######################################### 
linkerror: linkerror.c
	-$(CC) $(CFLAGS) -o linkerror linkerror.c

foobar1: foo1.c bar1.c
	-$(CC) $(CFLAGS) -o foobar1 foo1.c bar1.c

foobar2: foo2.c bar2.c
	-$(CC) $(CFLAGS) -o foobar2 foo2.c bar2.c


clean:
	rm -f $(PROGS) *.o *~


