
/* 
 * f06-mm-explicit.c 
 *
 * @2006/10/18/ 22:06:45
 * @editor: Donnie H. Kim (dhjkim@cs.cmu)
 * 
 * - contains various memory allocation/management functions
 * 
 * AUTHOR: GIRISH JATTANI (gsj@)
 *
 * 	Seung Hoon Choi <shchoi@andrew.cmu.edu>
 * 	Modified to port to 64-bit fish machines, Fall 2005
 *
 * A simple allocator based on explicit free lists with boundary 
 * tag coalescing. Each block has header and footer of the form:
 * 
 *      31                          3  2  1  0 
 *      -----------------------------------------
 *     | s  s  s  s  .....  . s  s  s  0  0  a/f |
 *      ----------------------------------------- 
 * 
 * where s are the meaningful size bits and a/f is set 
 * if the block is allocated. The list has the following form:
 *
 * begin                                                          end
 * heap                                                           heap  
 *  -----------------------------------------------------------------   
 * |  pad   | hdr(8:a) | ftr(8:a) | zero or more usr blks | hdr(0:a) |
 *  -----------------------------------------------------------------
 *          |       prologue      |                       | epilogue |
 *          |         block       |                       | block    |
 *
 * The allocated prologue and epilogue blocks are overhead that
 * eliminate edge conditions during coalescing.
 *
 * The user blocks when free maintain a doubly linked list of previous
 * next free blocks. When blocks are allocated, these are overwritten,
 * see diagrams below
 *
 * **USER BLOCKS**
 *
 * FREE BLOCK:
 * |<--4 bytes-->|<---16 bytes-->|<---- size - 24  bytes-->|<--4 bytes-->|
 *  ---------------------------------------------------------------------   
 * | hdr(size:f) |  prev | next  |    PAYLOAD (GARBAGE)    | ftr(size:f) |
 *  ---------------------------------------------------------------------
 *          
 * ALLOCATED BLOCK:
 * |<--4 bytes-->|<-------- size-overhead bytes ---------->|<--4 bytes-->|
 *  ---------------------------------------------------------------------   
 * | hdr(size:a) |           PAYLOAD (REAL DATA)           | ftr(size:a) |
 *  ---------------------------------------------------------------------
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include "mm.h"
#include "memlib.h"

#define PUTBUGx
#define DEBUG1x
#define TWEAKx
#define CHECKHEAPx

#ifdef DEBUG1
# define dbg1(...) printf(__VA_ARGS__)
#else
# define dbg1(...)
#endif

#ifdef CHECKHEAP
# define checkheap() _checkheap()
#else
# define checkheap()
#endif

/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

/* This code taken and adapted from CS:APP textbook */
/* Basic constants and macros */
#define HDRSIZE     4       /* header size (bytes) */
#define FTRSIZE     4       /* footer size (bytes) */
#define WSIZE       4       /* word size (bytes) */  
#define DSIZE       8      /* doubleword size (bytes) */
#define CHUNKSIZE  (1<<5)  /* initial heap size (bytes) */
#define OVERHEAD    8       /* overhead of header and footer (bytes) */

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc)  ((unsigned)((size) | (alloc)))

/* Read and write a word at address p */
#define GET(p)       (*(unsigned *)(p))
#define PUT(p, val)  (*(unsigned *)(p) = (unsigned)(val))
#define GET8(p)      (*(unsigned long *)(p))
#define PUT8(p, val) (*(unsigned long *)(p) = (unsigned long)(val))

/* Read the size and allocated fields from address p */
#define GET_SIZE(p)  (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)
#define GET_PREV_ALLOC(p) (GET(p) & 0x2)

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)       ((char *)(bp) - WSIZE)  
#define FTRP(bp)       ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_FREEP(bp) ((char*)(bp))
#define PREV_FREEP(bp) ((char*)(bp) + DSIZE)

/* Given free block pointer bp, compute address of next and previous free blocks */
#define NEXT_FREE_BLKP(bp)  ((char*)GET8((char*)(bp)))
#define PREV_FREE_BLKP(bp)  ((char*)GET8((char*)(bp) + DSIZE))

/* Given free block pointer bp, compute address of next pointer and prev pointer */
#define NEXT_BLKP(bp)  ((char*)(bp) + GET_SIZE((char*)(bp) - WSIZE))
#define PREV_BLKP(bp)  ((char*)(bp) - GET_SIZE((char*)(bp) - DSIZE))

#define MAX(x, y) ((x) > (y)? (x) : (y))  
#define MIN(x, y) ((x) < (y)? (x) : (y))  

