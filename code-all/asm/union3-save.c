/* $begin union3-decl-c */
typedef union {
    struct {
	short  v;
	short  d;
	int    s;
    } t1;
    struct {
	int a[2];
	char  *p;
    } t2;
} u_type;
/* $end union3-decl-c */

#if 0
/* $begin union3-fun-c */
TYPE get(u_type *up) {
    return up->EXPR;
}
/* $end union3-fun-c */
#endif

int get_v (u_type *up) {
    return up->t1.v;
}

int get_d (u_type *up) {
    return up->t1.d;
}

short *get_dp (u_type *up) {
    return &up->t1.d;
}

int get_s (u_type *up) {
    return up->t1.s;
}

int *get_a (u_type *up) {
    return up->t2.a;
}

int get_a_ele (u_type *up, int i) {
    return up->t2.a[i];
}

int get_as (u_type *up) {
    return up->t2.a[up->t1.s];
}

int get_a1 (u_type *up, int i) {
    return up->t2.a[1];
}

char *get_p (u_type *up) {
    return up->t2.p;
}

int get_pval (u_type *up) {
    return *up->t2.p;
}




