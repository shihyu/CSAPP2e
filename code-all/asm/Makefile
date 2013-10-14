CC42 = /usr/bin/gcc-4.2
CC = gcc
CFLAGS= -O1 -Wall 
OPTCFLAGS = -O3 -Wall


CSAPP2DIR=..
CINC = -I$(CSAPP2DIR)/include
CSAPPLIB32 = $(CSAPP2DIR)/lib/libcsapp32.a
CSAPPLIB64 = $(CSAPP2DIR)/lib/libcsapp64.a

#IDENTIFY = ../../bin/identify.pl
#MACHINE = `$(IDENTIFY)`

EXTRACT = ./exbytes.pl

F32 =-m32
F32c = -m32 -march=i686 -msse2 -mfpmath=sse
F64 =-m64
FNOSSP = -fno-stack-protector

.SUFFIXES: .c .32s .64s .32o .64o .32d .64d 


.c.32o:
	$(CC) $(CFLAGS) $(CINC) -S $(F32) $*.c -o $*.$(MACHINE)32s
	$(CC) $(CFLAGS) $(CINC) -c $(F32) $*.c -o $*.32o

.c.64o:
	$(CC) $(CFLAGS) $(CINC) -S $(F64) $*.c -o $*.$(MACHINE)64s
	$(CC) $(CFLAGS) $(CINC) -c $(F64) $*.c -o $*.64o

.c.32d:
	$(CC) $(CFLAGS) $(CINC) $(F32) $*.c -o $*
	objdump -d $* > $*.32d
	objdump -d $* > $*.$(MACHINE)32d
	rm -f $*

.c.64d:
	$(CC) $(CFLAGS) $(CINC) $(F64) $*.c -o $*
	objdump -d $* > $*.64d
	objdump -d $* > $*.$(MACHINE)64d
	rm -f $*

all: prog32 prog64

# Execute on base machine
prog64:	\
	convert.64o\
	fact.64o\
	floatconst.64o\
	floatcvt.64o\
	floatcvt-4.2.32s\
	floatcvt-4.2.64s\
	floatfunct-4.2.64s\
	fp-funs-4.2.64s\
	fun64.64o\
	incr.64o incr.64d\
	instr-egs.64d\
	loop.64o\
	probs.64o\
	proc.64o\
	scheck.64\
	stabilize.64\
	ulmult-full32\
	ulmult-full64\
	parity32\
	parity64\


# Execute on base machine
prog32: abs.32o\
	abs-cmov.32o\
	add-suffixes.32d\
	align.32o\
	arith.32o\
	args.32o\
	ez-arith-prob.32o\
	array.32o\
	branch.32o\
	branch-exe.32d\
	calleesave.32o\
	cc.32o\
	charbuf.32o\
	charbuf-unsafe.32o\
	code.32o\
	compiler-eg.32o\
	cond-cmov.32o\
	continue-eg.32o\
	ctest.32o\
	decimal5.32o\
	decode1-ans.32o\
	dw.32o\
	exchange.32o\
	fact.32o\
	fib.32o\
	fixarray.32o\
	fp.32o\
	fpfunct2-ans.32o\
	fragments.32o\
	fragments.32d\
	frame.32o\
	fun.32o\
	if.32o\
	if2-cmov.32o\
	incr.32o\
	instr-egs.32d\
	loop.32o \
	muldiv.32o\
	multi.32o\
	nodestruct.32o\
	nodeunion.32o\
	nodeuniontag.32o\
	okmul-asm-proto.32o\
	okmul32\
	okmul64\
	pointer.32o\
	pointer-exe.32d\
	code-exe.32d\
	rect.32o\
	registers.32o\
	shift.32o\
	simple-if.32o\
	simple.32o\
	simple-intel.32o\
	struct2.32o\
	structure.32o\
	suffixes.32d\
	swapadd.32o\
	switchprob2.32o\
	switch.32o\
	union.32o\
	union3.32o\
	while.32o\
	bufovf-exe.32d\
	bufovf-safe-exe.32d\
	scheck.32\
	stabilize.32\
	list.32s list-O3.32s\
	optfuns.32s optfuns-O3.32s\
	sibling.32s \
	treesum.32o \
#	fplessequal-ans.32o\

# execute this on cobia
loops: \
	loop-34.32o \
	loop-40.32o 


pointer-exe.32d: pointer.c
	$(CC) $(CFLAGS) $(F32) pointer.c -o pointer
	./pointer > pointer.$(MACHINE)32s
	objdump -d pointer > pointer-exe.32d
	objdump -d pointer > pointer-exe.$(MACHINE)32d

code-exe.32d: code.c main.c code.gdb
	$(CC) $(CFLAGS) $(F32) -S code.c -o code.$(MACHINE)32s
	$(CC) $(CFLAGS) $(F32) -c code.c -o code.32o
	$(CC) $(CFLAGS) $(F32) -o prog code.c main.c
	objdump -d code.32o > code-rel.32d
	objdump -d code.32o > code-rel.$(MACHINE)32d
	objdump -d prog > code-exe.32d
	objdump -d prog > code-exe.$(MACHINE)32d
	gdb prog -x code.gdb > code-gdb.out
	$(EXTRACT) -f sum < code-rel.32d > sum-rel.txt