/* Given free list number, compute address of head of segregated free lists */
#define FREE_LISTP ((char *)heap_start)
#define GET_FREE_LISTP ((void *)GET8(FREE_LISTP))

/* Give free list number, compute address of tail of segregated free lists */
#define FREE_LISTP_T ((char *)FREE_LISTP + DSIZE)
#define GET_FREE_LISTP_T ((void *)GET8(FREE_LISTP_T))



/* Function prototypes for internal helper functions taken from CS:APP text */
inline void *extend_heap(size_t);
void *find_fit(size_t);
void *coalesce(void *);
void place(void*, size_t);
void mm_checkheap(int);
static void insert_free_block(void* bp);
static void remove_free_block(void* bp);
void print_list(void);

#ifdef CHECKHEAP
static void printblock(void *bp);
static void _checkheap(void);
static void checkblock(void *bp);
#endif
static int verbose;

/* Global variables */
void *heap_listp;         /* Heap pointer */
void *heap_start;					/* free list head */
void *epilogue;    				/* INVARIANT: Always points to epilogue */


/* 
 * mm_init - Initialize the memory manager 
 */
int mm_init(void) 
{
  dbg1("[IN ] : mm_init()\n");

  /* Request memory for the initial empty heap */
  if ((heap_listp = mem_sbrk(2*DSIZE + 4*WSIZE)) == NULL)
    return -1;

  heap_start = heap_listp;

  PUT8(heap_listp, NULL);						// head of the free list
  PUT8(heap_listp + DSIZE, NULL);		// tail of the free list

	heap_listp = heap_listp + 2*DSIZE;

  PUT(heap_listp, 0);                          		/* alignment padding */
  PUT(heap_listp + WSIZE, PACK(OVERHEAD, 1));  		/* prologue header */
  PUT(heap_listp + 2*WSIZE, PACK(OVERHEAD, 1));  	/* prologue footer */ 
  PUT(heap_listp + 3*WSIZE, PACK(0, 1));   				/* epilogue header */

	epilogue = (unsigned *)(heap_listp+3*WSIZE);

  /* Move heap pointer over to footer */
  heap_listp += DSIZE;

  /* Extend the empty heap with a free block of CHUNKSIZE bytes */
  if(extend_heap(CHUNKSIZE/WSIZE) == NULL)
    return -1;

	dbg1("[OUT] : mm_init()\n");

  return 0;

}
/* 
 * mm_malloc - Allocate a block with at least size bytes of payload 
 *             Code taken from CS:APP book and modified
 */
inline int ceil_log_2 (int x) {
    int y = 1, r= 0;

    while (y < x) {
			r++;
			y<<=1;
    }

    return r;
}

void *malloc(size_t size) 
{
  char *bp;          /* Block pointer, points to first byte of payload */    
  unsigned asize;      /* Stores block size adjusted for alignment and overhead */
  unsigned extendsize; /* Amount to extend heap if no fit*/
#ifdef TWEAK
	int k;
#endif
	
  dbg1("[IN ] : malloc() : malloc(%ld)\n",size);
	checkheap();

  /* Ignore spurious requests */
  if (size <= 0)
    return NULL;

#ifdef TWEAK 
	  // [Optimization for binary*.rep trace files]
		// if requested size is larger than 2^4=16 bytes, and close to power of two
		// (when the difference between requested size and its closest larger power of two
		// is smaller than one eighth of closest power of two) round up to power of two
   k = ceil_log_2(size);
   if( k >= 4 && ((1 << k) - size) <= (1 << (k -3))) {
      size = 1 << k;
	 }
	 dbg1("intermediate size : %ld\n", size);
#endif


  /* Adjust block size to include overhead and alignment reqs. */
#ifdef PUTBUG
	 if (size <= 2*DSIZE)
		 asize = 16;
#else
  if (size <= 2*DSIZE)
		asize = 2*DSIZE + OVERHEAD;
#endif
  else
    asize = 2*DSIZE * ((size + (OVERHEAD) + (2*DSIZE-1)) / (2*DSIZE));

  
  /* Find a fit in the free list, place if found */
  if ((bp = find_fit(asize)) != NULL) {
		place(bp, asize);

		dbg1("[OUT] : malloc() - found fit\n");
    return bp;
  }
  
  /* No fit found. Get more memory and place the block. */
  extendsize = MAX(asize, CHUNKSIZE);
  /* Verify heap space available */
  if ((bp = extend_heap(extendsize / WSIZE)) == NULL)
    return NULL;

  place(bp, asize);

  dbg1("[OUT] : malloc() - extended heap\n");
  
  return bp;
} 

