/* Examples of recursive forms */

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

/* Linked list element */
   
typedef struct ELE {
    int val;
    struct ELE *next;
} list_ele, *list_ptr;

list_ptr new_ele(int val, list_ptr next) {
    list_ptr ls = (list_ptr) malloc(sizeof(list_ele));
    ls->val = val;
    ls->next = next;
    return ls;
}

/* Convert array of strings into list of values */
list_ptr gen_list(char *a[], int len) {
    list_ptr ls = NULL;
    int i;
    for (i = len-1; i >= 0; i--) {
	int val = atoi(a[i]);
	ls = new_ele(val, ls);
    }
    return ls;
}

void print_list(list_ptr ls) {
    printf("[ ");
    while (ls) {
	printf("%d ", ls->val);
	ls = ls->next;
    }
    printf("]");
}

/* Regular version */
int sum_list(list_ptr ls) {
    if (ls == NULL)
	return 0;
    return ls->val + sum_list(ls->next);
}

typedef list_ptr dat1;
typedef int dat2;
typedef int dat;

int cond(dat1 arg1, dat2 arg2) {
    return arg1 == NULL;
}

dat result(dat1 arg1, dat2 arg2) {
    return arg2;
}

dat1 newval1(dat1 arg1, dat2 arg2) {
    return arg1->next;
}

dat2 newval2(dat1 arg1, dat2 arg2) {
    return arg1->val + arg2;
}

/* Tail recursion */
dat tail(dat1 arg1, dat2 arg2) {
    if (cond(arg1, arg2))
	return result(arg1, arg2);
    else {
	dat1 narg1 = newval1(arg1, arg2);
	dat2 narg2 = newval2(arg1, arg2);
	return tail(narg1, narg2);
    }
}

dat2 base_arg2 = 0;

/* Put it to use */
dat use_tail(dat1 arg1) {
    return tail(arg1, base_arg2);
}

dat iter_tail(dat1 arg1, dat2 arg2) {
    while (!cond(arg1, arg2)) {
	dat1 narg1 = newval1(arg1, arg2);
	dat2 narg2 = newval2(arg1, arg2);
	arg1 = narg1;
	arg2 = narg2;
    }
    return result(arg1, arg2);
}

/* Put it to use */
dat use_iter_tail(dat1 arg1) {
    return iter_tail(arg1, base_arg2);
}

typedef list_ptr adat;

/* General recursive forms */

adat stop_arg = NULL;
#define OP +
dat base(adat arg) {
    return 0;
}

static void report_error(char *);

dat g(adat arg) {
    if (arg == NULL) {
	report_error("NULL pointer in g");
    }
    return arg->val;
}

adat d(adat arg) {
    if (arg == NULL) {
	report_error("NULL pointer in d");
    }
    return arg->next;
}

/* General recursion */
dat recur(adat arg) {
    if (arg == stop_arg)
	return base(arg);
    else
	return g(arg) OP recur(d(arg));
}

/* When OP is commutative and associative */
dat iter1(adat arg) {
    dat r = base(stop_arg);
    while (arg != stop_arg) {
	r = r OP g(arg);
	arg = d(arg);
    }
    return r;
}

/* When OP is associative */
dat iter2(adat arg) {
    if (arg == stop_arg)
	return base(stop_arg);
    else {
	dat r = g(arg);
	while ((arg = d(arg)) != stop_arg) {
	    r = r OP g(arg);
	}
	r = r OP g(arg);
	return r;
    }
}

#if 0
/* When d has inverse dinv */
dat iter3(adat arg) {
    dat r = base(stop_arg);
    if (arg == stop_arg)
	return r;
    else {
	adat a = dinv(stop_arg);
	while (a != arg) {
	    r = g(a) OP r;
	    a = dinv(a);
	}
	r = g(arg) OP r;
    return r;
    }
}
#endif

/* Try out these different versions */
typedef int (*lister)(list_ptr);
struct {
    char *descr;
    lister fun;
} fun_set[] =

    {
	{"Standard Recursion", sum_list},
	{"Tail recursion", use_tail},
	{"Iterated tail recursion", use_iter_tail},
	{"General recursion", recur},
	{"Iterated recursion, version 1", iter1},
	{"Iterated recursion, version 2", iter2},
	{"Nothing", NULL}
    };

int idx = 0;

static void report_error(char *msg) {
    printf("Error in function %s: %s\n",
	   fun_set[idx].descr, msg);
    exit(0);
}

int main(int argc, char *argv[]) {
    int len = argc-1;
    list_ptr ls = gen_list(argv + 1, len);
    int ref_val = sum_list(ls);
    print_list(ls);
    printf(" --> %d\n", ref_val);
    for (idx = 0; fun_set[idx].fun != NULL; idx++) {
	int val = fun_set[idx].fun(ls);
	if (val != ref_val) {
	    printf("Function %s returns %d\n",
		   fun_set[idx].descr, val);
	}
    }
    return 0;
}

