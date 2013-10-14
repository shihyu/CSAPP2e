/* Experiments to test pushl %esp */

#include <stdio.h>
#include <stdlib.h>

int pushtest();
int poptest();

int main()
{
  printf("pushtest -> 0x%x\n", pushtest());
  printf("poptest -> 0x%x\n", poptest());
}
