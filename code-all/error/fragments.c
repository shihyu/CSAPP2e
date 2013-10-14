#include "csapp.h"

void *thread(void *vptr) 
{
    return NULL;
}

void fragments()
{
    int pid, retcode;
    char *name=NULL;
    struct hostent *p;
    pthread_t tid;

/* $begin unixcheck */
    if ((pid = wait(NULL)) < 0) {
        fprintf(stderr, "wait error: %s\n", strerror(errno));
        exit(0);
    } 
/* $end unixcheck */ 

/* $begin posixcheck */
    if ((retcode = pthread_create(&tid, NULL, thread, NULL)) != 0) {
        fprintf(stderr, "pthread_create error: %s\n", strerror(retcode));
        exit(0);    	
    }

/* $end posixcheck */ 

/* $begin dnscheck */
    if ((p = gethostbyname(name)) == NULL) {
        fprintf(stderr, "gethostbyname error: %s\n:", hstrerror(h_errno));
        exit(0);
    }
/* $end dnscheck */ 

    exit(0);
}
