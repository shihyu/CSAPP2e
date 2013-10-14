	.file	"compiler-eg.c"
	.text
.globl sum_abs
	.type	sum_abs,@function
sum_abs:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	movl	8(%ebp), %ecx
	movl	12(%ebp), %eax
	pushl	%ebx
	leal	(%ecx,%eax,4), %esi
	xorl	%ebx, %ebx
	cmpl	%esi, %ecx
	jae	.L8
.L6:
	movl	(%ecx), %eax
	addl	$4, %ecx
	movl	%eax, %edx
	negl	%edx
	cmpl	$-1, %eax
	cmovle	%edx, %eax
	addl	%eax, %ebx
	cmpl	%esi, %ecx
	jb	.L6
.L8:
	movl	%ebx, %eax
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.Lfe1:
	.size	sum_abs,.Lfe1-sum_abs
.globl find_max
	.type	find_max,@function
find_max:
	pushl	%ebp
	xorl	%edx, %edx
	movl	$-2147483648, %ecx
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %esi
	movl	12(%ebp), %ebx
	cmpl	%ebx, %edx
	jge	.L17
.L15:
	movl	(%esi,%edx,4), %eax
	cmpl	%eax, %ecx
	cmovl	%eax, %ecx
	addl	$1, %edx
	cmpl	%ebx, %edx
	jl	.L15
.L17:
	popl	%ebx
	movl	%ecx, %eax
	popl	%esi
	popl	%ebp
	ret
.Lfe2:
	.size	find_max,.Lfe2-find_max
.globl find_maxp
	.type	find_maxp,@function
find_maxp:
	pushl	%ebp
	movl	$-2147483648, %ecx
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax,4), %ebx
	cmpl	%ebx, %edx
	jae	.L25
.L23:
	movl	(%edx), %eax
	addl	$4, %edx
	cmpl	%eax, %ecx
	cmovl	%eax, %ecx
	cmpl	%ebx, %edx
	jb	.L23
.L25:
	popl	%ebx
	movl	%ecx, %eax
	popl	%ebp
	ret
.Lfe3:
	.size	find_maxp,.Lfe3-find_maxp
.globl find_maxl
	.type	find_maxl,@function
find_maxl:
	pushl	%ebp
	movl	$-2147483648, %ecx
	movl	%esp, %ebp
	pushl	%ebx
	movl	12(%ebp), %edx
	movl	8(%ebp), %ebx
	testl	%edx, %edx
	je	.L33
.L31:
	subl	$1, %edx
	movl	(%ebx,%edx,4), %eax
	cmpl	%eax, %ecx
	cmovl	%eax, %ecx
	testl	%edx, %edx
	jne	.L31
.L33:
	popl	%ebx
	movl	%ecx, %eax
	popl	%ebp
	ret
.Lfe4:
	.size	find_maxl,.Lfe4-find_maxl
.globl raise_pwr2
	.type	raise_pwr2,@function
raise_pwr2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	$1, %ebx
	movl	12(%ebp), %edx
	movl	8(%ebp), %ecx
	testl	%edx, %edx
	je	.L40
.L38:
	movl	%edx, %eax
	andl	$1, %eax
	negl	%eax
	andl	%ecx, %eax
	addl	%ecx, %ecx
	imull	%eax, %ebx
	shrl	$1, %edx
	jne	.L38
.L40:
	movl	%ebx, %eax
	popl	%ebx
	popl	%ebp
	ret
.Lfe5:
	.size	raise_pwr2,.Lfe5-raise_pwr2
	.ident	"GCC: (GNU) 3.2.2 20030222 (Red Hat Linux 3.2.2-5)"
