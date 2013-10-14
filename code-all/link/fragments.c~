/* pseudo-code */

#ifdef 0
/* $begin reloalg */
foreach section s {
    foreach relocation entry r {
        refptr = s + r.offset;  /* ptr to reference to be relocated */

        /* relocate a PC-relative reference */
        if (r.type == R_386_PC32) { 
            refaddr = ADDR(s) + r.offset; /* ref's run-time address */
            *refptr = (unsigned) (ADDR(r.symbol) + *refptr - refaddr);
	}

        /* relocate an absolute reference */
        if (r.type == R_386_32)   
            *refptr = (unsigned) (ADDR(r.symbol) + *refptr);
    }
}
/* $end reloalg */

/* $begin startupcode */
0x080480c0 <_start>:         /* entry point in .text */
    call __libc_init_first   /* startup code in .text */ 
    call _init               /* startup code in .init */
    call atexit              /* startup code in .text */
    call main                /* application main routine */
    call _exit               /* returns control to OS */
/* control never reaches here */
/* $end startupcode */


#endif 
