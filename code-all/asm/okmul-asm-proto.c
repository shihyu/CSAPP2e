/* $begin tmult_ok_asm-proto-c */
/* Starter function for tmult_ok */
int tmult_ok_asm(int x, int y, int *dest) {
    int p = x*y;
    *dest = p;
    return p > 0;
}
/* $end tmult_ok_asm-proto-c */

/* Determine whether arguments can be multiplied without overflow */
unsigned umult_ok_asm(unsigned x, unsigned y, unsigned *dest) {
    unsigned p = x*y;
    *dest = p;
    return p > 0;
}
