/* Example with heavy register usage */

int proc(x, y, z)
{
    return x+y+z;
}

void t3(int *ap, int *bp, int *cp) {
    int a = *ap;
    int b = *bp;
    int c = *cp;
    int vala = a+b;
    int valb = b+c;
    int valc = a+c;
    *ap = vala;
    *bp = valb;
    *cp = valc;
}

void t2(int *ap, int *bp) {
    int a = *ap;
    int b = *bp;
    int vala = a+b;
    int valb = b-a;
    *ap = vala;
    *bp = valb;
}
