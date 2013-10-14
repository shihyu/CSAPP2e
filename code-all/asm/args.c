/* Demonstration of stack arguments */
/* $begin args-proto-c */
typedef int return_t;  /* Could be unsigned   */
typedef int *p_t;      /* Could be unsigned * */
typedef int x_t;       /* Could be unsigned   */
return_t fun(short c, char d, p_t p, x_t x);
/* $end args-proto-c */

int fun(short c, char d, int *p, int x) {
/* $begin args-body-c */
    *p = d;
    return x-c;
/* $end args-body-c */    
}

unsigned funuuu(short c, char d, unsigned *p, unsigned x) {
    *p = d;
    return x-c;
}

unsigned funuus(short c, char d, unsigned *p, int x) {
    *p = d;
    return x-c;
}

unsigned funusu(short c, char d, int *p, unsigned x) {
    *p = d;
    return x-c;
}

unsigned funuss(short c, char d, int *p, int x) {
    *p = d;
    return x-c;
}

int funsuu(short c, char d, unsigned *p, unsigned x) {
    *p = d;
    return x-c;
}

int funsus(short c, char d, unsigned *p, int x) {
    *p = d;
    return x-c;
}

int funssu(short c, char d, int *p, unsigned x) {
    *p = d;
    return x-c;
}

int funsss(short c, char d, int *p, int x) {
    *p = d;
    return x-c;
}

/* This one doesn't generate the right code */
char funcss(short c, char d, int *p, int x) {
    *p = d;
    return x-c;
}


