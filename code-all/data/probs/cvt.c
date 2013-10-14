#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>

#include "cvt.h"

/* Conversion and formatting to enable
   automatic creation of problems & examples */

/* Very leaky code.  Everything allocated on heap with no attempt to
   free memory once allocated
*/

/* Utility routines */
/* Allocate space for string and initialize to zeros.
   len is string length.  Additional character allocated for terminator */
static char *new_string(int len)
{
  char *result = (char *) malloc(len+1);
  int i;
  if (!result) {
    fprintf(stderr, "Fatal error, couldn't allocate space for string\n");
    exit(1);
  }
  for (i = 0; i <= len; i++)
    result[i] = 0;
  return result;
}

/* Copy string to destination,
   updating destination pointer to next location.
   Do NOT add termination character
*/

static void strpcpy(char **destp, char *src)
{
  char *d = *destp;
  int c;
  while ((c = *src++))
    *d++ = c;
  *destp = d;
}

/* Create archival version of string */
char *strarchive(char *s)
{
  char *result =new_string(strlen(s));
  char *dest = result;
  strpcpy(&dest, s);
  return result;
}

/* Concatenate set of strings with specified separator.  Finish with NULL */
char *sconcat(char *sep, char *item, ...)
{
  va_list ap;
  char *next, *result, *rnext;
  int len = 0, cnt = 0;
  /* Pass one: Compute length */
  va_start(ap, item);
  for (next = item; next; next=va_arg(ap, char *)) {
    len += strlen(next);
    cnt++;
  }
  if (sep) {
    len += (cnt-1) * strlen(sep);    
  }
  va_end(ap);

  /* Pass two: Fill it up */
  result = new_string(len);
  rnext = result;
  va_start(ap, item);
  for (next = item; next; next=va_arg(ap, char *)) {
    if (next != item && sep)
      strpcpy(&rnext, sep);
    strpcpy(&rnext, next);
  }
  va_end(ap);
  return result;
}


/* Concatenate set of strings.  Must finish with NULL */
char *concat(char *item, ...) {
  va_list ap;
  char *next, *result, *rnext;
  int len = 0;
  int cnt = 0;
  /* Pass one: Compute length */
  va_start(ap, item);
  for (next = item; next; next=va_arg(ap, char *)) {
    len += strlen(next);
    cnt++;
  }
  va_end(ap);

  /* Pass two: Fill it up */
  result = new_string(len);
  rnext = result;
  va_start(ap, item);
  for (next = item; next; next=va_arg(ap, char *)) {
    strpcpy(&rnext, next);
  }
  va_end(ap);
  return result;
}

/* Conversions from numbers to strings */

static char ldigits[] = { '0', '1', '2', '3', '4', '5', '6', '7',
		 '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

static char udigits[] = { '0', '1', '2', '3', '4', '5', '6', '7',
		 '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

#define BUFLEN 66
static char buf[BUFLEN];

/* Master conversion routine.
   Indicate variable length conversion by setting length to 0 */
static char *icvt(lli_t x, int radix, int length, int lowercase)
{
  int sign = x < 0;
  lli_t val = sign ? -x : x;
  char *digits = lowercase ? ldigits : udigits;
  char *pos = buf+BUFLEN;
  *--pos = 0;
  while (length > 0 || (length == 0 && val)) {
    char c = digits[val % radix];
    *--pos = c;
    val = val / radix;
    length--;
  }
  if (radix == 10 && sign)
    *--pos = '-';
  if (radix == 16) {
    *--pos = 'x';
    *--pos = '0';
  }
  return strarchive(pos);
}

/* Decimal */
char *i2d(lli_t x)
{
  return icvt(x, 10, 0, 0);
}

/* Hex: Choices involve:
     fixed/variable length (f/v)
     upper/lower case (X/x),
*/

char *i2vx(lli_t x)
{
  return icvt(x, 16, 0, 1);
}

char *i2vX(lli_t x)
{
  return icvt(x, 16, 0, 0);
}

char *i2fx(lli_t x, int len)
{
  return icvt(x, 16, len, 1);
}


char *i2fX(lli_t x, int len)
{
  return icvt(x, 16, len, 0);
}

/* Binary: Assume always fixed length */
char *i2b(lli_t x, int len)
{
  return icvt(x, 2, len, 0);
}

/* Number of bits extracted from each call to random() */
#define RAND_BITS 16
#define RAND_MASK 0xFFFF

/* Generate random number with specified maximum number of bits */
llu_t random_value(int len)
{
  llu_t result = 0;
  int bits = len;
  while (bits >= RAND_BITS) {
    result = (result << RAND_BITS) | (random() & RAND_MASK);
    bits -= RAND_BITS;
  }
  if (bits > 0) {
    unsigned mask = (1<<(bits+1)) - 1;
    result = (result << bits) | (random() & mask);
  }
  return result;
}

/* Turn into math format */
char *make_math(char *str)
{
  return concat("$", str, "$", NULL);
}

/* Turn into TT format */
char *make_tt(char *str)
{
  return concat("\\texttt{", str, "}", NULL);
}

/* Enclose in brackets */
char *make_brack(char *str)
{
  return concat("[", str, "]", NULL);
}


/* Create a row in a table.
   Trailing arguments are strings  */
char *make_row(char *item, ...)
{
  va_list ap;
  char *next, *result, *rnext;
  char *sep = " & ";
  char *term = " \\\\\n";
  int len = 0, cnt = 0;
  /* Pass one: Compute length */
  va_start(ap, item);
  for (next = item; next; next=va_arg(ap, char *)) {
    len += strlen(next);
    cnt++;
  }
  if (sep) {
    len += (cnt-1) * strlen(sep);    
  }
  len += strlen(term);
  /* Pass two: Fill it up */
  result = new_string(len);
  rnext = result;
  va_start(ap, item);
  for (next = item; next; next=va_arg(ap, char *)) {
    if (next != item && sep)
      strpcpy(&rnext, sep);
    strpcpy(&rnext, next);
  }
  strpcpy(&rnext, term);
  va_end(ap);
  return result;
}

/* Copy string to named file */
void dump_string(char *fname, char *str)
{
  FILE *fp = fopen(fname, "w");
  if (!fp) {
    fprintf(stderr, "Error, could not open file '%s' to write\n", fname);
  } else {
    fprintf(fp, "%s", str);
    fclose(fp);
  }
}
