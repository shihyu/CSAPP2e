/* Multiprecision arithmetic */

typedef long long num_t;

/* $begin multi-signed-c */
void store_prod(num_t *dest, unsigned x, num_t y) {
    *dest = x * y;
}
/* $end multi-signed-c */

int neg_prod(unsigned x, num_t y) {
    return x * y < 0;
}
