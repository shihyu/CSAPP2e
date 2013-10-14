/* $begin decimal5-c */
int decimal5(int *x) 
{ 
    int i; 
    int val = 0; 

    for (i = 0; i < 5; i++) 
	val = (10 * val) + x[i]; 

    return val; 
} 
/* $end decimal5-c */


/* 1st edition used this version */
int decimal5_opt_old(int *x) 
{ 
    int val = 0; 
    int *xend = x + 4; 

    do { 
	val = (10 * val) + *x; 
	x++; 
    } while (x <= xend); 

    return val; 
} 

/* Speculate that want this version */
/* $begin decimal5opt-c */
int decimal5_opt(int *x) 
{
    int i;
    int val = 0; 

    do { 
	val = (10 * val) + *x; 
	x++; 
	i++;
    } while (i <= 4); 

    return val; 
} 
/* $end decimal5opt-c */
