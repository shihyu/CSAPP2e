/* Multiprecision arithmetic */

typedef long long unsigned num_t;

/* $begin multi-c */
void store_prod(num_t *dest, unsigned x, num_t y) {
    *dest = x*y;
}
/* $end multi-c */
