cread:
	pushl	%ebp
	movl	%esp, %ebp
	movl 	8(%ebp), %edx
	movl	$0, %eax
	testl	%edx, %edx
	cmovne	(%edx), %eax
	popl	%ebp
	ret

