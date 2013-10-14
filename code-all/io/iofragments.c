#include "csapp.h"

void fragments()
{
    int sockfd=0;

    /* $begin fulldupopen */     
    FILE *fpin, *fpout;

    fpin = fdopen(sockfd, "r");
    fpout = fdopen(sockfd, "w");
    /* $end fulldupopen */     
    
    /* $begin fulldupclose */     
    fclose(fpin);
    fclose(fpout);
    /* $end fulldupclose */     
}
