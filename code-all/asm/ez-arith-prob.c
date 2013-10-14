#if 0
/* $begin ez-arith-prob-c */	
int arith(int x, 
	  int y, 
	  int z)
{ 
    int t1 = ________;
    int t2 = ________;
    int t3 = ________;
    int t4 = ________;
    return t4; 
} 
/* $end ez-arith-prob-c */	
#endif


int arith(int x, 
	  int y, 
	  int z)
{ 
/* $begin ez-arith-ans-c */	
    int t1 = x^y; 
    int t2 = t1 >> 3;
    int t3 = ~t2;
    int t4 = t3-z;
/* $end ez-arith-ans-c */	
    return t4; 
} 

