/* $begin absdiff2-ans-c */
int absdiff2(int x, int y) 
{ 
    int result; 

    if (x < y) 
	result = y-x; 
    else 
	result = x-y; 
    return result; 
} 
/* $end absdiff2-ans-c */