/*
 * calloc - Allocate (nmemb * size) bytes, intialize all to zero,
 *          and return a pointer to this initialized memory
 */

void *calloc(size_t nmemb, size_t size)
{
  char *new_mem;
  int i;
  
  dbg1("[IN ] : calloc()\n");
  

  /* Calculate total bytes requested */
  int num_bytes = nmemb * size;

  /* Allocate bytes */
  new_mem = (char *) malloc(num_bytes);

  /* Initialize bytes */
  for (i = 0; i < num_bytes; i++)
    *(new_mem + i) = 0;


	dbg1("[OUT] : calloc()\n");

  return new_mem;

}



void free(void *bp)
{
	unsigned size;
  
  dbg1("[IN ] : free() : free(%p)\n", bp);
    
  if(bp == NULL) {
		dbg1("[OUT] : free() - NULL pointer\n");
		return;
	}

  size = GET_SIZE(HDRP(bp));

  /* If unable to coalesce manually update free list here */
  PUT(HDRP(bp), PACK(size, 0));
  PUT(FTRP(bp), PACK(size, 0));

  coalesce(bp);
  
  dbg1("[OUT] : free() - success\n");
  
}

/* realloc - Reallocates memory according to specific size */
void *realloc(void *ptr, size_t size)
{
  size_t old_size; /* Holds size of ptr's block of memory  */
  char *new_mem;   /* Points to the beginning of the malloc'ed memory */

  dbg1("[IN ] : realloc()\n");

  if(ptr == NULL)
    return malloc(size);
  else {
  	if(size == 0) {
			free(ptr);
	  	return NULL;
		} else {
	  	/* Calculate bytes requested by user previously */
	  	old_size = GET_SIZE(HDRP(ptr)) - OVERHEAD;
	  
	  	/* Don't need to do anything if realloc'ing to smaller size */
	  	if(size <= old_size)
	    	return ptr;

	  	/* Need more memory */
	  	new_mem = (char *) malloc(size);

	  	/* Preserve bytes from previously malloc'ed mem */
	  	memcpy(new_mem, ptr, size);
	  
	  	/* Get rid of old memory */
	  	free(ptr);
	  
	  	dbg1("[OUT] : realloc()\n");
	  
	  	return new_mem;
		}
  }
	dbg1("[OUT] : realloc()\n");
  return NULL;
}




/* The remaining routines are internal helper routines */

/* 
 * extend_heap - Extend heap with free block and return its block pointer
 */
inline void *extend_heap(size_t words) 
{
  char *bp;             /* New block pointer after heap extension */
  unsigned size;          /* Request size for heap memory */

  dbg1("[IN ] : extend_heap()\n");

  /* Allocate an even number of words to maintain alignment */
  size = (words % 2) ? (words+1) * WSIZE : words * WSIZE;
  
  /* Request more memory from heap */
  if ((long)(bp = mem_sbrk(size)) < 0) {
  	dbg1("[OUT] : extend_heap() - mem_sbrk failure\n");
    return NULL;
	}

  /* Write in the header, footer, and new epilogue */
  PUT(HDRP(bp), PACK(size, 0));
  PUT(FTRP(bp), PACK(size, 0));
  PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1));

	epilogue = (unsigned *)HDRP(NEXT_BLKP(bp));  

  dbg1("[OUT] : extend_heap()\n");
 
  return coalesce(bp);
}

/* 
 * place - Place block of asize bytes at start of free block bp 
 *         and split if remainder would be at least minimum block size.
 *         This code taken from CS:APP textbook and adapted
 */
void place(void *bp, size_t asize)
{

  size_t old_size = GET_SIZE(HDRP(bp));

 	dbg1("[IN ] : place()\n");

  /* remove free block from free list */
  remove_free_block(bp);

  /* check to see if block can be split up */
  if (old_size - asize >= OVERHEAD + 2*DSIZE) {

    /* block can be split up */
    asize = (asize + 0x7) & ~0x7;

    PUT(HDRP(bp), PACK(asize, 1));
    PUT(FTRP(bp), PACK(asize, 1));
    PUT(HDRP(NEXT_BLKP(bp)), PACK( old_size - asize, 0));
    PUT(FTRP(NEXT_BLKP(bp)), PACK( old_size - asize, 0));

    insert_free_block((void*)NEXT_BLKP(bp));
  }
  else {
    /* just use entire block */
    PUT(HDRP(bp), PACK(old_size, 1));
    PUT(FTRP(bp), PACK(old_size, 1));
  }

  dbg1("[OUT] : place()\n");
}



