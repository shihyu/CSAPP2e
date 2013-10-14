/* $begin elfsymbol */
typedef struct { 
    int name;        /* String table offset */ 
    int value;       /* Section offset, or VM address */ 
    int size;        /* Object size in bytes */ 
    char type:4,     /* Data, func, section, or src file name (4 bits) */ 
	 binding:4;  /* Local or global (4 bits) */ 
    char reserved;   /* Unused */  
    char section;    /* Section header index, ABS, UNDEF, */ 
                     /* or COMMON  */  
} Elf_Symbol; 
/* $end elfsymbol */

/* $begin elfrelo */
typedef struct { 
    int offset;     /* Offset of the reference to relocate */ 
    int symbol:24,  /* Symbol the reference should point to */ 
	type:8;     /* Relocation type */ 
} Elf32_Rel; 
/* $end elfrelo */

