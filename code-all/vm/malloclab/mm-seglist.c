/* 
 * f06-mm-seglist.c
 * 
 * @2006/10/17 14:38:01  
 * @editor: Donnie H. Kim (dhjkim@cs.cmu)
 *
 * (Many parts from)
 *  Jonathan Hui  - jhui@andrew
 *	Nathan Leung  - ncl@andrew
 *	Seung H. Choi - shchoi@andrew (F05 - partially ported to 64-bits)
 *	
 * Simple Memory Allocator - Based On,
 *
 * 1. Free Block Organization: Segregated Free List
 *
 *   >> Organization Of the initial part of the Heap
 *
 *   FL: Free List, H: Head, T: Tail
 *   -------------------------------------------------------------------------
 *   |FL0 H |FL0 T |FL1 H |FL1 T | .....		|FL8 H |FL8 T |pad|8/1|8/1| ...
 *   -------------------------------------------------------------------------
 *   Store pointers to Head & Tail of each free list(linked list),
 *   in front of the heap. Then next to them, it has padding and prologue blocks.
 * 
 *   >> Nine Classes of Segregated Free List.
 *   -------------------------------------
 *   FreeList 0: 0 ~ 512
 *   FreeList 1:   ~ 1024
 *   FreeList 2:   ~ 2048
 *   FreeList 3:   ~ 4096
 *   FreeList 4:   ~ 8192
 *   FreeList 5:   ~ 16384
 *   FreeList 6:   ~ 32768
 *   FreeList 7:   ~ 65536
 *   FreeList 8: 65537 ~ 
 *   -------------------------------------
 * 
 *   >> Organization of a Free Block
 *                                      a = 1: Allocated
 *    31                  3  2  1  0    a = 0: Free
 *    ------------------------------    a = 1: Prev Block Allocated
 *  H | Block size        |0 |p |a |    p = 0: Prev Block Free
 *    ------------------------------    
 *    | pred (Predecessor)         |  <- Free Block Only
 *    ------------------------------
 *    | succ (Successor)           |  <- Free Block Only
 *    ------------------------------
 *    | Payload                    |
 *    | (allocated block only)     |
 *    ------------------------------
 *    | Padding (Optional)         |
 *    ------------------------------
 *  F | Block size        |0 |p |a |  <- Free Block Only
 *    ------------------------------
 *
 *    => Minimum Block Size Required : Header(4)+Pred(8)+Succ(8)+Footer(4)=24
 *
 *
 * 2. Placement Policy: First Fit
 *
 *   >> Freeing Blocks (inserting free block to a free list)
 *     - Place the new free block at tail of its own class' free list 
 *        (which is a linked list)
 *     
 *   >> First Fit (removing free block)
 *     - Search starting from the beginning of a non-empty free list, find first fit,
 *     if current class or the next class does not contain free block that is big
 *     enough to handle the request, extend heap.
 *     (if requested size is less then 256, extend just as much as you need)
 *     
 *     
 * 3. Splitting: Split free block when second part of it is bigger than minimum
 *               block size
 *
 * 
 * 4. Coalescing: Immediate Bidirectional Coalescing (using footers)
 *
 *
 * 5. (Optional) Other Optimization:
 * 
 * 		>> Adjusting requested Block Size (improves binary*.rep's results)
 *       If requested size is larger than 2^4=16 bytes, and close to power of two 
 *       (if the difference between requested size and its closest larger power of two 
 *       is smaller than one eighth of closest power of two) round up to power of two.
 *       
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

#define DEBUGx
 // turn on printing Function in and outs (DEBUG1)
#define DEBUG1x
 // turn on checkheap (CHECKHEAP) 
#define CHECKHEAPx
#define CHECKLISTx
 // turn on inline 
#define INLINE
 // turn on a little tweak (TWEAK)
#define TWEAK
 // adjust size choice (ASIZE1,ASIZE2,ASIZE3) turn on one at a time
#define ASIZE1
 // putting artificial bug
#define PUTBUGx

// Debugging Tools
#ifdef DEBUG
# define dbg(...) printf(__VA_ARGS__)
#else
# define dbg(...)
#endif
 
// prints function in and outs
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

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~0x7)

#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

#define WSIZE       4      /* word size (bytes) */
#define DSIZE       8      /* doubleword size bytes */
#define DDSIZE			16			
#define CHUNKSIZE  (1<<3)  /* initial heap size (bytes) */
#define OVERHEAD    8      /* overhead of header and footer (bytes) */
#define MINBLKSIZE	20		 // minmum free block size (excluding header)

