/* $begin switch-c */
int switch_eg(int x, int n) { 
    int result = x; 

    switch (n) { 

    case 100: 
	result *= 13; 
	break; 

    case 102: 
	result += 10; 
	/* Fall through */ 

    case 103: 
	result += 11; 
	break; 

    case 104: 
    case 106: 
	result *= result; 
	break; 

    default: 
	result = 0;       
    } 

    return result; 
} 
/* $end switch-c */


/* $begin switch-impl-c */
int switch_eg_impl(int x, int n) {
    /* Table of code pointers */
    static void *jt[7] = {//line:asm:switch_jumptable
	&&loc_A, &&loc_def, &&loc_B,
	&&loc_C, &&loc_D, &&loc_def,
	&&loc_D
    }; 

    unsigned index = n - 100; 
    int result; 

    if (index > 6)
	goto loc_def; 

    /* Multiway branch */
    goto *jt[index]; //line:asm:switch:c_jump

 loc_def:  /* Default case*/
    result = 0;
    goto done;

 loc_C:    /* Case 103 */
    result = x;
    goto rest;
 
 loc_A:    /* Case 100 */ 
    result = x * 13; 
    goto done;

 loc_B:    /* Case 102 */
    result = x + 10;
    /* Fall through */

 rest:     /* Finish case 103 */
    result += 11;
    goto done;

 loc_D:    /* Cases 104, 106 */ 
    result = x * x;
    /* Fall through */

 done:
    return result;
} 
/* $end switch-impl-c */
