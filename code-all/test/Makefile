CC40 = /usr/local/libexec/gcc-4.0.2/bin/gcc
CC34 = /usr/local/libexec/gcc-3.4.2/bin/gcc
CC = gcc
CFLAGS= -O1 -Wall

CINC = -I$(CSAPP2DIR)/include
CSAPPLIB32 = $(CSAPP2DIR)/lib/libcsapp32.a
CSAPPLIB64 = $(CSAPP2DIR)/lib/libcsapp64.a

#IDENTIFY = ../../bin/identify.pl
#MACHINE = `$(IDENTIFY)`

F32 =-m32
F32c = -m32 -march=i686


F64 =-m64

.SUFFIXES: .c .32o .64o .32d .64d 


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

# Execute on base machine
prog64:	\
	cond.64o\
	convert.64o\
	floatconst.64o\
	floatcvt.64o\
	floatfunct.64o\
	incr.64o incr.64d\
	loop.64o\
	probs.64o\
	proc.64o\

# Execute on base machine
prog32: abs.32o\
	abs-cmov.32o\
	align.32o\
	arith.32o\
	array.32o\
	branch.32o\
	branch-exe.32d\
	calleesave.32o\
	cc.32o\
	code.32o\
	compiler-eg.32o\
	continue-eg.32o\
	ctest.32o\
	decimal5.32o\
	decode1-ans.32o\
	dw.32o\
	exchange.32o\
	fib.32o\
	fixarray.32o\
	for.32o\
	fp.32o\
	fpfunct2-ans.32o\
	fpgreater-ans.32o\
	fragments.32o\
	frame.32o\
	incr.32o\
	loop.32o \
	muldiv.32o\
	nodestruct.32o\
	nodeunion.32o\
	nodeuniontag.32o\
	okmul\
	okmul.32o\
	pointer.32o\
	pointer-exe.32d\
	code-exe.32d\
	rect.32o\
	shift.32o\
	simple-if.32o\
	simple.32o\
	struct2.32o\
	structure.32o\
	suffixes.32d\
	swapadd.32o\
	switch-ans.32o\
	switch.32o\
	union.32o\
	union2.32o\
	while.32o\
        bufovf-exe.32d\


# execute this on cobia
loops: \
	loop-34.32o \
	loop-40.32o 


pointer-exe.32d: pointer.c
	$(CC) -Wall -O2 $(F32) pointer.c -o pointer
	./pointer > pointer.$(MACHINE)32s
	objdump -d pointer > pointer-exe.32d
	objdump -d pointer > pointer-exe.$(MACHINE)32d

code-exe.32d: code.c main.c
	$(CC) -Wall -O2 $(F32) -S code.c -o code.$(MACHINE)32s
	$(CC) -Wall -O2 $(F32) -c code.c -o code.32o
	$(CC) $(CFLAGS) $(F32) -o prog code.c main.c
	objdump -d code.32o > code-rel.32d
	objdump -d code.32o > code-rel.$(MACHINE)32d
	objdump -d prog > code-exe.32d
	objdump -d prog > code-exe.$(MACHINE)32d

branch-exe.32d: branch.c
	$(CC) -Wall -O2 $(F32) -S branch.c -o branch.$(MACHINE)32s
	$(CC) -Wall -O2 $(F32) -c branch.c -o branch.32o
	$(CC) -Wall -O2 $(F32) -o branch branch.c
	objdump -d branch.32o > branch-rel.32d
	objdump -d branch.32o > branch-rel.$(MACHINE)32d
	objdump -d branch > branch-exe.32d
	objdump -d branch > branch-exe.$(MACHINE)32d

bufovf-exe.32d: bufovf.c
	$(CC) -Wall -O2 $(F32) bufovf.c -o bufovf
	objdump -d bufovf > bufovf-exe.32d
	objdump -d bufovf > bufovf-exe.$(MACHINE)32d

fragments.32o: fragments.32sa
	cp -p fragments.32sa fragments.s
	$(CC) -Wall $(F32) -c fragments.s -o fragments.32o
	$(CC) -Wall $(F32) -c fragments.s -o fragments.$(MACHINE)32o

okmul: okmul.c
	$(CC) -Wall -O2 $(F32) -S okmul.c -o okmul.$(MACHINE)32s
	$(CC) -Wall -O2 $(F32) -o okmul okmul.c

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

loop-34.32o: loop.c
	cp -p loop.c loop-34.c
	$(CC34) $(F32) -c $(CFLAGS) loop-34.c -o loop-34.32o
	$(CC34) $(F32) -S $(CFLAGS) loop-34.c -o loop-34.32s

loop-40.32o: loop.c
	cp -p loop.c loop-40.c
	$(CC40) -c $(CFLAGS) loop-40.c -o loop-40.32o
	$(CC40) -S $(CFLAGS) loop-40.c -o loop-40.32s


hello-linux: hello-linux.s
	as hello-linux.s -o hello-linux.o
	ld hello-linux.o -o hello-linux

clean:
	rm -f $(PROGS) *.o *~ *.exe *.32s *.64s *.32d *.64d *.32o *.64o


