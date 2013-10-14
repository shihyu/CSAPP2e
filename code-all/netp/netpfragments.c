#include "csapp.h"

void fragments()
{
    int clientfd;

    /* $begin socketcall */
    clientfd = Socket(AF_INET, SOCK_STREAM, 0);
    /* $end socketcall */
}
