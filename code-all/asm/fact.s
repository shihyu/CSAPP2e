	.file	"fact.c"
	.text
	.p2align 4,,15
.globl fact_do
	.type	fact_do, @function
fact_do:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L2:
	imull	%edx, %eax
	subl	$1, %edx
	cmpl	$1, %edx
	jg	.L2
	popl	%ebp
	ret
	.size	fact_do, .-fact_do
	.p2align 4,,15
.globl fact_while
	.type	fact_while, @function
fact_while:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	cmpl	$1, %edx
	jle	.L8
	.p2align 4,,7
	.p2align 3
.L11:
	imull	%edx, %eax
	subl	$1, %edx
	cmpl	$1, %edx
	jg	.L11
.L8:
	popl	%ebp
	ret
	.size	fact_while, .-fact_while
	.p2align 4,,15
.globl fact_for
	.type	fact_for, @function
fact_for:
	pushl	%ebp
	movl	$2, %edx
	movl	%esp, %ebp
	movl	$1, %eax
	movl	8(%ebp), %ecx
	cmpl	$1, %ecx
	jle	.L15
	.p2align 4,,7
	.p2align 3
.L18:
	imull	%edx, %eax
	addl	$1, %edx
	cmpl	%edx, %ecx
	jge	.L18
.L15:
	popl	%ebp
	ret
	.size	fact_for, .-fact_for
	.p2align 4,,15
.globl fact_for_while
	.type	fact_for_while, @function
fact_for_while:
	pushl	%ebp
	movl	$2, %edx
	movl	%esp, %ebp
	movl	$1, %eax
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
	.size	fact_for_while, .-fact_for_while
	.p2align 4,,15
.globl fact_for_do
	.type	fact_for_do, @function
fact_for_do:
	pushl	%ebp
	movl	$2, %edx
	movl	%esp, %ebp
	movl	$1, %eax
	movl	8(%ebp), %ecx
	cmpl	$1, %ecx
	jle	.L29
	.p2align 4,,7
	.p2align 3
.L32:
	imull	%edx, %eax
	addl	$1, %edx
	cmpl	%edx, %ecx
	jge	.L32
.L29:
	popl	%ebp
	ret
	.size	fact_for_do, .-fact_for_do
	.p2align 4,,15
.globl fact_do_goto
	.type	fact_do_goto, @function
fact_do_goto:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	.p2align 4,,7
	.p2align 3
.L35:
	imull	%edx, %eax
	subl	$1, %edx
	cmpl	$1, %edx
	jg	.L35
	popl	%ebp
	ret
	.size	fact_do_goto, .-fact_do_goto
	.p2align 4,,15
.globl fact_while_goto
	.type	fact_while_goto, @function
fact_while_goto:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	cmpl	$1, %edx
	jle	.L40
	.p2align 4,,7
	.p2align 3
.L43:
	imull	%edx, %eax
	subl	$1, %edx
	cmpl	$1, %edx
	jg	.L43
.L40:
	popl	%ebp
	ret
	.size	fact_while_goto, .-fact_while_goto
	.p2align 4,,15
.globl fact_for_goto
	.type	fact_for_goto, @function
fact_for_goto:
	pushl	%ebp
	movl	$2, %edx
	movl	%esp, %ebp
	movl	$1, %eax
	movl	8(%ebp), %ecx
	cmpl	$1, %ecx
	jle	.L47
	.p2align 4,,7
	.p2align 3
.L50:
	imull	%edx, %eax
	addl	$1, %edx
	cmpl	%edx, %ecx
	jge	.L50
.L47:
	popl	%ebp
	ret
	.size	fact_for_goto, .-fact_for_goto
	.p2align 4,,15
.globl rfact
	.type	rfact, @function
rfact:
	pushl	%ebp
	movl	$1, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	cmpl	$1, %edx
	jg	.L55
	jmp	.L54
	.p2align 4,,7
	.p2align 3
.L57:
	movl	%ecx, %edx
.L55:
	leal	-1(%edx), %ecx
	imull	%edx, %eax
	cmpl	$1, %ecx
	jg	.L57
.L54:
	popl	%ebp
	.p2align 4,,2
	.p2align 3
	ret
	.size	rfact, .-rfact
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
