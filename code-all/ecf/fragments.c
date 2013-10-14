#include "csapp.h"

void fragments()
{
    int pid;

/* $begin errorcheck */    
    if ((pid = fork()) < 0) {
	fprintf(stderr, "fork error: %s\n", strerror(errno));
	exit(0);
    }
/* $end errorcheck */    

/* $begin unixerroruse */
    if ((pid = fork()) < 0)
	unix_error("fork error");
/* $end unixerroruse */

/* $begin forkwrapperuse */    
    pid = Fork();
/* $end forkwrapperuse */    

}

