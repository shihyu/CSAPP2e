#define M 13

typedef int Marray_t[M][M];

void transpose(Marray_t A) {
    int i, j;
    for (i = 0; i < M; i++)
	for (j = 0; j < i; j++) {
	    int t = A[i][j];
	    A[i][j] = A[j][i];
	    A[j][i] = t;
	}
}

void transpose_opt(Marray_t A) {
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
