	.file	"branch.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl silly
	.type	 silly,@function
silly:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	testl %edx,%edx
	jle .L4
	.p2align 4,,7
.L5:
	movl %edx,%eax
	sarl $1,%eax
	subl %eax,%edx
	testl %edx,%edx
	jg .L5
.L4:
	movl %edx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 silly,.Lfe1-silly
	.align 4
.globl main
	.type	 main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	addl $-12,%esp
	pushl $2
	call silly
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 main,.Lfe2-main
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
