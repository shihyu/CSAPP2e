/* Find number of elements in
   null-terminated list */
int len1(int a[])
{
    int len;
    for (len = 0; a[len]; len++)
	;
    return len;
}

/* Find number of elements in
   null-terminated list */
int len2(int a[])
{
  int len = 0;
  while (*a++) {
      len++;
  }
  return len;
}