branch-exe.32d: branch.c
	$(CC) $(CFLAGS) $(F32) -S branch.c -o branch.$(MACHINE)32s
	$(CC) $(CFLAGS) $(F32) -c branch.c -o branch.32o
	$(CC) $(CFLAGS) $(F32) -o branch branch.c
	objdump -d branch.32o > branch-rel.32d
	objdump -d branch.32o > branch-rel.$(MACHINE)32d
	objdump -d branch > branch-exe.32d
	objdump -d branch > branch-exe.$(MACHINE)32d

bufovf-exe.32d: bufovf.c
	$(CC) $(CFLAGS) $(F32) $(FNOSSP) bufovf.c -o bufovf
	objdump -d bufovf > bufovf-exe.32d
	objdump -d bufovf > bufovf-exe.$(MACHINE)32d

bufovf-safe-exe.32d: bufovf.c
	$(CC) $(CFLAGS) $(F32) bufovf.c -o bufovf-safe
	objdump -d bufovf-safe > bufovf-safe-exe.32d
	objdump -d bufovf-safe > bufovf-safe-exe.$(MACHINE)32d

charbuf-unsafe.32o: charbuf.c
	cp charbuf.c charbuf-unsafe.c
	$(CC) -c $(CFLAGS) $(F32) $(FNOSSP) charbuf-unsafe.c -o charbuf-unsafe.32o
	$(CC) -S $(CFLAGS) $(F32) $(FNOSSP) charbuf-unsafe.c -o charbuf-unsafe.32s

fragments.32o: fragments.32sa
	cp -p fragments.32sa fragments.s
	$(CC) -Wall $(F32) -c fragments.s -o fragments.32o
	$(CC) -Wall $(F32) -c fragments.s -o fragments.$(MACHINE)32o

fragments.32d: fragments.32o
	objdump -d fragments.32o > fragments.32d
	objdump -d fragments.32o > fragments.$(MACHINE)32d

add-suffixes.32o: add-suffixes.32sa
	cp -p add-suffixes.32sa add-suffixes.s
	$(CC) -Wall $(F32) -c add-suffixes.s -o add-suffixes.32o
	$(CC) -Wall $(F32) -c add-suffixes.s -o add-suffixes.$(MACHINE)32o

add-suffixes.32d: add-suffixes.32o
	objdump -d add-suffixes.32o > add-suffixes.32d
	objdump -d add-suffixes.32o > add-suffixes.$(MACHINE)32d


instr-egs.32o: instr-egs.32sa
	cp -p instr-egs.32sa instr-egs.s
	$(CC) -Wall $(F32) -c instr-egs.s -o instr-egs.32o
	$(CC) -Wall $(F32) -c instr-egs.s -o instr-egs.$(MACHINE)32o

instr-egs.32d: instr-egs.32o
	objdump -d instr-egs.32o > instr-egs.32d
	objdump -d instr-egs.32o > instr-egs.$(MACHINE)32d

instr-egs.64o: instr-egs.64sa
	cp -p instr-egs.64sa instr-egs.s
	$(CC) -Wall $(F64) -c instr-egs.s -o instr-egs.64o
	$(CC) -Wall $(F64) -c instr-egs.s -o instr-egs.$(MACHINE)64o

instr-egs.64d: instr-egs.64o
	objdump -d instr-egs.64o > instr-egs.64d
	objdump -d instr-egs.64o > instr-egs.$(MACHINE)64d

okmul32: okmul.c okmul-asm32.s
	$(CC) $(CFLAGS) $(F32) -S okmul.c 
	# Must remove comments inserted from asm directive
	perl -ne "s/#.*//; print;" < okmul.s > okmul.32s
	$(CC) $(CFLAGS) $(F32) -o okmul32 okmul.c okmul-asm32.s

okmul64: okmul.c okmul-asm64.s
	$(CC) $(CFLAGS) $(F64) -S okmul.c -o okmul.$(MACHINE)64s
	$(CC) $(CFLAGS) $(F64) -o okmul64 okmul.c okmul-asm64.s

ulmult-full32: ulmult-full.c
	$(CC) $(CFLAGS) $(F32) -DIS_IA32 -S ulmult-full.c -o ulmult-full.$(MACHINE)32s
	$(CC) $(CFLAGS) $(F32) -DIS_IA32 -o ulmult-full32 ulmult-full.c 

ulmult-full64: ulmult-full.c
	$(CC) $(CFLAGS) $(F64) -S ulmult-full.c -o ulmult-full.$(MACHINE)64s
	$(CC) $(CFLAGS) $(F64) -o ulmult-full64 ulmult-full.c

parity32: parity.c
	$(CC) $(CFLAGS) $(F32) -S parity.c -o parity.32s
	$(CC) $(CFLAGS) $(F32) parity.c -o parity32

parity64: parity.c
	$(CC) $(CFLAGS) $(F64) -S parity.c -o parity.64s
	$(CC) $(CFLAGS) $(F64) parity.c -o parity64

