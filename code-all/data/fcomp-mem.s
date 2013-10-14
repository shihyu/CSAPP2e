	.file	"fcomp.c"
	.text
	.p2align 4,,15
.globl do_nothing
	.type	do_nothing, @function
do_nothing:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
	ret
	.size	do_nothing, .-do_nothing
	.p2align 4,,15
.globl set_fpu_double
	.type	set_fpu_double, @function
set_fpu_double:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$639, -4(%ebp)
#APP
# 11 "fcomp.c" 1
	fldcw -4(%ebp)
# 0 "" 2
#NO_APP
	leave
	ret
	.size	set_fpu_double, .-set_fpu_double
	.p2align 4,,15
.globl recip
	.type	recip, @function
recip:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	rcnt, %eax
	fildl	8(%ebp)
	fstpl	-16(%ebp)
	fld1
	fdivl	-16(%ebp)
	addl	$1, %eax
	movl	%eax, rcnt
	fstpl	-8(%ebp)
	fldl	-8(%ebp)
	leave
	ret
	.size	recip, .-recip
	.p2align 4,,15
.globl dequal
	.type	dequal, @function
dequal:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -12(%ebp)
	fldl	-16(%ebp)
	fldl	-8(%ebp)
	fucompp
	fnstsw	%ax
	leave
	sahf
	sete	%al
	setnp	%dl
	andl	%edx, %eax
	movzbl	%al, %eax
	ret
	.size	dequal, .-dequal
	.p2align 4,,15
.globl recip_l
	.type	recip_l, @function
recip_l:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	fildl	8(%ebp)
	fstpt	-40(%ebp)
	fldt	-40(%ebp)
	fdivrs	.LC0
	fstpt	-24(%ebp)
	fldt	-24(%ebp)
	leave
	ret
	.size	recip_l, .-recip_l
	.p2align 4,,15
.globl dlequal
	.type	dlequal, @function
dlequal:
	pushl	%ebp
	movl	%esp, %ebp
	fldt	20(%ebp)
	fldt	8(%ebp)
	popl	%ebp
	fucompp
	fnstsw	%ax
	sahf
	sete	%al
	setnp	%dl
	andl	%edx, %eax
	movzbl	%al, %eax
	ret
	.size	dlequal, .-dlequal
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"test3 t1: r1 %f %c= r2 %f\n"
.LC3:
	.string	"test3 t2: r1 %f %c= r2 %f\n"
.LC4:
	.string	"test3 t3: r1 %f %c= 1.0/10.0\n"
	.text
	.p2align 4,,15
.globl test3
	.type	test3, @function
test3:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$88, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	recip_l
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	fstpt	-40(%ebp)
	fldt	-40(%ebp)
	fstl	-16(%ebp)
	fucomp	%st(0)
	fnstsw	%ax
	sahf
	fldl	-16(%ebp)
	fstl	20(%esp)
	fstpl	8(%esp)
	setnp	%al
	movzbl	%al, %eax
	subl	$1, %eax
	andl	$-28, %eax
	addl	$61, %eax
	movl	%eax, 16(%esp)
	call	__printf_chk
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	-32(%ebp), %ecx
	movl	%eax, 12(%esp)
	movl	%edx, 16(%esp)
	movl	%ecx, 20(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	call	dlequal
	testl	%eax, %eax
	jne	.L16
	fldl	-16(%ebp)
	fstl	20(%esp)
	movl	$33, 16(%esp)
	fstpl	8(%esp)
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$33, %eax
.L17:
	fldl	-16(%ebp)
	movl	%eax, 16(%esp)
	fstpl	8(%esp)
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leave
	ret
	.p2align 4,,7
	.p2align 3
.L16:
	fldl	-16(%ebp)
	fstl	20(%esp)
	movl	$61, 16(%esp)
	fstpl	8(%esp)
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$61, %eax
	jmp	.L17
	.size	test3, .-test3
	.section	.rodata.str1.1
.LC5:
	.string	"test2 t1: r1 %f %c= 1.0/10.0\n"
	.text
	.p2align 4,,15
.globl test2
	.type	test2, @function
test2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$68, %esp
	movl	8(%ebp), %ebx
	movl	%ebx, (%esp)
	call	recip
	pushl	%ebx
	fstpl	-16(%ebp)
	fildl	(%esp)
	addl	$4, %esp
	fstpl	-24(%ebp)
	fld1
	fdivl	-24(%ebp)
	movl	$.LC5, 4(%esp)
	movl	$1, (%esp)
	fstpl	-32(%ebp)
	fldl	-16(%ebp)
	fldl	-32(%ebp)
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	fstpl	8(%esp)
	sete	%al
	setnp	%dl
	andl	%edx, %eax
	movzbl	%al, %eax
	subl	$1, %eax
	andl	$-28, %eax
	addl	$61, %eax
	movl	%eax, 16(%esp)
	call	__printf_chk
	addl	$68, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	test2, .-test2
	.section	.rodata.str1.1
.LC6:
	.string	"test1 t1: r1 %f %c= r2 %f\n"
.LC7:
	.string	"test1 t2: r1 %f %c= r2 %f\n"
	.text
	.p2align 4,,15
.globl test1
	.type	test1, @function
test1:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$84, %esp
	movl	8(%ebp), %ebx
	movl	%ebx, (%esp)
	call	recip
	movl	%ebx, (%esp)
	fstpl	-16(%ebp)
	call	recip
	movl	$.LC6, 4(%esp)
	movl	$1, (%esp)
	fstpl	-24(%ebp)
	fldl	-16(%ebp)
	fldl	-24(%ebp)
	fucom	%st(1)
	fnstsw	%ax
	sahf
	fstpl	20(%esp)
	fstpl	8(%esp)
	setnp	%dl
	sete	%al
	andl	%edx, %eax
	movzbl	%al, %eax
	subl	$1, %eax
	andl	$-28, %eax
	addl	$61, %eax
	movl	%eax, 16(%esp)
	call	__printf_chk
	fldl	-24(%ebp)
	fstl	8(%esp)
	fldl	-16(%ebp)
	fstl	(%esp)
	fxch	%st(1)
	fstpl	-40(%ebp)
	fstpl	-56(%ebp)
	call	dequal
	movl	$.LC7, 4(%esp)
	movl	$1, (%esp)
	cmpl	$1, %eax
	fldl	-40(%ebp)
	sbbl	%eax, %eax
	fstpl	20(%esp)
	andl	$-28, %eax
	fldl	-56(%ebp)
	addl	$61, %eax
	movl	%eax, 16(%esp)
	fstpl	8(%esp)
	call	__printf_chk
	addl	$84, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	test1, .-test1
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC8:
	.string	"A long double on this machine requires %d bytes\n"
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
	pushl	%ecx
	subl	$20, %esp
	cmpl	$1, (%ecx)
	jle	.L31
	call	set_fpu_double
.L31:
	movl	$10, (%esp)
	call	test1
	movl	$10, (%esp)
	call	test2
	movl	$10, (%esp)
	call	test3
	movl	$12, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	addl	$20, %esp
	xorl	%eax, %eax
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
.globl rcnt
	.bss
	.align 4
	.type	rcnt, @object
	.size	rcnt, 4
rcnt:
	.zero	4
.globl rlcnt
	.align 4
	.type	rlcnt, @object
	.size	rlcnt, 4
rlcnt:
	.zero	4
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1065353216
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
