	.file	"frame.c"
	.version	"01.01"
gcc2_compiled.:
.section	.rodata
.LC0:
	.string	"%x %x"
.text
	.align 4
.globl proc
	.type	 proc,@function
proc:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	addl $-4,%esp
	leal -4(%ebp),%eax
	pushl %eax
	leal -8(%ebp),%eax
	pushl %eax
	pushl $.LC0
	call scanf
	movl -8(%ebp),%eax
	movl -4(%ebp),%edx
	subl %eax,%edx
	movl %edx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 proc,.Lfe1-proc
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
