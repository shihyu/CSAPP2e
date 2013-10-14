	.file	"hp-sort.c"
	.text
	.p2align 4,,15
.globl swap
	.type	swap, @function
swap:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	(%edx,%eax,4), %ebx
	movl	4(%edx,%eax,4), %ecx
	movl	%ebx, 4(%edx,%eax,4)
	movl	%ecx, (%edx,%eax,4)
	popl	%ebx
	leave
	ret
	.size	swap, .-swap
	.p2align 4,,15
.globl sort
	.type	sort, @function
sort:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	xorl	%edi, %edi
	pushl	%esi
	pushl	%ebx
	subl	$8, %esp
	cmpl	12(%ebp), %edi
	movl	8(%ebp), %esi
	jge	.L12
	.p2align 4,,7
.L18:
	movl	%edi, %ebx
	decl	%ebx
	js	.L7
	.p2align 4,,7
.L15:
	movl	4(%esi,%ebx,4), %eax
	cmpl	%eax, (%esi,%ebx,4)
	jle	.L7
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	swap
	decl	%ebx
	jns	.L15
	.p2align 4,,7
.L7:
	incl	%edi
	cmpl	12(%ebp), %edi
	jl	.L18
.L12:
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	.p2align 4,,1
	ret
	.size	sort, .-sort
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.2 20041017 (Red Hat 3.4.2-6.fc3)"
