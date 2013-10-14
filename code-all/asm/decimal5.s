	.file	"decimal5.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl decimal5
	.type	 decimal5,@function
decimal5:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ebx
	xorl %eax,%eax
	xorl %ecx,%ecx
	.p2align 4,,7
.L6:
	leal (%eax,%eax,4),%edx
	movl (%ebx,%ecx,4),%eax
	leal (%eax,%edx,2),%eax
	incl %ecx
	cmpl $4,%ecx
	jle .L6
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 decimal5,.Lfe1-decimal5
	.align 4
.globl decimal5_opt
	.type	 decimal5_opt,@function
decimal5_opt:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ecx
	xorl %eax,%eax
	leal 16(%ecx),%ebx
	.p2align 4,,7
.L12:
	leal (%eax,%eax,4),%edx
	movl (%ecx),%eax
	leal (%eax,%edx,2),%eax
	addl $4,%ecx
	cmpl %ebx,%ecx
	jbe .L12
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 decimal5_opt,.Lfe2-decimal5_opt
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
