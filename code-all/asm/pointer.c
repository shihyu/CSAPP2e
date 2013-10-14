#include <stdio.h>
#include <stdlib.h>
/* Illustration of pointers */

/* $begin pointer-c */
struct str {  /* Example Structure */
    int t;
    char v;
};

union uni {   /* Example Union */
    int t;
    char v;
};

int g = 15;

void fun(int* xp)
{
    printf("Called fun with xp = %p\n", xp);
    void (*f)(int*) = fun;   /* f is a function pointer */ //line:asm:pointer:f

    /* Allocate structure on stack */
    struct str s = {1,'a'}; /* Initialize structure */

    /* Allocate union from heap */
    union uni *up = (union uni *) malloc(sizeof(union uni)); //line:asm:pointer:malloc

    /* Locally declared array */
    int *ip[2] = {xp, &g}; //line:asm:pointer:ampg

    up->v = s.v+1;          

    printf("  ip     = %p, *ip    = %p, **ip   = %d\n",
	   ip, *ip, **ip); //line:asm:pointer:starip
    printf("  ip+1   = %p, ip[1]  =  %p, *ip[1] = %d\n",
	   ip+1, ip[1], *ip[1]); //line:asm:pointer:starip1
    printf("  &s.v   = %p, s.v    = '%c'\n", &s.v, s.v); //line:asm:pointer:ampsv
    printf("  &up->v =  %p, up->v  = '%c'\n", &up->v, up->v);  //line:asm:pointer:ampupv
    printf("  f      =  %p\n", f);
    if (--(*xp) > 0) //line:asm:pointer:starxp
        f(xp);                /* Recursive call of fun */ //line:asm:pointer:appf
}

int test()
{
    int x = 2;
    fun(&x);	//line:asm:pointer:ampx
    return x;
}
/* $end pointer-c */

int main()
{
  int buf[16];
  /* This little hack is an attempt to get the stack to be in a
     stable position
  */
  int offset = (((int) buf) & 0x7FFFFF);
  int *space = (int *) alloca(offset);
  *space = 0; /* So that don't get complaint of unused variable */
  return test();
}
