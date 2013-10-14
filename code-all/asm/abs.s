	.file	"abs.c"
	.text
	.p2align 4,,15
.globl absdiff
	.type	absdiff, @function
absdiff:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jl	.L6
	subl	%eax, %edx
	movl	%edx, %eax
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L6:
	subl	%edx, %eax
	popl	%ebp
	ret
	.size	absdiff, .-absdiff
	.p2align 4,,15
.globl gotodiff
	.type	gotodiff, @function
gotodiff:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jl	.L11
.L8:
.L9:
	subl	%eax, %edx
	movl	%edx, %eax
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L11:
	subl	%edx, %eax
	popl	%ebp
	ret
	.size	gotodiff, .-gotodiff
	.p2align 4,,15
.globl absdiff2
	.type	absdiff2, @function
absdiff2:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jl	.L16
	subl	%eax, %edx
	movl	%edx, %eax
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L16:
	subl	%edx, %eax
	popl	%ebp
	ret
	.size	absdiff2, .-absdiff2
	.p2align 4,,15
.globl cmovdiff
	.type	cmovdiff, @function
cmovdiff:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%edx, %eax
	jle	.L21
	subl	%edx, %eax
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L21:
	subl	%eax, %edx
	movl	%edx, %eax
	popl	%ebp
	ret
	.size	cmovdiff, .-cmovdiff
	.p2align 4,,15
.globl absdiff_e
	.type	absdiff_e, @function
absdiff_e:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jl	.L26
	subl	%eax, %edx
	movl	%edx, %eax
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L26:
	subl	%edx, %eax
	popl	%ebp
	ret
	.size	absdiff_e, .-absdiff_e
	.p2align 4,,15
.globl absdiff_se
	.type	absdiff_se, @function
absdiff_se:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jl	.L31
	subl	%eax, %edx
	movl	%edx, %eax
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L31:
	subl	%edx, %eax
	addl	$1, lcount
	popl	%ebp
	ret
	.size	absdiff_se, .-absdiff_se
	.p2align 4,,15
.globl gotodiff_alt
	.type	gotodiff_alt, @function
gotodiff_alt:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jge	.L36
.L33:
.L34:
	subl	%edx, %eax
	popl	%ebp
	ret
	.p2align 4,,7
	.p2align 3
.L36:
	subl	%eax, %edx
	movl	%edx, %eax
	popl	%ebp
	ret
	.size	gotodiff_alt, .-gotodiff_alt
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"x = %d, y = %d, |x-y| = (%d,%d,%d)\n"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	%ecx, -12(%ebp)
	movl	%esi, -4(%ebp)
	movl	%ebx, -8(%ebp)
	movl	4(%ecx), %ebx
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	4(%ebx), %eax
	movl	%eax, (%esp)
	call	strtol
	movl	$10, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, %esi
	movl	8(%ebx), %eax
	movl	%eax, (%esp)
	call	strtol
	cmpl	%eax, %esi
	jge	.L38
	movl	%eax, %edx
	subl	%esi, %edx
.L39:
	movl	%esi, 8(%esp)
	movl	%edx, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%edx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	-12(%ebp), %ecx
	xorl	%eax, %eax
	movl	-8(%ebp), %ebx
	movl	-4(%ebp), %esi
	movl	%ebp, %esp
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.p2align 4,,7
	.p2align 3
.L38:
	movl	%esi, %edx
	subl	%eax, %edx
	jmp	.L39
	.size	main, .-main
.globl lcount
	.bss
	.align 4
	.type	lcount, @object
	.size	lcount, 4
lcount:
	.zero	4
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