scheck.64: scheck.c
	$(CC) $(CFLAGS) $(F64) scheck.c -o scheck.64

scheck.32: scheck.c
	$(CC) $(CFLAGS) $(F32) scheck.c -o scheck.32

stabilize.64: stabilize.c
	$(CC) $(CFLAGS) $(F64) stabilize.c -o stabilize.64

stabilize.32: stabilize.c
	$(CC) $(CFLAGS) $(F32) stabilize.c -o stabilize.32

moore: moore.c
	$(CC) $(CFLAGS) $(F32) -o moore moore.c $(CINC) -lm $(CSAPPLIB32)

exe-data: exe-data.c
	$(CC) -Wall $(F32) -g -o exe-data exe-data.c 

incr32: incr.c $(CSAPPLIB32)
	$(CC) $(CFLAGS) $(CINC) incr.c $(CSAPPLIB32) $(F32) -DTIME -o incr32

incr64: incr.c $(CSAPPLIB64)
	$(CC) $(CFLAGS) $(CINC) incr.c $(CSAPPLIB64) $(F64) -DTIME -o incr64

suffixes.32d: suffixes32.s
	$(CC) -c $(F32) suffixes32.s -o suffixes.32o
	objdump -d suffixes.32o > suffixes.32d

abs-cmov.32o: abs.c
	cp -p abs.c abs-cmov.c
	$(CC) $(F32c) -c $(CFLAGS) abs-cmov.c -o abs-cmov.32o
	$(CC) $(F32c) -S $(CFLAGS) abs-cmov.c -o abs-cmov.32s

cond-cmov.32o: cond.c
	cp -p cond.c cond-cmov.c
	$(CC) $(F32c) -c $(CFLAGS) cond-cmov.c -o cond-cmov.32o
	$(CC) $(F32c) -S $(CFLAGS) cond-cmov.c -o cond-cmov.32s

if2-cmov.32o: if2.c
	cp -p if2.c if2-cmov.c
	$(CC) $(F32c) -c $(CFLAGS) if2-cmov.c -o if2-cmov.32o
	$(CC) $(F32c) -S $(CFLAGS) if2-cmov.c -o if2-cmov.32s

simple-intel.32o: simple.c
	cp -p simple.c simple-intel.c
	$(CC) $(F32) -c $(CFLAGS) -masm=intel simple-intel.c -o simple-intel.32o
	$(CC) $(F32) -S $(CFLAGS) -masm=intel simple-intel.c -o simple-intel.32s

loop-34.32o: loop.c
	cp -p loop.c loop-34.c
	$(CC34) $(F32) -c $(CFLAGS) loop-34.c -o loop-34.32o
	$(CC34) $(F32) -S $(CFLAGS) loop-34.c -o loop-34.32s

loop-40.32o: loop.c
	cp -p loop.c loop-40.c
	$(CC40) -c $(CFLAGS) loop-40.c -o loop-40.32o
	$(CC40) -S $(CFLAGS) loop-40.c -o loop-40.32s

list.32s: list.c
	$(CC) -S $(CFLAGS) $(F32c) list.c -o list.32s

list-O3.32s: list.c
	cp -p list.c list-O3.c
	$(CC) -S $(OPTCFLAGS) $(F32c) list-O3.c -o list-O3.32s

optfuns.32s: optfuns.c
	$(CC) -S $(CFLAGS) $(F32c) optfuns.c -o optfuns.32s

optfuns-O3.32s: optfuns.c
	cp -p optfuns.c optfuns-O3.c
	$(CC) -S $(OPTCFLAGS) $(F32c) optfuns-O3.c -o optfuns-O3.32s

floatcvt-4.2.32s: floatcvt.c
	cp -p floatcvt.c floatcvt-4.2.c
	$(CC42) -S $(CFLAGS) $(F32c) floatcvt-4.2.c -o floatcvt-4.2.32s

floatcvt-4.2.64s: floatcvt.c
	cp -p floatcvt.c floatcvt-4.2.c
	$(CC42) -S $(CFLAGS) $(F64) floatcvt-4.2.c -o floatcvt-4.2.64s

floatfunct-4.2.64s: floatfunct.c
	cp -p floatfunct.c floatfunct-4.2.c
	$(CC42) -S $(CFLAGS) $(F64) floatfunct-4.2.c -o floatfunct-4.2.64s

fp-funs-4.2.64s: fp-funs.c
	cp -p fp-funs.c fp-funs-4.2.c
	$(CC42) -S $(CFLAGS) $(F64) fp-funs-4.2.c -o fp-funs-4.2.64s

sibling.32s: sibling.c
	$(CC) -S $(OPTCFLAGS) $(F32c) -fno-inline sibling.c -o sibling.32s	

hello-linux: hello-linux.s
	as hello-linux.s -o hello-linux.o
	ld hello-linux.o -o hello-linux

clean:
	rm -f $(PROGS) *.o *~ *.exe *.32s *.64s *.32d *.64d *.32o *.64o
	rm -f okmul exe-data


