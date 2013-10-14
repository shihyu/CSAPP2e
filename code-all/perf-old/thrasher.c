/* Useless computation to consume memory */

#define BSIZE (1<<22)
int sink[BSIZE];

int main(int argc, char *argv[])
{
  while (1) {
    int i;
    for (i = 0; i < BSIZE; i++)
      sink[i] = 3.0;
  }
  return 0;
}
