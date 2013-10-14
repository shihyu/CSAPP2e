	.file	"code.c"
	.version	"01.01"
gcc2_compiled.:
.globl accum
.data
	.align 4
	.type	 accum,@object
	.size	 accum,4
accum:
	.long 0
.text
	.align 4
.globl sum
	.type	 sum,@function
sum:
	pushl %ebp
	movl %esp,%ebp
	movl 12(%ebp),%eax
	addl 8(%ebp),%eax
	addl %eax,accum
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 sum,.Lfe1-sum
	.align 4
.globl p
	.type	 p,@function
p:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	movl 8(%ebp),%eax
	addl $-8,%esp
	pushl %eax
	pushl %eax
	call sum
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 p,.Lfe2-p
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
