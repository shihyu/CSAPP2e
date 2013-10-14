	.file	"arith.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl arith
	.type	 arith,@function
arith:
	pushl %ebp
	movl %esp,%ebp
	movl 12(%ebp),%eax
	movl 16(%ebp),%edx
	addl 8(%ebp),%eax
	leal (%edx,%edx,2),%edx
	sall $4,%edx
	andl $65535,%eax
	imull %eax,%edx
	movl %edx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 arith,.Lfe1-arith
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
