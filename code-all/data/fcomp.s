	.file	"fcomp.c"
	.section	.rodata
	.align 8
.LC0:
	.long	0x0,0x3ff00000
	.text
	.align 16
.globl recip
	.type	recip,@function
recip:
	pushl	%ebp
	movl	%esp, %ebp
	fildl	8(%ebp)
	fdivrl	.LC0
	popl	%ebp
	ret
.Lfe1:
	.size	recip,.Lfe1-recip
	.align 16
.globl do_nothing
	.type	do_nothing,@function
do_nothing:
	pushl	%ebp
	movl	%esp, %ebp
	popl	%ebp
	ret
.Lfe2:
	.size	do_nothing,.Lfe2-do_nothing
	.section	.rodata
.LC2:
	.string	"test1 t1: r1 %f %c= r2 %f\n"
.LC3:
	.string	"test1 t2: r1 %f %c= r2 %f\n"
	.text
	.align 16
.globl test1
	.type	test1,@function
test1:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$40, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	recip
	fstpl	-24(%ebp)
	movl	%ebx, (%esp)
	call	recip
	fstl	-32(%ebp)
	addl	$16, %esp
	fldl	-24(%ebp)
	fucompp
	fnstsw	%ax
	movl	%eax, %edi
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %esi
	call	do_nothing
	movl	%edi, %eax
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %edi
	subl	$8, %esp
	pushl	-28(%ebp)
	pushl	-32(%ebp)
	testl	%esi, %esi
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	pushl	-20(%ebp)
	pushl	-24(%ebp)
	pushl	$.LC2
	call	printf
	addl	$24, %esp
	pushl	-28(%ebp)
	pushl	-32(%ebp)
	testl	%edi, %edi
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	pushl	-20(%ebp)
	pushl	-24(%ebp)
	pushl	$.LC3
	call	printf
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe3:
	.size	test1,.Lfe3-test1
	.section	.rodata
.LC6:
	.string	"test2 t1: r1 %f %c= 1.0/10.0\n"
	.align 8
.LC5:
	.long	0x0,0x3ff00000
	.text
	.align 16
.globl test2
	.type	test2,@function
test2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$16, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	recip
	pushl	%ebx
	fildl	(%esp)
	fdivrl	.LC5
	addl	$20, %esp
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	$.LC6
	call	printf
	movl	-4(%ebp), %ebx
	movl	%ebp, %esp
	popl	%ebp
	ret
.Lfe4:
	.size	test2,.Lfe4-test2
	.align 16
.globl recip_l
	.type	recip_l,@function
recip_l:
	pushl	%ebp
	movl	%esp, %ebp
	fildl	8(%ebp)
	fld1
	fdivp	%st, %st(1)
	popl	%ebp
	ret
.Lfe5:
	.size	recip_l,.Lfe5-recip_l
	.section	.rodata
.LC11:
	.string	"test3 t1: r1 %f %c= r2 %f\n"
.LC12:
	.string	"test3 t2: r1 %f %c= r2 %f\n"
.LC13:
	.string	"test3 t3: r1 %f %c= 1.0/10.0\n"
	.text
	.align 16
.globl test3
	.type	test3,@function
test3:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$104, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	recip_l
	fstpt	-56(%ebp)
	movl	%ebx, (%esp)
	call	recip_l
	fld	%st(0)
	fstpt	-72(%ebp)
	addl	$16, %esp
	fldt	-56(%ebp)
	fucompp
	fnstsw	%ax
	movl	%eax, %ebx
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %esi
	call	do_nothing
	movl	%ebx, %eax
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %edi
	subl	$8, %esp
	fldt	-72(%ebp)
	fstpl	-80(%ebp)
	pushl	-76(%ebp)
	pushl	-80(%ebp)
	testl	%esi, %esi
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	fldt	-56(%ebp)
	fstpl	-32(%ebp)
	fldl	-32(%ebp)
	fstpl	-96(%ebp)
	movl	-96(%ebp), %ebx
	movl	-92(%ebp), %esi
	pushl	%esi
	pushl	%ebx
	pushl	$.LC11
	call	printf
	addl	$24, %esp
	pushl	-76(%ebp)
	pushl	-80(%ebp)
	testl	%edi, %edi
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	pushl	%esi
	pushl	%ebx
	pushl	$.LC12
	call	printf
	addl	$32, %esp
	testl	%edi, %edi
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	pushl	%esi
	pushl	%ebx
	pushl	$.LC13
	call	printf
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe6:
	.size	test3,.Lfe6-test3
	.section	.rodata
