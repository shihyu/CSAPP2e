/* Condition code setting */

int x, y;

typedef int data_t;

#define COMP <

/* $begin cc-c */
int comp(data_t a, data_t b) {
/* $end cc-c */
    x = a;
    y = b;
/* $begin cc-c */
    return a COMP b;
}
/* $end cc-c */

int ge(unsigned char a, unsigned char b) {
    x = a;
    y = b;
    return a >= b;
}

int ne(short a, short b) {
    x = a;
    y = b;
    return a != b;
}

int eq(int a, int b) {
    x = a;
    y = b;
    return a == b;
}

#define TEST !=

/* $begin cc2-c */
int test(data_t a) {
/* $end cc2-c */
    x = a;
/* $begin cc2-c */
    return a TEST 0;
}
/* $end cc2-c */

int test_eq(short a) {
    x = a;
    return a == 0;
}

int test_ge(char a) {
    x = a;
    return a >= 0;
}

