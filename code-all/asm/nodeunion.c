/* $begin nodeunion-c */
union NODE_U { 
    struct {  
	union NODE_U *left; 
	union NODE_U *right; 
    } internal; 
    double data; 
}; 
/* $end nodeunion-c */
