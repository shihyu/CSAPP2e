/* Example of do-while loop */

/* $begin dw-c */
int dw_loop(int x, int y, int n) {
    do {
        x += n; //line:asm:dw:cbstart
        y *= n; 
        n--;    //line:asm:dw:cbfinish
    } while ((n > 0) && (y < n)); //line:asm:dw:ctest
    return x;
}
/* $end dw-c */
