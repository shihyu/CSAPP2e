#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* $begin charbuf-c */
int len(char *s) {
    return strlen(s);
}

void iptoa(char *s, int *p)
{
    int val = *p;
    sprintf(s, "%d", val);
}

int intlen(int x) {
    int v;
    char buf[12];
    v = x;
    iptoa(buf, &v);
    return len(buf);
}
/* $end charbuf-c */

void itoa(char *s, int x)
{
    sprintf(s, "%d", x);
}

void storeint(int val, int *dest)
{
    *dest  = val;
}

int intlen2(int x) {
    int v;
    char buf[12];
    storeint(x, &v);
    itoa(buf, v);
    return len(buf);
}

