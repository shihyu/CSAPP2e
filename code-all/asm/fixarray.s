	.file	"fixarray.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl sum_element
	.type	 sum_element,@function
sum_element:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%eax
	leal 0(,%eax,4),%ebx
	leal 0(,%ecx,8),%edx
	subl %ecx,%edx
	addl %ebx,%eax
	sall $2,%eax
	movl mat2(%eax,%ecx,4),%eax
	addl mat1(%ebx,%edx,4),%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 sum_element,.Lfe1-sum_element
	.comm	mat1,140,32
	.comm	mat2,140,32
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
