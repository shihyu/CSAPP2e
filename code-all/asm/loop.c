/* Illustration of different loops */

/* do-while */
/* $begin fact_dw-c */
int fact_dw(int x)
{
    int result = 1;
    do {
	result *= x;
	x--;
    } while (x > 0);
    return result;
}
/* $end fact_dw-c */

/* while */
/* $begin fact_while2-c */
int fact_while(int x)
{
    int result = 1;
    while (x > 0) {
	result *= x;
	x--;
    }
    return result;
}
/* $end fact_while2-c */

/* for */
int fact_for1(int x)
{
    int result = 1;
    int i;
    for (i = x; i > 0; i--)
	result *= i;
    return result;
}

int fact_for2(int x)
{
    int result = 1;
    int i;
    for (i = 2; i <= x; i++)
	result *= i;
    return result;
}

typedef struct ELE *list_ptr;
  
struct ELE {
    long int val;
    list_ptr next;
};

long int sum_dw(list_ptr ls)
{
    long int result = 0;
    do {
	result += ls->val;
	ls = ls->next;
    } while (ls);
    return result;
}

long int sum_while(list_ptr ls)
{
    long int result = 0;
    while (ls) {
	result += ls->val;
	ls = ls->next;
    }
    return result;
}

long int sum_for(list_ptr ls)
{
    long int result = 0;
    list_ptr le;
    for (le = ls; le; le = le->next)
	result += le->val;
    return result;
}

/* $begin puzzle-ans-c */
#define EXPR1 a & b
#define EXPR2 ~0
#define EXPR3 (1L<<n)
#define EXPR4 2 
#define EXPR5 mask
/* $end puzzle-ans-c */

/* $begin puzzle-prob-c */
long int puzzle(long int a, long int b, int n)
{
    unsigned long int mask;
    long int result = EXPR1;
    for (mask = EXPR2; mask > EXPR3; mask >>= EXPR4)
	result ^= EXPR5;
    return result;
}
/* $end puzzle-prob-c */

/* while */
/* $begin fact_while-c */
void sfact_while(int x, int *dest)
{
    int val = 1;
    while (x > 0) {
	val *= x;
	x--;
    }
    *dest = val;
}
/* $end fact_while-c */