#define MAX(x, y) ((x) > (y) ? (x) : (y))
#define MIN(x, y) ((x) < (y) ? (x) : (y))

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc)  ((size) | (alloc))

/* Read and write a word at address p */
#define GET(p)       (*(unsigned*)(p))
#define PUT(p, val)  (*(unsigned*)(p) = (unsigned)(val))
#define GET8(p)      (*(unsigned long *)(p))
#define PUT8(p, val) (*(unsigned long*)(p) = (unsigned long)(val))

/* Read the size and allocated fields from address p */
#define GET_SIZE(p)       (GET(p) & ~0x7)
#define GET_ALLOC(p)      (GET(p) & 0x1)
#define GET_PREV_ALLOC(p) (GET(p) & 0x2)

/* Give block ptr bp, cmpute address of its header and footer */
#define HDRP(bp)       ((char*)(bp) - WSIZE)
#define FTRP(bp)       ((char*)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp)  ((char*)(bp) + GET_SIZE((char*)(bp) - WSIZE))
#define PREV_BLKP(bp)  ((char*)(bp) - GET_SIZE((char*)(bp) - DSIZE))

/* Given free block pointer bp, compute address of next pointer and prev pointer */
#define NEXT_FREEP(bp) ((char*)(bp))
#define PREV_FREEP(bp) ((char*)(bp) + DSIZE)
																			
/* Given free block pointer bp, compute address of next and previous free blocks */
#define NEXT_FREE_BLKP(bp)  ((char*)GET8((char*)(bp)))
#define PREV_FREE_BLKP(bp)  ((char*)GET8((char*)(bp) + DSIZE))

/* Given free list number, compute address of head of segregated free lists */
#define FREE_LISTP(x)      ((free_list_ptrs) + ((x) * 2 * DSIZE))
#define GET_FREE_LISTP(x)  ((void*)GET8((free_list_ptrs) + ((x) * 2 * DSIZE)))

/* Give free list number, compute address of tail of segregated free lists */
#define FREE_LISTP_T(x)      ((free_list_ptrs) + ((x) * 2 * DSIZE) + DSIZE)
#define GET_FREE_LISTP_T(x)  ((void*)GET8((free_list_ptrs) + ((x) * 2 * DSIZE) + DSIZE))

/* helper functions */																			
static void place(void * bp, size_t asize);
static void* coalesce(void* bp);
#ifdef INLINE
inline static void* extend_heap(size_t words);
inline static void* find_fit(size_t asize);
inline static void insert_free_block(void* bp);
inline static void remove_free_block(void* bp);
inline static size_t get_list_num(size_t size);
inline static size_t get_nonempty_list_num(size_t size);
#else
static void* extend_heap(size_t words);
static void* find_fit(size_t asize);
static void insert_free_block(void* bp);
static void remove_free_block(void* bp);
static size_t get_list_num(size_t size);
static size_t get_nonempty_list_num(size_t size);
#endif

#ifdef CHECKHEAP
static void printblock(void *bp);
static void _checkheap(void);
static void checkblock(void *bp);
#endif

#ifdef CHECKLIST
void checklist(void);
#endif

/* Block Size (Smallest Class' Maximum block size) */
#define CLASS2

#ifdef CLASS1
#define MAXCLASS 11
#define BLKSIZE 32 
#endif


#ifdef CLASS2
#define MAXCLASS 8
#define BLKSIZE 512
#endif

/* Global variables & initialized flag */
static int mm_initialized = 0;
int realloc_mode = 0;
static void* heap_listp;
static void* free_list_ptrs;				// points to first free list header
unsigned *epilogue;									// points to epilogue block
static int verbose = 0;


/* 
 * mm_init - initialize the malloc package.
 */
