CC = gcc
ICS = ..
CFLAGS = -Wall -O2 -m32

PROGS = hello

all: $(PROGS)

hello: hello.c
	$(CC) $(CFLAGS) -o hello hello.c
	$(CC) $(CFLAGS) -S hello.c
	objdump -d hello > hello.32d


clean:
	rm -f $(PROGS) *.o *.s *.S *~


