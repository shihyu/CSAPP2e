int Q(int y);

/* $begin calleesave-c */
int P(int x) 
{ 
    int y = x*x; 
    int z = Q(y); 
    return y + z; 
} 
/* $end calleesave-c */
