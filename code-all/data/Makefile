CC = gcc
CFLAGS = -Wall -I . -O2 -fno-inline
FLAG32 = -m32
FLAGC89 = -std=c89 -DLANG=C89
FLAGC99 = -std=c99 -DLANG=C99
FLAG64= -m64

## On Cygwin
#FLAG64 =
# EXE=.exe
## On Linux
EXE=

PROGS = show-bytes\
	eg-dis eg-dis2.da\
	logic \
	bisbic \
	sum\
	extend\
	bad-sum\
	vulnerabilities.o \
	inplace-swap.o\
	casting.o\
	uhp-ans.o\
	rbyte-ans.o\
	rshift-templates.o\
	puzzle.o\
	floatge-template.o\
	wordsize\
	printf\
	fcomp-O.out\
	fcomp-g.out\
	fcomp-mem.out\
	fcomp-ld\
	sizes\
	uaddcheck tmultcheck\
	divconst \
	strlonger\
	eg-u2t-out.txt 	eg-t2u-out.txt

all: $(PROGS)

eg-dis: eg-dis.c
	$(CC) $(CFLAGS) $(FLAG32) eg-dis.c -o eg-dis
	objdump -d eg-dis > eg-dis.d
	cp -p eg-dis.d eg-dis2.d

eg-dis2.da: eg-dis.da dis-solve.pl
	./dis-solve.pl < eg-dis.da > eg-dis2.da

eg-u2t-out.txt: casting
	./casting > eg-u2t-out.txt

eg-t2u-out.txt: casting
	./casting 1 > eg-t2u-out.txt

uaddcheck$(EXE): uaddcheck.c
	$(CC) $(CFLAGS) -o uaddcheck$(EXE) uaddcheck.c

taddcheck$(EXE): taddcheck.c
	$(CC) $(CFLAGS) -o taddcheck$(EXE) taddcheck.c

divconst$(EXE): divconst.c
	$(CC) $(CFLAGS) -o divconst$(EXE) divconst.c


strlonger$(EXE): strlonger.c
	$(CC) $(CFLAGS) -o strlonger$(EXE) strlonger.c

constants-eg$(EXE): constants-eg.c
	$(CC) $(CFLAGS) $(FLAG32) $(FLAGC99) constants-eg.c -o constants-eg$(EXE)

fcomp-O$(EXE): fcomp.c
	$(CC) $(CFLAGS) $(FLAG32) -O2 fcomp.c -o fcomp-O$(EXE)
	$(CC) $(CFLAGS) $(FLAG32) -O2 fcomp.c -S -o fcomp-O.s

fcomp-g$(EXE): fcomp.c
	$(CC) $(CFLAGS) $(FLAG32) -g fcomp.c -o fcomp-g$(EXE)
	$(CC) $(CFLAGS) $(FLAG32) -g fcomp.c -S -o fcomp-g.s

fcomp-mem$(EXE): fcomp.c
	$(CC) $(CFLAGS) $(FLAG32) -O2 -ffloat-store fcomp.c -o fcomp-mem$(EXE)
	$(CC) $(CFLAGS) $(FLAG32) -O2 -ffloat-store fcomp.c -S -o fcomp-mem.s

fcomp-O.out: fcomp-O$(EXE)
	./fcomp-O$(EXE) | grep "test1" > fcomp-O.out

fcomp-g.out: fcomp-g$(EXE)
	./fcomp-g$(EXE) | grep "test1" > fcomp-g.out

fcomp-mem.out: fcomp-mem$(EXE)
	./fcomp-mem$(EXE) | grep "test1" > fcomp-mem.out




clean:
	rm -f *~ *.out *.exe fcomp-O fcomp-g fcomp-mem

# Don't use this stuff
constants.out: constants.gcc.32 constants.c89.32 constants.c99.32 \
		 constants.gcc.64 constants.c89.64 constants.c99.64
	./constants.c89.32 -t -h > constants.out
	./constants.c99.32 -t    >> constants.out
	./constants.gcc.32 -t    >> constants.out
	./constants.c89.64 -t    >> constants.out
	./constants.c99.64 -t    >> constants.out
	./constants.gcc.64 -t    >> constants.out

constants.gcc.32: constants.c
	$(CC) $(CFLAGS) $(FLAG32) constants.c -o constants.gcc.32
	./constants.gcc.32

constants.c89.32: constants.c
	$(CC) $(CFLAGS) $(FLAG32) $(FLAGC89) constants.c -o constants.c89.32
	./constants.c89.32

constants.c99.32: constants.c
	$(CC) $(CFLAGS) $(FLAG32) $(FLAGC99) constants.c -o constants.c99.32
	./constants.c99.32

constants.gcc.64: constants.c
	$(CC) $(CFLAGS) $(FLAG64) constants.c -o constants.gcc.64
	./constants.gcc.64

constants.c89.64: constants.c
	$(CC) $(CFLAGS) $(FLAG64) $(FLAGC89) constants.c -o constants.c89.64
	./constants.c89.64

constants.c99.64: constants.c
	$(CC) $(CFLAGS) $(FLAG64) $(FLAGC99) constants.c -o constants.c99.64
	./constants.c99.64

tmin.32: tmin.c
	$(CC) $(CFLAGS) $(FLAG32) tmin.c -o tmin.32

tmin.64: tmin.c
	$(CC) $(CFLAGS) $(FLAG64) tmin.c -o tmin.64


