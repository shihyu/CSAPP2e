/* $begin decode1-ans-proto */
void decode1(int *xp, int *yp, int *zp);
/* $end decode1-ans-proto */


/* $begin decode1-ans-c */
void decode1(int *xp, int *yp, int *zp) 
{ 
    int tx = *xp; 
    int ty = *yp; 
    int tz = *zp; 

    *yp = tx; 
    *zp = ty; 
    *xp = tz; 
} 
/* $end decode1-ans-c */