int mm_init(void)
{
	int i;
	
	dbg1("[IN ] : mm_init()\n");

	/* create the initial empty heap */
//	if ((heap_listp = mem_sbrk(18*DSIZE + 4 * WSIZE)) == NULL)
	if ((heap_listp = mem_sbrk((MAXCLASS+1)*2*DSIZE + 4 * WSIZE)) == NULL)
		return -1;

	
	/* free_list_ptrs points to starting point of free list pointers */
	free_list_ptrs = heap_listp;
	
	for (i=0; i<= MAXCLASS; i++) {
		PUT8(heap_listp+DSIZE*(i*2), NULL);
		PUT8(heap_listp+DSIZE*(i*2+1), NULL);
	}
	
	/* heap starting point is set right after the free list pointers */
	heap_listp = heap_listp+DSIZE*2*(MAXCLASS+1);
	
#if 0
	/* set up segregated free list pointers */
	PUT8(heap_listp, NULL);           /* free list 0 head */
	PUT8(heap_listp+DSIZE, NULL);     /* free list 0 tail */
	PUT8(heap_listp+DSIZE*2, NULL);   /* free list 1 head */
	PUT8(heap_listp+DSIZE*3, NULL);   /* free list 1 tail */
	PUT8(heap_listp+DSIZE*4, NULL);   /* free list 2 head */
	PUT8(heap_listp+DSIZE*5, NULL);   /* free list 2 tail */
	PUT8(heap_listp+DSIZE*6, NULL);   /* free list 3 head */
	PUT8(heap_listp+DSIZE*7, NULL);   /* free list 3 tail */
	PUT8(heap_listp+DSIZE*8, NULL);   /* free list 4 head */
	PUT8(heap_listp+DSIZE*9, NULL);   /* free list 4 tail */
	PUT8(heap_listp+DSIZE*10, NULL);  /* free list 5 head */
	PUT8(heap_listp+DSIZE*11, NULL);  /* free list 5 tail */
	PUT8(heap_listp+DSIZE*12, NULL);  /* free list 6 head */
	PUT8(heap_listp+DSIZE*13, NULL);  /* free list 6 tail */
	PUT8(heap_listp+DSIZE*14, NULL);  /* free list 7 head */
	PUT8(heap_listp+DSIZE*15, NULL);  /* free list 7 tail */
	PUT8(heap_listp+DSIZE*16, NULL);  /* free list 8 head */
	PUT8(heap_listp+DSIZE*17, NULL);  /* free list 8 tail */
	
	/* free_list_ptrs points to starting point of free list pointers */
	free_list_ptrs = heap_listp;

	/* heap starting point is set right after the free list pointers */
	heap_listp = heap_listp+DSIZE*18;
#endif
	
	PUT(heap_listp, 0);															/* alignment padding */
	PUT(heap_listp+WSIZE, PACK(OVERHEAD, 3));				/* prologue header */
	PUT(heap_listp+2*WSIZE, PACK(OVERHEAD, 3));			/* prologue footer */
	PUT(heap_listp+3*WSIZE, PACK(0, 3));						/* epilogue header */

	epilogue = (unsigned *)(heap_listp+3*WSIZE);		/* update epilogue pointer */

	heap_listp += 2*WSIZE;

	/* extends heap only on demand */

	mm_initialized = 1;
	
	dbg1("[OUT] : mm_init()\n");

	return 0;
}


/*
 * ceil_log_2 - returns x's closest (larger) power of two's log_2
 * (Used to improve some particular trace cases, especially bal*.reps)
 * 
 */
