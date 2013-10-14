/* 
 * gethostbyname_r - Using the Linux reentrant version of gethostbyname
 */
/* $begin gethostbyname_r */
#include "csapp.h"
#define TMPLEN 8192

int main(int argc, char **argv)
{
    /* gethostbyame_r variables */
    char *host;               /* input DNS domain name */
    struct hostent hbuf, *hp; /* output DNS host entry */
    char tmp[TMPLEN];         /* temporary scratch buffer */
    int my_h_errno, rc;       /* DNS error code and return code */

    if (argc != 2) { 
	fprintf(stderr, "usage: %s <hostname>\n", argv[0]);
	exit(0);
    }
    host = argv[1];

    rc = gethostbyname_r(host, &hbuf, tmp, TMPLEN, &hp, &my_h_errno);
    if (rc != 0) {
	printf("gethostbyname_r error: %s\n", hstrerror(my_h_errno));
	exit(0);
    }
    printf("official hostname: %s\n", hp->h_name);
    exit(0);
}
/* $end gethostbyname_r */
