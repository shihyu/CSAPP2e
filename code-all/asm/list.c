/* Operations on linked list */
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

/* $begin list-decl-c */
/* Linked list element */
typedef struct ELE {
    int val;
    struct ELE *next;
} list_ele, *list_ptr;
/* $end list-decl-c */

list_ptr new_ele(int val) {
    list_ptr ls = (list_ptr) malloc(sizeof(list_ele));
    ls->val = val;
    return ls;
}

/* $begin list-ops-c */
int val(list_ptr ls) {
    if (ls == NULL)
	return 0;
    else
	return ls->val;
}

list_ptr next(list_ptr ls) {
    if (ls == NULL)
	return NULL;
    else
	return ls->next;
}

int is_null(list_ptr ls) {
    return ls == NULL;
}
/* $end list-ops-c */

/* $begin sum_list_rec-c */
int sum_list_rec(list_ptr ls) {
    if (ls == NULL)
	return 0;
    else
	return ls->val + sum_list_rec(ls->next);
}
/* $end sum_list_rec-c */

double dsum_list_rec(list_ptr ls) {
    if (ls == NULL)
	return 0.0;
    else
	return ls->val + dsum_list_rec(ls->next);
}

/* $begin diff_list_rec-c */
int diff_list_rec(list_ptr ls) {
    if (ls == NULL)
	return 0;
    else
	return ls->val - diff_list_rec(ls->next);
}
/* $end diff_list_rec-c */

/* $begin diff_list_opt-c */
int diff_list_rec_helper(list_ptr ls, int wt) {
    if (ls == NULL)
	return 0;
    else
	return (wt * ls->val) +
	    diff_list_rec_helper(ls->next, -wt);
}

int diff_list_rec2(list_ptr ls) {
    return diff_list_rec_helper(ls, 1);
}
/* $end diff_list_opt-c */

/* $begin diff_list_iter1-c */
int diff_list_iter1(list_ptr ls) {
    int wt = 1;
    int diff = 0;
    while (ls != NULL) {
	diff += wt * ls->val;
	wt = -wt;
	ls = ls->next;
    }
    return diff;
}
/* $end diff_list_iter1-c */

int sum_list_rec_abs(list_ptr ls) {
    if (is_null(ls))
	return 0;
    else
	return val(ls) + sum_list_rec_abs(next(ls));
}

/* $begin sum_list_tail-c */
int sum_list_tail(list_ptr ls, int sofar) {
    if (ls == NULL)
	return sofar;
    else
	return sum_list_tail(ls->next, sofar + ls->val);    
}

int sum_list_tail_call(list_ptr ls) {
    return sum_list_tail(ls, 0);
}
/* $end sum_list_tail-c */

/* $begin sum_list_iter-c */
int sum_list_iter(list_ptr ls) {
    int sum = 0;
    while (ls != NULL) {
	sum += ls->val;
	ls = ls->next;
    }
    return sum;
}
/* $end sum_list_iter-c */

/* $begin sum_list_iter_abs-c */
int sum_list_iter_abs(list_ptr ls) {
    int sum = 0;
    while (!is_null(ls)) {
	sum += val(ls);
	ls = next(ls);
    }
    return sum;
}
/* $end sum_list_iter_abs-c */

/* $begin sum_list_iter_expand-c */
/* Result of inline expansion in function sum_list_iter_abs */
int sum_list_iter_expand(list_ptr ls) {
    int sum = 0;
    /* Expansion of function is_null */
    while (!(ls==NULL)) {
	{
	    /* Expansion of function val */
	    int val;
	    if (ls == NULL) /* Optimized away */
		val = 0;
	    else
		val = ls->val;
	    sum += val;
	}
	{
	    /* Expansion of function next */
	    list_ptr next;
	    if (ls == NULL) /* Optimized away */
		next = NULL;
	    else
		next = ls->next;
	    ls = next;
	}
    }
    return sum;
}
/* $end sum_list_iter_expand-c */

/* $begin max_list_rec-c */
int max(int x, int y) {
    return (x > y) ? x : y;
}

int max_list_rec(list_ptr ls) {
    if (ls == NULL)
	return INT_MIN;
    else
	return max(ls->val,
		   max_list_rec(ls->next));
}
/* $end max_list_rec-c */

/* $begin max_list_tail-c */
int max_list_tail(list_ptr ls, int sofar) {
    if (ls == NULL)
	return sofar;
    else
	return max_list_tail(ls->next,
			     max(sofar, ls->val));
}

int max_list_tail_call(list_ptr ls) {
    return max_list_tail(ls, INT_MIN);
}
/* $end max_list_tail-c */    

/* $begin sum_list_iter2-c */
int sum_list_iter2(list_ptr ls) {
    if (ls == NULL)
	return 0;
    else {
	int sum = ls->val;
	while (ls->next != NULL) {
	    ls = ls->next;
	    sum += ls->val;
	}
	/* No need to add 0 */
	return sum;
    }
}
/* $end sum_list_iter2-c */

/* $begin sum_list_itail-c */
int sum_list_itail(list_ptr ls, int sofar) {
    while (!(ls == NULL)) {
	list_ptr nls    = ls->next;
	int      nsofar = sofar + ls->val;
	ls    = nls;
	sofar = nsofar;
    }
    return sofar;
}
/* $end sum_list_itail-c */
