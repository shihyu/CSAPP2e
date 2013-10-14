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
void get(u_type *up, TYPE *dest) {
    *dest =  EXPR;
}
/* $end union3-fun-c */
#endif

#define GETTER(name,type,expr) void name(u_type *up,type *dest) { *dest = expr; }

GETTER(get_s, int, up->t1.s)

GETTER(get_v, short, up->t1.v)

GETTER(get_da, short *, &up->t1.d)

GETTER(get_a, int *, up->t2.a)

GETTER(get_as, int, up->t2.a[up->t1.s])

GETTER(get_pval, char, *up->t2.p)
