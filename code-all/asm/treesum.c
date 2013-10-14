#include <stdio.h>

/* $begin tree_sum-c */
/* Tree data structure */
typedef struct NODE { 
    int val;
    struct NODE *left; 
    struct NODE *right; 
} tree_ele, *tree_ptr; 

/* Sum values in tree, recursively */
int sum_tree_rec(tree_ptr tp) {
    if (tp == NULL)
	return 0;
    else {
	return tp->val +
	    sum_tree_rec(tp->left) +
	    sum_tree_rec(tp->right);
    }
}
/* $end tree_sum-c */

/* $begin tree_sum_lrec-c */
/* Sum values in tree,
   recursively for left subtree and
   iteratively for right subtree */ 
int sum_tree_lrec(tree_ptr tp) {
    int sum = 0;
    while (!(tp == NULL)) {
	sum += tp->val +
	    sum_tree_lrec(tp->left);
	tp = tp->right;
    }
    return sum;
}
/* $end tree_sum_lrec-c */