#ifdef INLINE
inline int ceil_log_2 (int x) {
#else
int ceil_log_2 (int x) {
#endif
	int y = 1, r= 0;
	while (y < x) {
		r++;
		y<<=1;
	}
	return r;
}


/* 
 * malloc - allocates a block with requested size
 * (implementation issue: adjust size, extend size)
 * 
 */
void *malloc(size_t size)
{
	size_t asize = 0; 
	size_t extendsize;
	char* bp;
#ifdef TWEAK
	int k;
#endif

	dbg1("[IN ] : malloc() - malloc(%ld)\n", size);
	checkheap();
	
	if (!mm_initialized)
		mm_init();

	/* Ignore spurious requests */
	if (size <= 0)
		return NULL;

#ifdef TWEAK
	/*
	 * [Optimization for binary*.rep trace files]
	 *   if requested size is larger than 2^4=16 bytes, and close to power of two 
	 *   (when the difference between requested size and its closest larger power of two 
	 *   is smaller than one eighth of closest power of two) round up to power of two
	 */
	k = ceil_log_2(size);

	if( k >= 4 && ((1 << k) - size) <= (unsigned)(1 << (k -3))) {
		size = 1 << k;
	}
	dbg1("intermediate size : %ld\n", size);
#endif

#ifdef PUTBUG
	if (size <= MINBLKSIZE) {
		asize = MINBLKSIZE + WSIZE;
	}
	else {
		asize = DSIZE * ((size + DSIZE-1)/DSIZE);
	}
#endif
	
#ifdef ASIZE1	
	/* Adjust block size to include overhead and alignment reqs */
	/* Block should at least have space for  Header, Footer, Pred, Succ Pointers */

	if (size <= MINBLKSIZE) {
		asize = MINBLKSIZE + WSIZE;
	}
	else {
		asize = DSIZE * ((size + WSIZE + DSIZE-1)/DSIZE);
	}
#endif	
#ifdef ASIZE2
	if (size <= 2*DSIZE+OVERHEAD) {
		asize = 2*DSIZE+OVERHEAD+OVERHEAD;
	}
	else {
		/* round up to the nearest order of 16 */
		asize = 2*DSIZE * ((size + (OVERHEAD - WSIZE) + 2*DSIZE-1)/(2*DSIZE));
	}
#endif
#ifdef ASIZE3
	if (size <= DDSIZE){
		asize = DDSIZE + DSIZE;
	}
	else {
		asize = DDSIZE*((size + (DSIZE - WSIZE) + (DDSIZE-1)) / DDSIZE);
	}
#endif
	
	dbg("malloc: adjusted size %ld, class %ld\n", asize, get_list_num(asize));
	
	/* Search the free list for a fit */
	if ((bp = find_fit(asize)) != NULL) {
		place(bp, asize);
		dbg1("[OUT] : malloc() - found fit\n");
		
		return bp;
	}

	/* No fit found. Get more memory and place the block */
	extendsize = MAX(asize, CHUNKSIZE);
	if((bp = extend_heap(extendsize/WSIZE)) == NULL)
		return NULL;

	place(bp, asize);
	dbg1("[OUT] : malloc() - found fit failed, extended the heap\n");

	return bp;
}


/*
 * free - Frees the block and coalesces 
 * (implementation issue: coalescing) 
 *
 */
void free(void *bp)
{
	size_t size;
	size_t prev_alloc;
	size_t temp_value;

	dbg1("[IN ] : free()\n");
	
	if (!bp) {
		dbg1("[OUT] : free() - NULL pointer\n");	
		return;
	}
	
	if (!mm_initialized)
		mm_init();

	size = GET_SIZE(HDRP(bp));
	prev_alloc = GET_PREV_ALLOC(HDRP(bp));

	/* update header and footer pointers of this block */
	PUT(HDRP(bp), PACK(size, prev_alloc));
	PUT(FTRP(bp), PACK(size, prev_alloc));

	/* tell next block that this block is now free */
	temp_value = GET(HDRP(NEXT_BLKP(bp))) & ~0x2;
	PUT(HDRP(NEXT_BLKP(bp)), temp_value);

	coalesce(bp);

	dbg1("[OUT] : free()\n");
}


/* 
 * coalesce - boundary tag coalescing. return ptr to coalesced block
 *
 */
static void* coalesce(void* bp) {

	size_t prev_alloc = GET_PREV_ALLOC(HDRP(bp));
	size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
	size_t size = GET_SIZE(HDRP(bp));

	dbg1("[IN ] : coalesce()\n");

	switch (prev_alloc | next_alloc)
	{
		case 3:
			/* neither of the adjacent blocks are free */
			insert_free_block(bp);
			dbg1("[OUT] : coalesce() : neither of the adjacent blocks are free.\n");
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
			dbg1("[OUT] : coalesce() : next block is free - merged \n");
			return(bp);
		case 1:
			/* prev block is free */
			size += GET_SIZE(HDRP(PREV_BLKP(bp)));

			/* remove this block from free list */
			remove_free_block(PREV_BLKP(bp));

			/* update header and footer pointers */
			prev_alloc = GET_PREV_ALLOC(HDRP(PREV_BLKP(bp)));
			PUT(FTRP(bp), PACK(size, prev_alloc));
			PUT(HDRP(PREV_BLKP(bp)), PACK(size, prev_alloc));

			/* insert new merged block into free list */
			insert_free_block(PREV_BLKP(bp));
			dbg1("[OUT] : coalesce() : previous block is free - merged \n");
			return(PREV_BLKP(bp));
		default:
			/* both previous and next blocks are free */
			size += GET_SIZE(HDRP(PREV_BLKP(bp))) + GET_SIZE(FTRP(NEXT_BLKP(bp)));

			/* remove next block from free list */
			remove_free_block(NEXT_BLKP(bp));

			/* remove this block from free list */
			remove_free_block(PREV_BLKP(bp));

			/* update header and footer pointers */
			prev_alloc = GET_PREV_ALLOC(HDRP(PREV_BLKP(bp)));
			PUT(HDRP(PREV_BLKP(bp)), PACK(size, prev_alloc));
			PUT(FTRP(NEXT_BLKP(bp)), PACK(size, prev_alloc));

			/* insert new merged block into free list */
			insert_free_block(PREV_BLKP(bp));

			dbg1("[OUT] : coalesce() : both previous and next blocks are free - merged \n");
			
			return(PREV_BLKP(bp));
	}
}

/*
 * realloc - sees if block can simply be grown or shrunk, 
 *           otherwise, use mm_malloc and mm_free.
 */
void *realloc(void *ptr, size_t size)
{
	size_t old_size;
	char* new_mem;

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

			return new_mem;
		}
	}
	return NULL;
}

