/* $begin relo2prob */
extern int p3(void);  
int x = 1;  
int *xp = &x;  

void p2(int y) { 
}   

void p1() {  
    p2(*xp + p3());  
}  
/* $end relo2prob */