.LC16:
	.string	"test4 t1: r1 %f %c= r2 %f\n"
.LC17:
	.string	"test4 t2: r1 %f %c= r2 %f\n"
	.align 8
.LC15:
	.long	0x0,0x3ff00000
	.text
	.align 16
.globl test4
	.type	test4,@function
test4:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %ebx
	pushl	%ebx
	call	recip
	fstpl	-16(%ebp)
	pushl	%ebx
	fildl	(%esp)
	fdivrl	.LC15
	fstl	-24(%ebp)
	addl	$20, %esp
	fldl	-16(%ebp)
	fucompp
	fnstsw	%ax
	movl	%eax, %ebx
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %edi
	call	do_nothing
	movl	%ebx, %eax
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %ebx
	subl	$8, %esp
	pushl	-20(%ebp)
	pushl	-24(%ebp)
	testl	%edi, %edi
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	pushl	$.LC16
	call	printf
	addl	$24, %esp
	pushl	-20(%ebp)
	pushl	-24(%ebp)
	testl	%ebx, %ebx
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	pushl	$.LC17
	call	printf
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%edi
	popl	%ebp
	ret
.Lfe7:
	.size	test4,.Lfe7-test4
	.section	.rodata
.LC20:
	.string	"test5 t1: r1 %f %c= 0.1\n"
.LC21:
	.string	"test5 t2: r1 %f %c= 0.1\n"
	.align 8
.LC19:
	.long	0x9999999a,0x3fb99999
	.text
	.align 16
.globl test5
	.type	test5,@function
test5:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$28, %esp
	pushl	8(%ebp)
	call	recip
	fstpl	-16(%ebp)
	addl	$16, %esp
	fldl	.LC19
	fldl	-16(%ebp)
	fucompp
	fnstsw	%ax
	movl	%eax, %edi
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %esi
	call	do_nothing
	movl	%edi, %eax
	sahf
	sete	%al
	setnp	%dl
	andb	%dl, %al
	movzbl	%al, %edi
	testl	%esi, %esi
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	pushl	$.LC20
	call	printf
	testl	%edi, %edi
	setne	%al
	movzbl	%al, %eax
	decl	%eax
	andl	$-28, %eax
	addl	$61, %eax
	pushl	%eax
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	pushl	$.LC21
	call	printf
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.Lfe8:
	.size	test5,.Lfe8-test5
	.section	.rodata
.LC23:
	.string	"Usage: %s denom\n"
	.text
	.align 16
.globl usage
	.type	usage,@function
usage:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	pushl	8(%ebp)
	pushl	$.LC23
	call	printf
	movl	$0, (%esp)
	call	exit
.Lfe9:
	.size	usage,.Lfe9-usage
	.section	.rodata
	.align 32
.LC24:
	.string	"A long double on this machine requires %d bytes\n"
	.text
	.align 16
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	12(%ebp), %esi
	andl	$-16, %esp
	cmpl	$2, 8(%ebp)
	je	.L61
	subl	$12, %esp
	pushl	(%esi)
	call	usage
	addl	$16, %esp
.L61:
	pushl	$0
	pushl	$10
	pushl	$0
	pushl	4(%esi)
	call	__strtol_internal
	addl	$16, %esp
	movl	%eax, %ebx
	testl	%ebx, %ebx
	jne	.L64
	subl	$12, %esp
	pushl	(%esi)
	call	usage
	addl	$16, %esp
.L64:
	subl	$12, %esp
	pushl	%ebx
	call	test1
	movl	%ebx, (%esp)
	call	test2
	movl	%ebx, (%esp)
	call	test3
	movl	%ebx, (%esp)
	call	test4
	movl	%ebx, (%esp)
	call	test5
	addl	$8, %esp
	pushl	$12
	pushl	$.LC24
	call	printf
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
.Lfe10:
	.size	main,.Lfe10-main
	.ident	"GCC: (GNU) 3.0.1"