/* 
 * find_fit - Find a fit for a block with asize bytes
 *            Adapted from CS:APP text first fit (with an inefficient
 *            an inefficient attempt at best_fit)
 */
void *find_fit(size_t asize)

{
  void* bp;

  /* First fit search */
  for(bp = (void *)GET_FREE_LISTP; bp != NULL; bp = (void *)NEXT_FREE_BLKP(bp)) {
    if(asize <= GET_SIZE(HDRP(bp))){
			return bp;
		}
	}

  return NULL;
}


/*
 * coalesce - boundary tag coalescing. Return ptr to coalesced block
 *            Taken from CS:APP, adapted for explicit list
 */
void *coalesce(void *bp) 
{
	size_t prev_alloc = (GET_ALLOC((void *)HDRP(bp) - FTRSIZE) << 1);
  size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
  size_t size = GET_SIZE(HDRP(bp));

  dbg1("[IN ] : coalesce()\n");  

  switch(prev_alloc | next_alloc) {
  	case 3:      
    	insert_free_block(bp);
			dbg1("[OUT] : coalesce() : neither of the adjacent blocks are free\n");
      return bp;
  	case 2:
      /* next block is free */
      size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
      
      /* remove next block from free list */
      remove_free_block(NEXT_BLKP(bp));
      
      /* update header and footer pointers */
      PUT(HDRP(bp), PACK(size, prev_alloc));
      PUT(FTRP(bp), PACK(size, prev_alloc));
      
      /* insert new merged block into free list */
      insert_free_block(bp);
      
			dbg1("[OUT] : coalesce() : next block is free - merged\n");
      
      return(bp);
  	case 1:
      /* prev block is free */
      size += GET_SIZE(HDRP(PREV_BLKP(bp)));
      
      /* remove this block from free list */
      remove_free_block(PREV_BLKP(bp));
      
      /* update header and footer pointers */
      PUT(FTRP(bp), PACK(size, 0));
      PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
      
      /* insert new merged block into free list */
      insert_free_block(PREV_BLKP(bp));
			dbg1("[OUT] : coalesce() : previous block is free - merged\n");
      return(PREV_BLKP(bp));
  	default:
      /* both previous and next blocks are free */
      size += GET_SIZE(HDRP(PREV_BLKP(bp))) + GET_SIZE(FTRP(NEXT_BLKP(bp)));
      
      /* remove next block from free list */
      remove_free_block(NEXT_BLKP(bp));
      
      /* remove this block from free list */
      remove_free_block(PREV_BLKP(bp));
      
      /* update header and footer pointers */
      PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
      PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
      
      /* insert new merged block into free list */
      insert_free_block(PREV_BLKP(bp));
      
			dbg1("[OUT] : coalesce() : both previous and next block are free - merged\n");

      return(PREV_BLKP(bp));
     
  }
}

/* 
 * insert free block pointed to by bp into segregated free list 
 *
 */
static void insert_free_block(void* bp) {
  
	dbg1("[IN ] : insert_free_block() : insert at tail\n"); 

	if ((GET_FREE_LISTP) != NULL) {
		/* if the list is not empty, insert at tail */
    PUT8(NEXT_FREEP(GET_FREE_LISTP_T), bp);
    PUT8(PREV_FREEP(bp), GET_FREE_LISTP_T);
  }
  else {
    /* if list is empty, just setup pointers */
    PUT8(FREE_LISTP, bp);
    PUT8(PREV_FREEP(bp), NULL);
  }

  /* update tail pointer */
  PUT8(NEXT_FREEP(bp), NULL);
  PUT8(FREE_LISTP_T, bp);
  
  dbg1("[OUT] : insert_free_block()\n"); 
  
	return;
}


/* 
 * remove free block pointed to by bp from segregated free list 
 *
 */
static void remove_free_block(void* bp) {
  
	dbg1("[IN ] : remove_free_block()\n");
 
  /* remove block */
  if ((void*)NEXT_FREE_BLKP(bp) == NULL) {
    /* if next pointer is null */
    if ((void*)PREV_FREE_BLKP(bp) == NULL) {

      /* if prev pointer is null, make list empty */
      PUT8(FREE_LISTP, NULL);
      PUT8(FREE_LISTP_T, NULL);
      
			dbg1("[OUT] : remove_free_block() : list is empty\n");
			return;
    }

     /* remove from tail */
    PUT8(NEXT_FREEP(PREV_FREE_BLKP(bp)), NULL);
    PUT8(FREE_LISTP_T, PREV_FREE_BLKP(bp));
  }
  else if ((void*)PREV_FREE_BLKP(bp) == NULL) {
 
    /* if prev pointer is null, remove from head */
    PUT8(FREE_LISTP, NEXT_FREE_BLKP(bp));
    PUT8(PREV_FREEP(GET_FREE_LISTP), NULL);
  }
  else {
    /* just remove from middle of list */
    PUT8(PREV_FREEP(NEXT_FREE_BLKP(bp)), PREV_FREE_BLKP(bp));
    PUT8(NEXT_FREEP(PREV_FREE_BLKP(bp)), NEXT_FREE_BLKP(bp));
  }
	dbg1("[OUT] : remove_free_block()\n");
}


