/* $begin relo3prob */
int relo3(int val)  {  
    switch (val) {  
    case 100:   
        return(val);  
    case 101:  
        return(val+1);  
    case 103: case 104:   
        return(val+3);  
    case 105:  
        return(val+5);  
    default:  
        return(val+6);  
    }  
}  
/* $end relo3prob */
 
