/* Factorial using tail recursion */
int tailfact(int n, int sofar) {
    if (n <= 1)
	return sofar;
    return tailfact(n-1, sofar*n);
}

int tfact(int n) {
    return tailfact(n, 1);
}
     

int rfact(int n) {
    int result;
    if (n <= 1)
	result = 1;
    else
        result = n * rfact(n-1);
    return result;
}

/* Factorial using tail recursion */
double tailfact_d(int n, double sofar) {
    if (n <= 1)
	return sofar;
    return tailfact_d(n-1, sofar*n);
}

double tfact_d(int n) {
    return tailfact_d(n, 1);
}
     

double rfact_d(int n) {
    double result;
    if (n <= 1)
	result = 1;
    else
        result = n * rfact_d(n-1);
    return result;
}

