/* Array Dimensions Problem */

#define M 5
#define N 7

/* $begin fixarray-c */
int mat1[M][N];
int mat2[N][M];

int sum_element(int i, int j) {
    return mat1[i][j] + mat2[j][i];
}
/* $end fixarray-c */
