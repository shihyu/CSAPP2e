/* clock.c
 * Retrofitted to use thread-specific timers and to get clock information from /proc/cpuinfo
 * (C) R. E. Bryant, 2010
 *
 */

/* Choice to use cpu_gettime call or Intel time stamp counter directly */
#ifndef USE_TSC
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "clock.h"

int gverbose = 1;

/* Keep track of clock speed */
double cpu_ghz = 0.0;

/* Get megahertz from /etc/proc */
#define MAXBUF 512


volatile int incr = 1;
volatile int val = 0;

/* Induce load on processor to have it set clock rate to maximum */
/* How many steps to run? */
#define STEP_CNT (1<<30)

void burn_cpu() {
    int i;
    val = 0;
    incr = random() & 0x7;
    for (i = 0; i < STEP_CNT; i++)
	val *= incr;
}

double core_mhz(int verbose) {
    static char buf[MAXBUF];
    FILE *fp = fopen("/proc/cpuinfo", "r");
    cpu_ghz = 0.0;

    if (!fp) {
	fprintf(stderr, "Can't open /proc/cpuinfo to get clock information\n");
	cpu_ghz = 1.0;
	return cpu_ghz * 1000.0;
    }
    while (fgets(buf, MAXBUF, fp)) {
	if (strstr(buf, "cpu MHz")) {
	    double cpu_mhz = 0.0;
	    sscanf(buf, "cpu MHz\t: %lf", &cpu_mhz);
	    cpu_ghz = cpu_mhz / 1000.0;
	    break;
	}
    }
    fclose(fp);
    if (cpu_ghz == 0.0) {
	fprintf(stderr, "Can't open /proc/cpuinfo to get clock information\n");
	cpu_ghz = 1.0;
	return cpu_ghz * 1000.0;
    }
    if (verbose) {
	printf("Processor Clock Rate ~= %.4f GHz (extracted from file)\n", cpu_ghz);
    }
    return cpu_ghz * 1000;
}

/*
  02/22/2010.  Attempt to determine processor clock rate even when
  speed step is in use.  Keep running CPU-intensive task until
  determine maximum clock rate.
*/
double mhz(int verbose) {
    double maxval = 0.0;
    /* Temporary fix to specific machine */
    double val = core_mhz(verbose);
    /* Revert back to original code */
    return val;
    /* This was the new method */
    while (val != maxval) {
	burn_cpu();
	if (val > maxval)
	    maxval = val;
	val = core_mhz(verbose);
    }
    return val;
}

/* Simulate counters by using nanosecond timers and then converting to clock cycles */
struct timespec last_time;

#if 0
/* Use realtime clock */
#define CLKT CLOCK_REALTIME
#else
/* Use thread clock */
#define CLKT CLOCK_THREAD_CPUTIME_ID
#endif


void start_counter()
{
    if (cpu_ghz == 0.0)
	mhz(gverbose);
    if (clock_gettime(CLKT, &last_time) != 0) {
	fprintf(stderr, "Couldn't get time\n");
	exit(1);
    }
}

double get_counter()
{
    struct timespec new_time;
    double delta_nsecs = 0.0;
    if (clock_gettime(CLKT, &new_time) != 0) {
	fprintf(stderr, "Couldn't get time\n");
	exit(1);
    }
    delta_nsecs = 1e9 * (new_time.tv_sec - last_time.tv_sec) + (new_time.tv_nsec - last_time.tv_nsec);
    return delta_nsecs * cpu_ghz;
}

double mhz_full(int verbose, int sleeptime) {
    return mhz(verbose);
}

void start_comp_counter()
{
    start_counter();
}

double get_comp_counter()
{
    return get_comp_counter();
}

#else /* Don't have POSIX timers */

/* The following is old code based on cycle counters */

/*
* clock.c
* platform-specific timing code
* Ask Prof. David O'Hallaron (droh@cs.cmu.edu) about the alpha, i386 and X86-64 code
* Ask Sean Kelly (spkelly@andrew.cmu.edu) about the PowerPC code
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/times.h>
#include "clock.h"


/* Routines for using cycle counter */

