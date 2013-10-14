	.file	"loop.c"
	.text
	.p2align 4,,15
.globl fact_dw
	.type	fact_dw, @function
fact_dw:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L2:
	imull	%edx, %eax
	subl	$1, %edx
	testl	%edx, %edx
	jg	.L2
	popl	%ebp
	ret
	.size	fact_dw, .-fact_dw
	.p2align 4,,15
.globl fact_while
	.type	fact_while, @function
fact_while:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	jle	.L8
	.p2align 4,,7
	.p2align 3
.L11:
	imull	%edx, %eax
	subl	$1, %edx
	testl	%edx, %edx
	jg	.L11
.L8:
	popl	%ebp
	ret
	.size	fact_while, .-fact_while
	.p2align 4,,15
.globl fact_for1
	.type	fact_for1, @function
fact_for1:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	jle	.L15
	.p2align 4,,7
	.p2align 3
.L18:
	imull	%edx, %eax
	subl	$1, %edx
	testl	%edx, %edx
	jg	.L18
.L15:
	popl	%ebp
	ret
	.size	fact_for1, .-fact_for1
	.p2align 4,,15
.globl fact_for2
	.type	fact_for2, @function
fact_for2:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	$2, %edx
	movl	8(%ebp), %ecx
	cmpl	$1, %ecx
	jle	.L22
	.p2align 4,,7
	.p2align 3
.L25:
	imull	%edx, %eax
	addl	$1, %edx
	cmpl	%edx, %ecx
	jge	.L25
.L22:
	popl	%ebp
	ret
	.size	fact_for2, .-fact_for2
	.p2align 4,,15
.globl sum_dw
	.type	sum_dw, @function
sum_dw:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L28:
	addl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	jne	.L28
	popl	%ebp
	ret
	.size	sum_dw, .-sum_dw
	.p2align 4,,15
.globl sum_while
	.type	sum_while, @function
sum_while:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L33
	.p2align 4,,7
	.p2align 3
.L36:
	addl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	jne	.L36
.L33:
	popl	%ebp
	ret
	.size	sum_while, .-sum_while
	.p2align 4,,15
.globl sum_for
	.type	sum_for, @function
sum_for:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L40
	.p2align 4,,7
	.p2align 3
.L43:
	addl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	jne	.L43
.L40:
	popl	%ebp
	ret
	.size	sum_for, .-sum_for
	.p2align 4,,15
.globl puzzle
	.type	puzzle, @function
puzzle:
	pushl	%ebp
	movl	%esp, %ebp
	movl	16(%ebp), %ecx
	pushl	%ebx
	movl	$1, %ebx
	movl	12(%ebp), %eax
	andl	8(%ebp), %eax
	sall	%cl, %ebx
	cmpl	$-1, %ebx
	je	.L46
	movl	$-1, %edx
	.p2align 4,,7
	.p2align 3
.L47:
	xorl	%edx, %eax
	shrl	$2, %edx
	cmpl	%ebx, %edx
	ja	.L47
.L46:
	popl	%ebx
	popl	%ebp
	ret
	.size	puzzle, .-puzzle
	.p2align 4,,15
.globl sfact_while
	.type	sfact_while, @function
sfact_while:
	pushl	%ebp
	movl	$1, %edx
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	testl	%eax, %eax
	jle	.L52
	.p2align 4,,7
	.p2align 3
.L55:
	imull	%eax, %edx
	subl	$1, %eax
	testl	%eax, %eax
	jg	.L55
.L52:
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	popl	%ebp
	ret
	.size	sfact_while, .-sfact_while
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