/*
 * calloc - naive implementation of calloc
 * 
 */
void *calloc(size_t nmemb, size_t size){
	void *ptr;
	if (mm_initialized == 0){
		mm_init();
	}
	ptr = malloc(nmemb*size);
	bzero(ptr, nmemb*size);

	return ptr;
}



/* The remaining routines are internal helper routines */

/*
 * extend_heap - Extend heap with free block and return its block pointer
 */
/* $begin mmextendheap */
#ifdef INLINE
inline static void* extend_heap(size_t words) {
#else
static void* extend_heap(size_t words) {
#endif
	char *bp;
	size_t size;
	size_t prev_alloc;
	
	dbg1("[IN ] : extend_heap()\n");

	/* Allocate an even number of words to maintain alignment */
	size = (words % 2) ? (words+1) * WSIZE : words * WSIZE;

	if ((long)(bp = mem_sbrk(size)) < 0)
		return NULL;

	/* remember if previous block is allocated */
	prev_alloc = GET_PREV_ALLOC(HDRP(bp));

	/* Initialize free block header/footer and the epliogue header */
	PUT(HDRP(bp), PACK(size, prev_alloc));    /* free block header */
	PUT(FTRP(bp), PACK(size, prev_alloc));    /* free block footer */
	PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1));     /* new epilogue header */
	epilogue = (unsigned *)HDRP(NEXT_BLKP(bp));

	dbg1("[OUT] : extend_heap()\n");

	/* Coalesce if the previous block was free */
	return coalesce(bp);
}
/* $end mmextendheap */


/* 
 * find_fit - find a fit for a block with aszie bytes
 *                           (combiniation of segregated free lists and first fit)
 * 
 * 1. get the smallest non-empty class that can handle requested asize
 * 2. search through the class, find first fit
 * 3. if all free block in the current class is smaller than the requested asize, 
 *    search next class
 * 4. if next class doesn't exist, or next class is empty, extend heap
 * 
 */
