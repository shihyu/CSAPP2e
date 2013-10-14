/* Sample code */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

long int gval;

void test1(long int x, long int y)
{
  gval = (x+x+x) - (y+y+y);
}

long int test2(long int x, long int y)
{
  return (x+x+x) - (y+y+y);
}

long int iaddp(long int *xp, long int *yp)
{
  long int x = *xp;
  long int y = *yp;
  return x + y; 
}

void incr(long int *sum, long int v)
{
  long int oldval = *sum;
  long int newval = oldval + v;
  *sum = newval;
}

long int arefl(long int a[], long int i)
{
  return a[i];
}

int arefi(int a[], long int i)
{
  return a[i];
}

long int garray[10];

long int gref(long int i)
{
  return garray[i];
}

struct rec {
  long int i;
  long int a[3];
  long int *p;
};

void set_i(struct rec *r, long int val)
{
  r->i = val;
}

long int *find_a(struct rec *r, long int idx)
{
  return &r->a[idx];
}

void set_p(struct rec *r, long int *ptr)
{
  r->p = ptr;
}

void addr(struct rec *r)
{
  long int *loc;
  r->i = 1;
  loc = &r->a[r->i]; 
  r->p = loc;
  *(r->p) = 2;
  r->a[0] = 4;
  *(r->p+1) = 8;
}

long int condbr(long int x, long int y)
{
  long int v = 0;
  if (x > y)
    v =  x+x+x+y;
  return v;
}

long int max(long int x, long int y)
{
  return (x < y) ? y : x;
}


long int cfun(long int x, long int y)
{
  return (x < y) ? y+17 : x+29;
}

long int fact(long int x)
{
  long int result = 1;
  do {
    result *= x--;
  } while (x > 1);
  return result;
}

long int ifact(long int x)
{
  long int result = 1;
  while (x > 1)
    result *= x--;
  return result;
}

/* Find max ele. in array */
long int amax(long int a[], long int count)
{
  long int i;
  long int result = a[0];
  for (i = 1; i < count; i++)
    if (a[i] > result)
      result = a[i];
  return result;
}

typedef enum
  {ADD, MULT, MINUS, DIV, MOD, BAD} op_type;

char unparse_symbol(op_type op)
{
  switch (op) {
  case ADD :
    return '+';
  case MULT:
    return '*';
  case MINUS:
    return '-';
  case DIV:
    return '/';
  case MOD:
    return '%';
  case BAD:
    return '?';
  }
  return '!';
}

long int callee()
{
  return 5L;
}

long int caller()
{
  return callee();
}


/* Recursive factorial */
long int rfact(long int x)
{
  if (x <= 1)
    return 1;
  return x * rfact(x-1);
}

/* Recursive factorial */
void rfact2(long int x, long int *result)
{
  if (x <= 1) 
    *result = 1;
  else {
    long int temp;
    rfact2(x-1,&temp);
    *result = x * temp;
  }
  return;
}

void show_facts(void) {
  int i;
  long int vals[10];
  vals[0] = 1L;
  for (i = 1; i < 10; i++)
    vals[i] = vals[i-1] * i;
  for (i = 9; i >= 0; i--)
    printf("Fact(%d) = %ld\n", i, vals[i]);
}

void overwrite(int a0, int a1, int a2, 
	       int a3, int a4, int a5, int a6)
{
  long int buf[1]; /* Not enough! */
  long int i = 0;
  buf[i++] = a0;
  buf[i++] = a1;
  buf[i++] = a2;
  buf[i++] = a3;
  buf[i++] = a4;
  buf[i++] = a5;
  buf[i++] = a6;
  buf[i++] = 0;
  return;
}

void crash()
{
  overwrite(0,0,0,0,0,0,0);  
}

char *stuff_it_orig
  (char c0, char c1, char c2,
   char c3, char c4, char c5, 
   char c6, char c7)
{
  char buf[1]; /* Not enough! */
  int i = 0;
  char *result;
  buf[i++] = c0;
  buf[i++] = c1;
  buf[i++] = c2;
  buf[i++] = c3;
  buf[i++] = c4;
  buf[i++] = c5;
  buf[i++] = c6;
  buf[i++] = c7;
  buf[i++] = 0;
  result = (char *) malloc(i);
  strcpy(result, buf);
  return result;
}

float inner_prodF
  (float x[], float y[], int n)
{
  int i;
  float result = 0.0;
  for (i = 0; i < n; i++) {
    result += x[i] * y[i];
  }
  return result;
}

double inner_prodD
  (double x[], double y[],
   int n)
{
  int i;
  double result = 0.0;
  for (i = 0; i < n; i++) {
    result += x[i] * y[i];
  }
  return result;
}

typedef struct {
  char c;
  int i[2];
  double d;
} struct_ele, *struct_ptr;

char struct_c(struct_ptr p)
{
  return p->c;
}

int *struct_i(struct_ptr p)
{
  return p->i;
}

int struct_i1(struct_ptr p)
{
  return p->i[1];
}

double struct_d(struct_ptr p)
{
  return p->d;
}

typedef struct {
  char c;
  int *i;
  double d;
} pstruct_ele,
  *pstruct_ptr;

pstruct_ptr pstruct_alloc(void)
{
  pstruct_ptr result = (pstruct_ptr)
           malloc(sizeof(pstruct_ele));
  result->i = (int *)
           calloc(2, sizeof(int));
  return result;
}

int *pstruct_i(pstruct_ptr p)
{
  return p->i;
}

int pstruct_i1(pstruct_ptr p)
{
  return p->i[1];
}

/* Index into array of 
   struct_ele's */
struct_ptr a_index
    (struct_ele a[], int idx)
{
  return &a[idx];
}

typedef struct {
  double d;
  int i[2];
  char c;
} rev_ele, *rev_ptr;

typedef struct {
  int x;
  int y;
} point_ele, *point_ptr;

typedef struct {
  point_ele ll;
  point_ele ur;
} rect_ele, *rect_ptr;

int area(rect_ptr r)
{
  int width = r->ur.x - r->ll.x;
  int height = r->ur.y - r->ll.y;
  return width * height;
}

typedef union {
  char c;
  int i[2];
  double d;
} union_ele, *union_ptr;

typedef enum { CHAR, INT, DOUBLE } utype;

typedef struct {
  utype type;
  union_ele e;
} store_ele, *store_ptr;

void print_store(store_ptr p)
{
  switch (p->type) {
  case CHAR:
    printf("Char = %c\n", p->e.c);
    break;
  case INT:
    printf("Int[0] = %d, Int[1] = %d\n",
	   p->e.i[0], p->e.i[1]);
    break;
  case DOUBLE:
    printf("Double = %g\n", p->e.d);
    break;
  default:
    printf("Unknown element type\n");
  }
}

void test_order()
{
    union {
      unsigned char c[8];
      unsigned short s[4];
      unsigned int i[2];
      unsigned long l[1];
      
    } dw;
    int i;
    for (i = 0; i < 8; i++)
      dw.c[i] = 0xf0 + i;
    printf("Characters 0-7 ==  [0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x,0x%x]\n",
	  dw.c[0], dw.c[1], dw.c[2], dw.c[3],
	  dw.c[4], dw.c[5], dw.c[6], dw.c[7]);
    printf("Shorts 0-3 == [0x%x,0x%x,0x%x,0x%x]\n",
	  dw.s[0], dw.s[1], dw.s[2], dw.s[3]);
    printf("Ints 0-1 == [0x%x,0x%x]\n",
	  dw.i[0], dw.i[1]);
    printf("Long 0 == [0x%lx]\n",
	  dw.l[0]);
}

