#include <stdlib.h>

typedef int row3_t[3];
typedef row3_t array4_3_t[5];

array4_3_t A;

int get_value(array4_3_t A, int i, int j)
{
    return A[i][j];
}

row3_t row0, row1, row2, row3;
int *B[4] = {row0, row1, row2, row3};

int get_value2(int *B[4], int i, int  j)
{
    return B[i][j];
}

/* $begin fixprodele-c */
/* $begin fixmatrixdef-c */
#define N 16
typedef int fix_matrix[N][N];
/* $end fixmatrixdef-c */

/* Compute i,k of fixed matrix product */
int fix_prod_ele (fix_matrix A, fix_matrix B,  int i, int k)
{
    int j;
    int result = 0;

    for (j = 0; j < N; j++)
	result += A[i][j] * B[j][k];

    return result;
}
/* $end fixprodele-c */

/* $begin fixprodeleopt-c */
/* Compute i,k of fixed matrix product */
int fix_prod_ele_opt(fix_matrix A, fix_matrix B, int i, int k)
{
    int *Arow = &A[i][0];
    int *Bptr = &B[0][k];
    int result = 0;
    int j;
    for (j = 0; j != N; j++) {
	result += Arow[j] * *Bptr;
	Bptr += N;
    }
    return result;
}
/* $end fixprodeleopt-c */

int fix_ele(fix_matrix A, int i, int j)
{
    return A[i][j];
}

/* $begin varmatrixdef-c */
/* $begin varprodele-c */
typedef int *var_matrix;
/* $end varprodele-c */
/* $end varmatrixdef-c */

/* $begin varnewmatrix-c */
var_matrix *new_var_matrix(int n)
{
    return (var_matrix *) malloc(sizeof(int[n][n]));
}
/* $end varnewmatrix-c */

/* $begin varele-c */
int var_ele(int n, int A[n][n], int i, int j)
{
    return A[i][j];
}
/* $end varele-c */

/* $begin varprodele-c */

/* Compute i,k of variable matrix product */
int var_prod_ele(int n, int A[n][n], int B[n][n], int i, int k)
{
    int j;
    int result = 0;

    for (j = 0; j < n; j++)
	result += A[i][j] * B[j][k]; //line:asm:array:varprodaccess

    return result;
}
/* $end varprodele-c */


/* $begin varprodeleopt-c */
/* Compute i,k of variable matrix product */
int var_prod_ele_opt(int n, int A[n][n], int B[n][n], int i, int k)
{
    int *Arow = A[i];
    int *Bcol = &B[0][k];
    int result = 0;
    int j;
    for (j = 0; j < n; j++) {
        result += *Arow * *Bcol;
	Arow += 1;
	Bcol += n;
    }
    return result;
}
/* $end varprodeleopt-c */

/* $begin fixdiag-c */
/* Set all diagonal elements to val */
void fix_set_diag(fix_matrix A, int val)
{
  int i;
  for (i = 0; i < N; i++)
    A[i][i] = val;
}
/* $end fixdiag-c */

/* $begin fixdiagopt-c */
/* Set all diagonal elements to val */
void fix_set_diag_opt(fix_matrix A, int val)
{
  int *Abase = &A[0][0];
  int index = 0;
  do {
    Abase[index] = val;
    index += (N+1);
  } while (index != (N+1)*N);
}
/* $end fixdiagopt-c */


#define M 13
typedef int matrix[M][M];

void transpose(matrix A) {
    int i, j;
    for (i = 0; i < M; i++)
	for (j = 0; j < i; j++) {
	    int t = A[i][j];
	    A[i][j] = A[j][i];
	    A[j][i] = t;
	}
}

void transpose_opt(matrix A) {
    int i, j;
    for (i = 0; i < M; i++) {
	int *Arow = &A[i][0];
	int *Acol = &A[0][i];
	for (j = 0; j < i; j++) {
	    int t = Arow[j];
	    Arow[j] = *Acol;
	    *Acol = t;
	    Acol += M;
	}
    }
}

