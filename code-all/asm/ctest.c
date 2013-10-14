/* Test of conditions and setting */

/* $begin ctest-c-ans */
char ctest(int a, int b, int c)
{
  char t1 =         a <             b;
  char t2 =         b <  (unsigned)    a;
  char t3 = (short) c >= (short)    a;
  char t4 = (char) a != (char)    c;
  char t5 =         c >             b;
  char t6 =         a >             0;
  return t1 + t2 + t3 + t4 + t5 + t6;
}
/* $end ctest-c-ans */