/* Detect whether running on Alpha */
#ifdef __alpha
#define IS_ALPHA 1
#else
#define IS_ALPHA 0
#endif

/* Detect whether running on x86 */
#if defined(__i386__) || defined(__x86_64__)
#define IS_x86 1
#else
#define IS_x86 0
#endif

/* Detect whether running on PowerPC */
#if defined(powerc) || defined(__POWERC__) || defined(__ppc__) || defined(ppc)
#define IS_PPC 1
#else
#define IS_PPC 0
#endif
// timing accuracy can be improved if we have supervisor access
#define PPC_SUPERVISOR 0


/* Keep track of most recent reading of cycle counter */
static unsigned cyc_hi = 0;
static unsigned cyc_lo = 0;

#if IS_ALPHA
/* Use Alpha cycle timer to compute cycles.  Then use
   measured clock speed to compute seconds 
*/

/*
 * counterRoutine is an array of Alpha instructions to access 
 * the Alpha's processor cycle counter. It uses the rpcc 
 * instruction to access the counter. This 64 bit register is 
 * divided into two parts. The lower 32 bits are the cycles 
 * used by the current process. The upper 32 bits are wall 
 * clock cycles. These instructions read the counter, and 
 * convert the lower 32 bits into an unsigned int - this is the 
 * user space counter value.
 * NOTE: The counter has a very limited time span. With a 
 * 450MHz clock the counter can time things for about 9 
 * seconds. */
static unsigned int counterRoutine[] =
{
 0x601fc000u,
 0x401f0000u,
 0x6bfa8001u
};

/* Cast the above instructions into a function. */
static unsigned int (*counter)(void)= (void *)counterRoutine;


void start_counter()
{
  /* Get cycle counter */
  cyc_hi = 0;
  cyc_lo = counter();
}

double get_counter()
{
  unsigned ncyc_hi, ncyc_lo;
  unsigned hi, lo, borrow;
  double result;
  ncyc_lo = counter();
  ncyc_hi = 0;
  lo = ncyc_lo - cyc_lo;
  borrow = lo > ncyc_lo;
  hi = ncyc_hi - cyc_hi - borrow;
  result = (double) hi * (1 << 30) * 4 + lo;
  if (result < 0) {
    fprintf(stderr, "Error: Cycle counter returning negative value: %.0f\n", result);
  }
  return result;
}
#endif /* Alpha */

#if IS_x86
void access_counter(unsigned *hi, unsigned *lo)
{
  /* Get cycle counter */
  asm("rdtsc; movl %%edx,%0; movl %%eax,%1" 
      : "=r" (*hi), "=r" (*lo)
      : /* No input */ 
      : "%edx", "%eax");
}

void start_counter()
{
  access_counter(&cyc_hi, &cyc_lo);
}

double get_counter()
{
  unsigned ncyc_hi, ncyc_lo;
  unsigned hi, lo, borrow;
  double result;
  /* Get cycle counter */
  access_counter(&ncyc_hi, &ncyc_lo);
  /* Do double precision subtraction */
  lo = ncyc_lo - cyc_lo;
  borrow = lo > ncyc_lo;
  hi = ncyc_hi - cyc_hi - borrow;
  result = (double) hi * (1 << 30) * 4 + lo;
  if (result < 0) {
    fprintf(stderr, "Error: Cycle counter returning negative value: %.0f\n", result);
  }
  return result;
}
#endif /* x86 */

