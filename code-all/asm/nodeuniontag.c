/* $begin nodeuniontag-c */
typedef enum { N_LEAF, N_INTERNAL } nodetype_t;

struct NODE_T { 
    nodetype_t type;
    union { 
	struct {  
	    struct NODE_T *left; 
	    struct NODE_T *right; 
	} internal; 
	double data; 
    } info; 
}; 
/* $end nodeuniontag-c */