/*
 * mm_checkheap - Performs various sanity checks on heap
 *                Adapted from CS:APP version to work with explicit lists
 */
 

void mm_checkheap(int v)
{
	verbose = v;
}

#ifdef CHECKHEAP
static void printblock(void *bp)
{
  size_t hsize, halloc, hpalloc, fsize, falloc, fpalloc;

  hsize = GET_SIZE(HDRP(bp));
  halloc = GET_ALLOC(HDRP(bp));
	hpalloc = GET_PREV_ALLOC(HDRP(bp));
  fsize = GET_SIZE(FTRP(bp));
  falloc = GET_ALLOC(FTRP(bp));
	fpalloc = GET_PREV_ALLOC(HDRP(bp));

  if (hsize == 0) {
    printf("%p: EOL (size=0): header: [%ld:%c:%c]\n", bp,
      hsize, (hpalloc ? 'a' : 'f'), (halloc ? 'a' : 'f'));
    return;
  }

	printf("%p: header: [%ld:%c:%c] footer: [%ld:%c:%c]\n", bp,
			hsize, (hpalloc ? 'a' : 'f'), (halloc ? 'a' : 'f'),
			fsize, (fpalloc ? 'a' : 'f'), (falloc ? 'a' : 'f'));
}

static void checkblock(void *bp)
{
  size_t halloc = GET_ALLOC(HDRP(bp));

	/* check if free block is inside heap */
	if ((bp < mem_heap_lo()) || (mem_heap_hi() < bp)) {
		printf("mm_check: block pointer %p outside of heap\n",bp);
		fflush(stdout);
		exit(0);
	}

	/* alignment check */
  if ((size_t)bp % 8) {
    printf("Error: %p is not doubleword aligned\n", bp);
		exit(0);
	}

  /* allocated block does not have footer */
	if (!halloc) {
		if (GET(HDRP(bp)) != GET(FTRP(bp))) {
			printf("Error: header does not match footer\n");
			exit(0);
		}
	}
}


/*
 *  checkheap - Check the heap for consistency
 *  (iterates all the blocks starting from prologue to epilogue)
 *  
 */
void _checkheap(void)
{
	char *bp = heap_listp;
	size_t prev_alloc, curr_alloc;

	dbg1("\n[verbose:%d]\n", verbose);
	dbg1("\n[CHECK HEAP]\n");

	if (verbose) {
		printf("Heap (starting address:%p):\n", heap_listp);
		printf("-prologue-");
		printblock(bp);
	}

		 // checking prologue block (size, allocate bit)
	if ((GET_SIZE(HDRP(heap_listp)) != DSIZE) || !GET_ALLOC(HDRP(heap_listp))) {
		printf("Bad prologue header\n");
		printf("-prologue-");
		printblock(bp);
	}
	checkblock(heap_listp); // alignment, header/footer
	prev_alloc = GET_ALLOC(HDRP(bp));

	// checking allocated/free blocks 
/*
	for (bp = NEXT_BLKP(heap_listp); GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp)) {
		curr_alloc = GET_PREV_ALLOC(HDRP(bp));
		if (verbose)
			printblock(bp);
		if (!prev_alloc != !curr_alloc) {
			// previous block's allocate bit should match current block's prev allocate bit
			printf("prev allocate bit mismatch\n");
			exit(0);
		}
		prev_alloc = GET_ALLOC(HDRP(bp));
		checkblock(bp);
	}
*/
	// checking epilouge block
	if ((GET_SIZE(HDRP(bp)) != 0) || !(GET_ALLOC(HDRP(bp)))){
		printf("Bad epilogue header\n");
		printf("-epilogue-");
		printblock(bp);
	}
	dbg1("[CHECK DONE]\n\n");
}
#endif

#ifdef CHECKLIST
void print_list(void)
{
	void* bp = GET_FREE_LISTP;
	for (;bp != NULL; bp = NEXT_FREE_BLKP(bp))
		printblock(bp);
}
#endif
