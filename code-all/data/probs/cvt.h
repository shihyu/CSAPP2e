/* Conversion and formatting to enable
   automatic creation of problems & examples */

/* Very leaky code.  Everything allocated on heap with no attempt to
   free memory once allocated
*/

typedef long long int lli_t;
typedef long long unsigned llu_t;

/* Concatenate set of strings.  Must finish with NULL */
char *concat(char *item, ...);

/* Concatenate set of strings with specified separator.  Finish with NULL */
char *sconcat(char *sep, char *item, ...);

/* Create permanent copy of string */
char *strarchive(char *s);

/* Conversions from numbers to strings */

/* Decimal */
char *i2d(lli_t x);

/* Hex: Choices involve:
     fixed/variable length (f/v)
     upper/lower case (X/x),
*/

char *i2vx(lli_t x);
char *i2vX(lli_t x);
char *i2fx(lli_t x, int len);
char *i2fX(lli_t x, int len);

/* Binary: Assume always fixed length */
char *i2b(lli_t x, int len);



/* Generate random number with specified maximum number of bits */
llu_t random_value(int len);

/* Turn into math format */
char *make_math(char *str);

/* Turn into TT format */
char *make_tt(char *str);

/* Enclose in brackets */

/* Create a row in a table.
   Trailing arguments are strings  */
char *make_row(char *item, ...);

/* Copy string to named file */
void dump_string(char *fname, char *str);

