/* Compute least squares fit of set of data points */

double ls_slope(double *xval, double *yval, int cnt);
double ls_intercept(double *xval, double *yval, int cnt);

typedef enum {LS_AVG, LS_MAX} ls_err_t;

double ls_error(double *xval, double *yval, int cnt, ls_err_t etype);







