CC=gcc
CFLAGS = -O2 -Wall -g  -m64 -lrt

#CC=cc
#CFLAGS = -O2 


osevent: osevent.c clock.o options.o load.o clock.h options.h load.h
	$(CC) $(CFLAGS) -o osevent osevent.c clock.o options.o load.o

clock.o: clock.c clock.h
	$(CC) $(CFLAGS) -c clock.c

lsquare.o: lsquare.c lsquare.h
	$(CC) $(CFLAGS) -c lsquare.c

options.o: options.c options.h
	$(CC) $(CFLAGS) -c options.c

fcyc.o: fcyc.c clock.h
	$(CC) $(CFLAGS) -c fcyc.c

load.o: load.c clock.h
	$(CC) $(CFLAGS) -c load.c

thrasher: thrasher.c
	$(CC) $(CFLAGS) -o thrasher thrasher.c

clean:
	rm -f *.o core *.exe *~ perf-eg








