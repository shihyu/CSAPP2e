/* Test alignment of long double */

typedef  struct {
    int x;
    long double y;
} s;


int fun()
{
    return sizeof(s);
}
