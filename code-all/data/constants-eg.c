/* Simple illustration of handling of constants */
#include <stdio.h>

typedef long long ll_t;

void run() {
  /* $begin constant_comp_zero */
  int dcomp = (-2147483648 < 0);
  int hcomp = (0x80000000  < 0);
  /* $end constant_comp_zero */
  /* $begin constant_assign */
  int dtmin  = -2147483648;
  int dcomp2 = (dtmin < 0);
  int htmin  = 0x80000000;
  int hcomp2 = (htmin  < 0);
  /* $end constant_assign */
 /* $begin constant_twice */
  long long dtwice = -2147483648 * 2;
  long long htwice = 0x80000000  * 2;
  /* $end constant_twice */
  /* $begin constant_shift */
  int dshift = -2147483648 >> 31;
  int hshift = 0x80000000  >> 31;
  /* $end constant_shift */
  /* $begin left_right */
  int dlr = -2147483648 << 1 >> 31 >> 1;
  int hlr = 0x80000000  << 1 >> 31 >> 1;
  /* $end left_right */
  printf("dcomp = %d, hcomp = %d\n", dcomp, hcomp);
  printf("dcomp2 = %d, hcomp2 = %d\n", dcomp2, hcomp2);
  printf("dtwice = %lld, htwice = %lld\n", dtwice, htwice);
  printf("dshift = %d, hshift = %d\n", dshift, hshift);
  printf("dlr = %d, hlr = %d\n", dlr, hlr);
}

void new_defs() {
    ll_t valld =
	/* $begin tmin_defs */
	  2147483647 + 1    /* A. */
	/* $end tmin_defs */
	;
    ll_t vallh =
	/* $begin tmin_defs */
	  0x7FFFFFFF + 1    /* B. */
	/* $end tmin_defs */
	;
    ll_t valhd =
	/* $begin tmin_defs */
	  2147483649 - 1    /* C. */
	/* $end tmin_defs */
	;
    ll_t valhh =
	/* $begin tmin_defs */
	  0x80000001 - 1    /* D. */
	/* $end tmin_defs */
	;
    ll_t valhdn =
	/* $begin tmin_defs */
	-(2147483649 - 1)   /* E. */
	/* $end tmin_defs */
	;
    ll_t valhhn =
	/* $begin tmin_defs */
	-(0x80000001 - 1)   /* F. */
	/* $end tmin_defs */
	;
    printf("2147483647 + 1 -> %lld\n", valld);
    printf("0x7FFFFFFF + 1 -> %lld\n", vallh);
    printf("2147483649 - 1 -> %lld\n", valhd);
    printf("0x80000001 - 1 -> %lld\n", valhh);
    printf("-(2147483649 - 1) -> %lld\n", valhdn);
    printf("-(0x80000001 - 1) -> %lld\n", valhhn);
}

int main(int argc, char *argv[]) {
  printf("word size = %d\n", sizeof(int *) * 8);
  run();
  new_defs();
  return 0;
}
