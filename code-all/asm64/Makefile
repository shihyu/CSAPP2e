CC=gcc
CPP=cpp
ICS2 = ..
CFLAGS=-O2 -Wall -std=c99
CSAPP2DIR = ..
CINC = -I$(CSAPP2DIR)/include
CSAPPLIB32 = $(CSAPP2DIR)/lib/libcsapp32.a
CSAPPLIB64 = $(CSAPP2DIR)/lib/libcsapp64.a

F32 =-m32
F64 =-m64

.SUFFIXES: .c .s .32s .64s .32o .64o .32d .64d
.c.32s:
	$(CC) $(CFLAGS) $(CINC) -S $(F32) $*.c -o $*.32s

.c.64s:
	$(CC) $(CFLAGS) $(CINC) -S $(F64) $*.c -o $*.64s

.c.32o:
	$(CC) $(CFLAGS) $(CINC) -c $(F32) $*.c -o $*.32o

.c.64o:
	$(CC) $(CFLAGS) $(CINC) -c $(F64) $*.c -o $*.64o

.c.32d:
	$(CC) $(CFLAGS) $(CINC) $(F32) $*.c -o $*
	objdump -d $* > $*.32d
	rm -f $*

.c.64d:
	$(CC) $(CFLAGS) $(CINC) $(F64) $*.c -o $*
	objdump -d $* > $*.64d
	rm -f $*

PROGS = incr.32s incr.64s incr.64d\
	convert.64s\
	cond.64s\
	proc.64s\
	loop.64s\
	floatfunct.64s\
	floatcvt.64s\
	floatconst.64s\
	probs.64s\


all: $(PROGS)

incr32: incr.c $(CSAPPLIB32)
	$(CC) $(CFLAGS) $(CINC) incr.c $(CSAPPLIB32) $(F32) -DTIME -o incr32

incr64: incr.c $(CSAPPLIB64)
	$(CC) $(CFLAGS) $(CINC) incr.c $(CSAPPLIB64) $(F64) -DTIME -o incr64

max64: max.c
	$(CC) $(CFLAGS) $(CINC) max.c $(CSAPPLIB64) $(F64) -o max64

max32: max.c
	$(CC) $(CFLAGS) $(CINC) max.c $(CSAPPLIB32) $(F32) -o max32

range: range.c
	$(CC) $(CFLAGS) $(CINC) range.c  -o range

clean:
	rm -f *~ *.o *.exe incr32 incr64 *.32s *.64s


