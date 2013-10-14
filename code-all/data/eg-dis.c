/* Demonstration of two's complement numbers in disassembly */

int proca(int *a, int x, int y)
{
    int b[99];
    int t[6];

    b[3] = a[5] + t[4];
    a[17] = b[24];
    b[33] = x + y;
    return a[8];
}

int procb(int *a, int x, int y)
{
    int b[90];
    int t[4];

    b[2] = a[4] + t[3];
    a[7] = b[30];
    b[57] = x + y;
    return a[6];
}



int main()
{
    int a[10];
    return proca(a, 5, 7);
}
