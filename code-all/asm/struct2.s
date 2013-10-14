	.file	"struct2.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl sp_init
	.type	 sp_init,@function
sp_init:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl %ebp,%esp
	movl 8(%eax),%edx
	movl %edx,4(%eax)
	leal 4(%eax),%edx
	movl %edx,(%eax)
	movl %eax,12(%eax)
	popl %ebp
	ret
.Lfe1:
	.size	 sp_init,.Lfe1-sp_init
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
