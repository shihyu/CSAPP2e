CC = gcc
CFLAGS = -O2 -Wall

all: mm bmm

mm: mm.c clock.c fcycmm.c
	$(CC) $(CFLAGS) -o mm mm.c clock.c fcycmm.c

bmm: bmm.c clock.c fcycbmm.c
	$(CC) $(CFLAGS) -o bmm bmm.c clock.c fcycbmm.c

clean:
	rm -f *.o mm bmm *~


