CC = gcc
CFLAGS = -O3 -Wall -m32

all: mm bmm

mm: mm.c clock.c fcycmm.c mm.h
	$(CC) $(CFLAGS) -o mm mm.c clock.c fcycmm.c

bmm: bmm.c clock.c fcycbmm.c mm.h
	$(CC) $(CFLAGS) -o bmm bmm.c clock.c fcycbmm.c

clean:
	rm -f *.o mm bmm *~


