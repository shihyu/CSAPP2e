	.file	"calleesave.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl P
	.type	 P,@function
P:
	pushl %ebp
	movl %esp,%ebp
	subl $20,%esp
	pushl %ebx
	movl 8(%ebp),%ebx
	imull %ebx,%ebx
	addl $-12,%esp
	pushl %ebx
	call Q
	addl %ebx,%eax
	movl -24(%ebp),%ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 P,.Lfe1-P
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