#if IS_PPC
void start_counter()
{
    /*
    * Use the performance monitoring functionality of any PowerPC 604 or later
    * to count cycles. 
    */
    
    register unsigned temp; // just to be sure, for the assembly's sake
    
#if PPC_SUPERVISOR
    /* Version 1- uses supervisor-level MMCR and PMC for exact cycle count */
    
    // if I'm understanding PPC ASM right, this should stop any timing currently
    // running (MMCR=0) ans clear PMC1.
    asm("li %0,0\nmtspr MMCR0,%0\nmtspr PMC1,%0":"=r"(temp));
    
    //initialize performance monitoring system, tell PMC1 to count cycles by setting
    //proper bits of MMCR0, grab initial value in cyc_lo:
    // Load Immediate (16bit) 64 to temp, Move temp To Special Purpose Reg MMCR0, Move temp From SPR MMCR0
  asm("li %0,64\nmtspr MMCR0,%0\nmfspr %0,PMC1":"=r"(temp));
#else
  /* Version 2- uses user-accessible TimeBase Lower register- TB increments once
  * every n cycles, n is processor dependent: 
  * PPC 604 n~4 
  * Wallstreet G3 266 n=16 
  * Titanium 15" Ghz G4 n=30
  * 1.8GHz G5 n~50
  */
  
  asm("mftb %0":"=r"(temp));
#endif

  cyc_lo = temp;
  cyc_hi = cyc_lo; 
}

double get_counter()
{
    register unsigned temp;
#if PPC_SUPERVISOR
    // copy PMC1 counter value to cyc_hi.  Not ideal- mfspr takes time.
    asm("mfspr %0,PMC1":"=r"(temp));
    cyc_hi=temp;
    if (cyc_hi<cyc_lo){
        fprintf(stderr, "Error: Final cycle count > initial cycle count.\n");
    }
#else
    asm("mftb %0":"=r"(temp));
    cyc_hi=temp;
#endif
    return (double)(cyc_hi-cyc_lo);
}
#endif /* PowerPC */

/* Determine clock rate by measuring cycles
   elapsed while sleeping for sleeptime seconds */
double mhz_full(int verbose, int sleeptime)
{
  double rate;
  start_counter();
  sleep(sleeptime);
  rate = get_counter()/(1e6*sleeptime);
  if (verbose) 
    printf("Processor Clock Rate ~= %.1f MHz\n", rate);
  return rate;
}

/* Version using a default sleeptime */
double mhz(int verbose)
{
  return mhz_full(verbose, 2);
}

/** Special counters that compensate for timer interrupt overhead */

static double cyc_per_tick = 0.0;

#define NEVENT 100
#define THRESHOLD 1000
#define RECORDTHRESH 3000

/* Attempt to see how much time is used by timer interrupt */
static void callibrate(int verbose)
{
  double oldt;
  struct tms t;
  clock_t oldc;
  int e = 0;
  times(&t);
  oldc = t.tms_utime;
  start_counter();
  oldt = get_counter();
  while (e <NEVENT) {
    double newt = get_counter();
    if (newt-oldt >= THRESHOLD) {
      clock_t newc;
      times(&t);
      newc = t.tms_utime;
      if (newc > oldc) {
	double cpt = (newt-oldt)/(newc-oldc);
	if ((cyc_per_tick == 0.0 || cyc_per_tick > cpt) && cpt > RECORDTHRESH)
	  cyc_per_tick = cpt;
	/*
	if (verbose)
	  printf("Saw event lasting %.0f cycles and %d ticks.  Ratio = %f\n",
		 newt-oldt, (int) (newc-oldc), cpt);
	*/
	e++;
	oldc = newc;
      }
      oldt = newt;
    }
  }
  if (verbose)
    printf("Setting cyc_per_tick to %f\n", cyc_per_tick);
}

static clock_t start_tick = 0;

void start_comp_counter() {
  struct tms t;
  if (cyc_per_tick == 0.0)
    callibrate(1);
  times(&t);
  start_tick = t.tms_utime;
  start_counter();
}

double get_comp_counter() {
  double time = get_counter();
  double ctime;
  struct tms t;
  clock_t ticks;
  times(&t);
  ticks = t.tms_utime - start_tick;
  ctime = time - ticks*cyc_per_tick;
  /*
  printf("Measured %.0f cycles.  Ticks = %d.  Corrected %.0f cycles\n",
	 time, (int) ticks, ctime);
  */
  return ctime;
}
#endif

double ovhd() {
    /* Find lowest among multiple samples */
    int i;
    double result = 1E10;
    for (i = 0; i < 100; i++) {
	double sample;
	start_counter();
	sample = get_counter();
	if (sample < result)
	    result = sample;
    }
    return result;
}
