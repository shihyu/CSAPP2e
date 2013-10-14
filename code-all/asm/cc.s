	.file	"cc.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl lt
	.type	 lt,@function
lt:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	movl %edx,x
	movl %eax,y
	cmpl %eax,%edx
	setl %al
	movzbl %al,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 lt,.Lfe1-lt
	.comm	x,4,4
	.comm	y,4,4
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