#ifdef INLINE
inline static void* find_fit(size_t asize) {
#else
static void* find_fit(size_t asize) {
#endif
	int free_list_num = 0;
	void *bp = NULL;

	free_list_num = get_nonempty_list_num(asize);

	dbg1("[IN ] : find_fit()\n");

	dbg1(" class? [%d]\n", free_list_num);
	
	/* find block that fits starting at appropriate free list */
	for(bp = GET_FREE_LISTP(free_list_num); bp != NULL; bp = NEXT_FREE_BLKP(bp)) {
		if(GET_SIZE(HDRP(bp)) >= asize) {
			dbg1("[OUT] : find_fit() : found block in the first non-empty list\n");
			return bp;
		}
	}

	/* if no class bigger than current class exists */
	if(free_list_num >= MAXCLASS) {
		dbg1("[OUT] : find_fit() : failed to find fit, should extend the heap\n");	
		return NULL;
	}

	/* return next class' first free block (if its empty it will contain NULL) */
	bp = GET_FREE_LISTP(free_list_num+1);

	checkheap();
	dbg1("[OUT] : find_fit() : failed to find fit, try next free list\n");
	return bp;
}

/*
 * place - Place block of asize bytes at start of free block bp
 *         and split if remainder would be at least minimum block size
 *         
 *  given a free block, removes free block from list and updates all relevant pointers 
 *
 */
static void place(void* bp, size_t asize) {

	size_t old_size = GET_SIZE(HDRP(bp));
	size_t prev_alloc = GET_PREV_ALLOC(HDRP(bp));
	size_t temp_value;

	dbg1("[IN ] : place()\n");

	/* remove free block from free list */
	remove_free_block(bp);

	/* check to see if block can be split up */

	dbg1("old_size=%ld, asize=%ld, compare=%d\n", old_size, asize, (int) OVERHEAD+2*DSIZE);
	
	if (old_size - asize >= OVERHEAD + 2*DSIZE) {

		/* block can be split up */
		PUT(HDRP(bp), PACK(asize, prev_alloc | 0x1));
		PUT(HDRP(NEXT_BLKP(bp)), PACK( old_size - asize, 0x2 ));
		PUT(FTRP(NEXT_BLKP(bp)), PACK( old_size - asize, 0x2 ));

		insert_free_block(NEXT_BLKP(bp));
	}
	else {
		/* just use entire block */
		PUT(HDRP(bp), PACK(old_size, prev_alloc | 0x1));
		temp_value = GET(HDRP(NEXT_BLKP(bp))) | 0x2;
		PUT(HDRP(NEXT_BLKP(bp)), temp_value);
	}

	dbg1("[OUT] : place()\n");

}


/* 
 * insert free block pointed to by bp into segregated free list 
 * 
 */
#ifdef INLINE
inline static void insert_free_block(void* bp) {
#else
static void insert_free_block(void* bp) {
#endif
	/* get specific segregated free list */
	size_t free_list_num = get_list_num(GET_SIZE(HDRP(bp)));

	dbg1("[IN ] : insert_free_block() : insert at tail\n");

	if (GET_FREE_LISTP(free_list_num) != NULL) {
		/* if the list is not empty, insert at tail */
		PUT8(NEXT_FREEP(GET_FREE_LISTP_T(free_list_num)), bp);
		PUT8(PREV_FREEP(bp), GET_FREE_LISTP_T(free_list_num));
	}
	else {
		/* if list is empty, just setup pointers */
		PUT8(FREE_LISTP(free_list_num), bp);
		PUT8(PREV_FREEP(bp), NULL);
	}

	/* update tail pointer */
	PUT8(NEXT_FREEP(bp), NULL);
	PUT8(FREE_LISTP_T(free_list_num), bp);

	dbg1("[OUT] : insert_free_block()\n");

	return;
}


/* 
 * remove free block pointed to by bp from segregated free list 
 *
 */
#ifdef INLINE
inline static void remove_free_block(void* bp) {
#else
static void remove_free_block(void* bp) {
#endif
	/* get specific segregated free list */
	size_t free_list_num = get_list_num(GET_SIZE(HDRP(bp)));

	dbg1("[IN ] : remove_free_block()\n");

	/* remove block */
	if ((void*)NEXT_FREE_BLKP(bp) == NULL) {
		/* if next pointer is null */
		if ((void*)PREV_FREE_BLKP(bp) == NULL) {

			/* if prev pointer is null, make list empty */
			PUT8(FREE_LISTP(free_list_num), NULL);
			PUT8(FREE_LISTP_T(free_list_num), NULL);

			dbg1("[OUT] : remove_free_block() : list is empty\n");
			return;
		}
		/* remove from tail */
		PUT8(NEXT_FREEP(PREV_FREE_BLKP(bp)), NULL);
		PUT8(FREE_LISTP_T(free_list_num), PREV_FREE_BLKP(bp));
	}
	else if ((void*)PREV_FREE_BLKP(bp) == NULL) {
		/* if prev pointer is null, remove from head */
		PUT8(FREE_LISTP(free_list_num), NEXT_FREE_BLKP(bp));
		PUT8(PREV_FREEP(GET_FREE_LISTP(free_list_num)), NULL);
	}
	else {
		/* just remove from middle of list */
		PUT8(PREV_FREEP(NEXT_FREE_BLKP(bp)), PREV_FREE_BLKP(bp));
		PUT8(NEXT_FREEP(PREV_FREE_BLKP(bp)), NEXT_FREE_BLKP(bp));
	}
	dbg1("[OUT] : remove_free_block()\n");
}


/* 
 * get_nonempty_list_num()
 * 
 * based on size, get the number of the segregated free list to use 
 * basically uses generic binary search 
 *
 */

#ifdef CLASS2
#ifdef INLINE
inline static size_t get_nonempty_list_num(size_t size) {
#else
static size_t get_nonempty_list_num(size_t size) {
#endif
	dbg1("[IN ] : get_nonempty_list_num() - class2\n");
	
	if(size <= BLKSIZE && GET_FREE_LISTP(0) != NULL) return 0;
	if(size <= (BLKSIZE << 1) && GET_FREE_LISTP(1) != NULL) return 1;
	if(size <= (BLKSIZE << 2) && GET_FREE_LISTP(2) != NULL) return 2;
	if(size <= (BLKSIZE << 3) && GET_FREE_LISTP(3) != NULL) return 3;
	if(size <= (BLKSIZE << 4) && GET_FREE_LISTP(4) != NULL) return 4;
	if(size <= (BLKSIZE << 5) && GET_FREE_LISTP(5) != NULL) return 5;
	if(size <= (BLKSIZE << 6) && GET_FREE_LISTP(6) != NULL) return 6;
	if(size <= (BLKSIZE << 7) && GET_FREE_LISTP(7) != NULL) return 7;
	return 8;
}
#ifdef INLINE
inline static size_t get_list_num(size_t size) {
#else
static size_t get_list_num(size_t size) {
#endif
	if(size <= BLKSIZE) return 0;
	if(size <= (BLKSIZE << 1)) return 1;
	if(size <= (BLKSIZE << 2)) return 2;
	if(size <= (BLKSIZE << 3)) return 3;
	if(size <= (BLKSIZE << 4)) return 4;
	if(size <= (BLKSIZE << 5)) return 5;
	if(size <= (BLKSIZE << 6)) return 6;
	if(size <= (BLKSIZE << 7)) return 7;
	return 8;
}
#endif

#ifdef CLASS1
#ifdef INLINE
inline static size_t get_nonempty_list_num(size_t size) {
#else
static size_t get_nonempty_list_num(size_t size) {
#endif
	
	dbg1("[IN ] : get_nonempty_list_num():request[%ld] - class1\n", size);
	
	if(size <= BLKSIZE && GET_FREE_LISTP(0) != NULL) return 0;
	if((size <= 40) && GET_FREE_LISTP(1) != NULL) return 1;
	if((size <= 48) && GET_FREE_LISTP(2) != NULL) return 2;
	if((size <= 56) && GET_FREE_LISTP(3) != NULL) return 3;
	if(size <= (BLKSIZE << 1) && GET_FREE_LISTP(4) != NULL) return 4;
	if(size <= (BLKSIZE << 2) && GET_FREE_LISTP(5) != NULL) return 5;
	if(size <= (BLKSIZE << 3) && GET_FREE_LISTP(6) != NULL) return 6;
	if(size <= (BLKSIZE << 4) && GET_FREE_LISTP(7) != NULL) return 7;
	if(size <= (BLKSIZE << 5) && GET_FREE_LISTP(8) != NULL) return 8;
	if(size <= (BLKSIZE << 6) && GET_FREE_LISTP(9) != NULL) return 9;
	if(size <= (BLKSIZE << 7) && GET_FREE_LISTP(10) != NULL) return 10;
	return 11;
}
#ifdef INLINE
inline static size_t get_list_num(size_t size) {
#else
static size_t get_list_num(size_t size) {
#endif
	if(size <= BLKSIZE) return 0;
	if(size <= 40) return 1;
	if(size <= 48) return 2;
	if(size <= 56) return 3;
	if(size <= (BLKSIZE << 1)) return 4;
	if(size <= (BLKSIZE << 2)) return 5;
	if(size <= (BLKSIZE << 3)) return 6;
	if(size <= (BLKSIZE << 4)) return 7;
	if(size <= (BLKSIZE << 5)) return 8;
	if(size <= (BLKSIZE << 6)) return 9;
	if(size <= (BLKSIZE << 7)) return 10;
	return 11;
}
#endif 

/* debugging routines */

/*
 * mm_checkheap - called by mdriver for each operation in the trace file
 * 
 */
void mm_checkheap(int v) {
	  verbose = v;
		checkheap();
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

	// check if free block is inside heap
	if ((bp < mem_heap_lo()) || (mem_heap_hi() < bp)) {
		printf("mm_check: block pointer %p outside of heap\n",bp);
		fflush(stdout);
		exit(0);
	}
		
	// alignment check
	if ((size_t)bp % 8) {
		printf("Error: %p is not doubleword aligned\n", bp);
		exit(0);
	}
	
	// allocated block does not have footer	
	if (!halloc) {
		if (GET(HDRP(bp)) != GET(FTRP(bp))) {
			printf("Error: header does not match footer\n");
			exit(0);
		}
	}
}


/*
 * checkheap - Check the heap for consistency
 * (iterates all the blocks starting from prologue to epilogue) 
 * 
 */
void _checkheap(void)
{
	char *bp = heap_listp;
	size_t prev_alloc, curr_alloc;
	

	dbg1("\n[CHECK HEAP]\n");
	dbg1("\n[verbose=%d]\n", verbose);

	if (verbose) {
		printf("Heap (starting address:%p):\n", heap_listp);
		printf("-prologue-");
		printblock(bp);
	}

	/* checking prologue block (size, allocate bit) */
	if ((GET_SIZE(HDRP(heap_listp)) != DSIZE) || !GET_ALLOC(HDRP(heap_listp))) {
		printf("Bad prologue header\n");
		printf("-prologue-");
		printblock(bp);
	}
	checkblock(heap_listp);             /* alignment, header/footer */
	prev_alloc = GET_ALLOC(HDRP(bp));
	
	/* checking allocated/free blocks */
	for (bp = NEXT_BLKP(heap_listp); GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp)) {
		curr_alloc = GET_PREV_ALLOC(HDRP(bp));
		if (verbose)
			printblock(bp);
		if (!prev_alloc != !curr_alloc) {
			/* previous block's allocate bit should match current block's prev allocate bit */
			printf("prev allocate bit mismatch\n");
			printblock(bp);
			exit(0);
		}
		prev_alloc = GET_ALLOC(HDRP(bp));
		checkblock(bp);
	}
	printf("done\n");

	/* checking epilouge block */
	if ((GET_SIZE(HDRP(bp)) != 0) || !(GET_ALLOC(HDRP(bp)))){
		printf("Bad epilogue header\n");
		printf("-epilogue-");
		printblock(bp);
	}

	checklist();
	
	dbg1("[CHECK DONE]\n\n");
}

#endif

#ifdef CHECKLIST
void printlist(int i) {

		void *bp = GET_FREE_LISTP(i);
		
		printf("[freelist(%d)] printing...\n", i);
		for(;bp != NULL; bp = NEXT_FREE_BLKP(bp))
			printblock(bp);
		printf("[freelist(%d)] end of list\n", i);

}

void checklist(void) 
{
	void* bp = heap_listp;
	void* prev_ptr;
	//int  prev_alloc = 1;
	int i;

	dbg1("[IN ] : checklist\n");
	
  /* go through each segregated free list */
	for ( i = 0; i <= MAXCLASS; i++ ) {
		if (verbose)
			printlist(i);
		
		bp = GET_FREE_LISTP(i);
		prev_ptr = NULL;
		while( bp != NULL) {
			/* see if pointer is within heap */
			if ((bp < mem_heap_lo()) || (mem_heap_hi() < bp)) {
				printf("mm_check: free block pointer %p outside of heap\n",bp);
				fflush(stdout);
				exit(0);
			}
			/* make sure block is truly free */
			if (GET_ALLOC(HDRP(bp))) {
				printf("mm_check: free block list %d has allocated block\n", i);
				fflush(stdout);
				exit(0);
			}
			/* make sure block is not smaller than min block */
			if (GET_SIZE(HDRP(bp)) < OVERHEAD + 2*DSIZE) {
				printf("mm_check: block too small in list %d with block at %p\n", i, bp);
				printf("mm_check: %x\n", GET_SIZE(HDRP(bp)));
				fflush(stdout);
				exit(0);
			}
			/* make sure previous pointer is correct */
			if (PREV_FREE_BLKP(bp) != prev_ptr) {
				printf("mm_check: previous block ptr in list %d does not point to previous block\n", i);
				fflush(stdout);
				exit(0);
			}
			/* go to next free block */
			prev_ptr = bp;
			bp = (void*)NEXT_FREE_BLKP(bp);
		}
	}

	dbg1("[OUT] : checklist\n");
	return;
}
#endif
