	.file	"len.c"
	.text
.globl len1
	.type	len1, @function
len1:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	$0, %eax
	cmpl	$0, (%edx)
	je	.L7
.L5:
	incl	%eax
	cmpl	$0, (%edx,%eax,4)
	jne	.L5
.L7:
	leave
	ret
	.size	len1, .-len1
.globl len2
	.type	len2, @function
len2:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	$0, %ecx
	movl	(%edx), %eax
	addl	$4, %edx
	testl	%eax, %eax
	je	.L13
.L11:
	incl	%ecx
	movl	(%edx), %eax
	addl	$4, %edx
	testl	%eax, %eax
	jne	.L11
.L13:
	movl	%ecx, %eax
	leave
	ret
	.size	len2, .-len2
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.6 20060404 (Red Hat 3.4.6-4)"
