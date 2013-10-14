CC=/usr/local/cs/bin/gcc
CFLAGS=-O1 -Wall

.SUFFIXES:
.SUFFIXES:.c .32s .64s

.c.32s:
	$(CC) $(CFLAGS) -m32 -S $*.c -o $*.32s

.c.64s:
	$(CC) $(CFLAGS) -m64 -S $*.c -o $*.64s

