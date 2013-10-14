/* Code highlighting differences between compilers */

int sum_abs(int a[], int n) {
    int sum = 0;
    int *next = a;
    int *last = a+n;
    while (next < last) {
	int val = *next++;
	sum += val < 0 ? -val : val;
    }
    return sum;
}

#include <limits.h>

int find_max(int a[], int n) {
    int max = INT_MIN;
    int i;
    for (i = 0; i < n; i++) {
	max = max < a[i] ? a[i] : max;
    }
    return max;

}

int find_maxp(int a[], int n) {
    int max = INT_MIN;
    int *next = a;
    int *last = a+n;
    while (next < last) {
	int val = *next++;
	max = max < val ? val : max;
    }
    return max;
}

int find_maxl(int a[], int n) {
    int max = INT_MIN;
    int cnt = n;
    while (cnt) {
	int val = a[--cnt];
	max = max < val ? val : max;
    }
    return max;
}

int raise_pwr2(int x, unsigned k)
{
    int xp2 = x;
    int result = 1;
    while (k) {
	int mask = -(k & 0x1);
	result *= mask & xp2;
	xp2 = 2*xp2;
	k >>= 1;
    }
    return result;
}
