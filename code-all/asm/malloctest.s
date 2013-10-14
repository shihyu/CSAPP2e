	.file	"malloctest.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Allocated %d.  Address = %p\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	subl	$24, %esp
	movl	$1, %ebx
	movl	$0, %edi
.L4:
	leal	0(,%ebx,4), %esi
	movl	%esi, (%esp)
	call	malloc
	testl	%ebx, %ebx
	jle	.L2
	movl	%edi, %edx
.L3:
	pushl	%edx
	fildl	(%esp)
	leal	4(%esp), %esp
	fmull	.LC0
	fstps	(%eax,%edx,4)
	incl	%edx
	cmpl	%ebx, %edx
	jl	.L3
.L2:
	movl	%eax, 12(%esp)
	movl	%esi, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	incl	%ebx
	cmpl	$10, %ebx
	jne	.L4
	movl	$0, %eax
	addl	$24, %esp
	popl	%ecx
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1717986918
	.long	1074423398
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
