	.file	"max.c"
	.text
	.p2align 4,,15
.globl max
	.type	max, @function
max:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	cmpl	%eax, 8(%ebp)
	jl	.L3
	movl	8(%ebp), %eax
.L3:
	leave
	ret
	.size	max, .-max
	.p2align 4,,15
.globl bmax
	.type	bmax, @function
bmax:
	pushl	%ebp
	xorl	%edx, %edx
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	leave
	cmpl	%ecx, %eax
	setle	%dl
	decl	%edx
	andl	%edx, %eax
	notl	%edx
	andl	%ecx, %edx
	orl	%edx, %eax
	ret
	.size	bmax, .-bmax
	.p2align 4,,15
.globl bvmax
	.type	bvmax, @function
bvmax:
	pushl	%ebp
	xorl	%edx, %edx
	movl	%esp, %ebp
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %ecx
	cmpl	%ecx, %eax
	setg	%dl
	movl	%edx, -4(%ebp)
	movl	-4(%ebp), %edx
	leave
	negl	%edx
	andl	%edx, %eax
	notl	%edx
	andl	%ecx, %edx
	orl	%edx, %eax
	ret
	.size	bvmax, .-bvmax
	.p2align 4,,15
.globl bamax
	.type	bamax, @function
bamax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %edx
	movl	12(%ebp), %ebx
#APP
	cmpl %edx,%ebx;setg %al;movzbl %al,%ecx
#NO_APP
	negl	%ecx
	andl	%ecx, %edx
	notl	%ecx
	andl	%ebx, %ecx
	popl	%ebx
	leave
	orl	%ecx, %edx
	movl	%edx, %eax
	ret
	.size	bamax, .-bamax
	.p2align 4,,15
.globl cmax
	.type	cmax, @function
cmax:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	leave
#APP
	cmpl %eax, %edx;cmovll %eax,%eax
#NO_APP
	ret
	.size	cmax, .-cmax
	.p2align 4,,15
.globl test_max
	.type	test_max, @function
test_max:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$8, %esp
	movl	8(%ebp), %edi
	.p2align 4,,7
.L15:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	max
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L15
	movl	%esi, cnt
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.size	test_max, .-test_max
	.p2align 4,,15
.globl test_bmax
	.type	test_bmax, @function
test_bmax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$8, %esp
	movl	8(%ebp), %edi
	.p2align 4,,7
.L22:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	bmax
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L22
	movl	%esi, cnt
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.size	test_bmax, .-test_bmax
	.p2align 4,,15
.globl test_bvmax
	.type	test_bvmax, @function
test_bvmax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$8, %esp
	movl	8(%ebp), %edi
	.p2align 4,,7
.L29:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	bvmax
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L29
	movl	%esi, cnt
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.size	test_bvmax, .-test_bvmax
	.p2align 4,,15
.globl test_bamax
	.type	test_bamax, @function
test_bamax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$8, %esp
	movl	8(%ebp), %edi
	.p2align 4,,7
.L36:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	bamax
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L36
	movl	%esi, cnt
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.size	test_bamax, .-test_bamax
	.p2align 4,,15
.globl test_cmax
	.type	test_cmax, @function
test_cmax:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$8, %esp
	movl	8(%ebp), %edi
	.p2align 4,,7
.L43:
	movl	(%edi,%ebx,4), %eax
	movl	%eax, 4(%esp)
	movl	zero(,%ebx,4), %eax
	incl	%ebx
	movl	%eax, (%esp)
	call	cmax
	addl	%eax, %esi
	cmpl	$511, %ebx
	jle	.L43
	movl	%esi, cnt
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
	.size	test_cmax, .-test_cmax
	.p2align 4,,15
.globl test_ref
	.type	test_ref, @function
test_ref:
	pushl	%ebp
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %ebx
	.p2align 4,,7
.L50:
	movl	(%ebx,%edx,4), %eax
	addl	zero(,%edx,4), %eax
	incl	%edx
	addl	%eax, %ecx
	cmpl	$511, %edx
	jle	.L50
	popl	%ebx
	movl	%ecx, cnt
	leave
	ret
	.size	test_ref, .-test_ref
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	989855744
	.text
	.p2align 4,,15
.globl cpt
	.type	cpt, @function
cpt:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	fcyc
	flds	.LC0
	leave
	fmulp	%st, %st(1)
	ret
	.size	cpt, .-cpt
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC2:
	.string	"Function: %s\tmax(0, +1)\tCPT = %.2f\n"
	.align 4
.LC3:
	.string	"Function: %s\tmax(0, -1)\tCPT = %.2f\n"
	.align 4
.LC4:
	.string	"Function: %s\tmax(0,+-1)\tCPT = %.2f\n"
	.text
	.p2align 4,,15
.globl run_tests
	.type	run_tests, @function
run_tests:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	8(%ebp), %ebx
	movl	12(%ebp), %esi
	movl	$one, 4(%esp)
	movl	%ebx, (%esp)
	call	cpt
	movl	%esi, 4(%esp)
	fstpl	8(%esp)
	movl	$.LC2, (%esp)
	call	printf
	movl	%ebx, (%esp)
	movl	$m1, 4(%esp)
	call	cpt
	movl	%esi, 4(%esp)
	fstpl	8(%esp)
	movl	$.LC3, (%esp)
	call	printf
	movl	%ebx, (%esp)
	movl	$pm1, 4(%esp)
	call	cpt
	movl	%esi, 4(%esp)
	fstpl	8(%esp)
	movl	$.LC4, (%esp)
	call	printf
	addl	$16, %esp
	popl	%ebx
	popl	%esi
	leave
	ret
	.size	run_tests, .-run_tests
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"max"
.LC7:
	.string	"bmax"
.LC8:
	.string	"bvmax"
.LC9:
	.string	"bamax"
.LC10:
	.string	"cmax"
.LC11:
	.string	"reference"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	xorl	%ebx, %ebx
	subl	$20, %esp
	andl	$-16, %esp
	subl	$16, %esp
	.p2align 4,,7
.L61:
	movl	$1, one(,%ebx,4)
	movl	$0, zero(,%ebx,4)
	movl	$-1, m1(,%ebx,4)
	call	random
	andl	$1, %eax
	cmpl	$1, %eax
	sbbl	%eax, %eax
	orl	$1, %eax
	movl	%eax, pm1(,%ebx,4)
	incl	%ebx
	cmpl	$511, %ebx
	jle	.L61
	movl	$.LC6, 4(%esp)
	movl	$test_max, (%esp)
	call	run_tests
	movl	$.LC7, 4(%esp)
	movl	$test_bmax, (%esp)
	call	run_tests
	movl	$.LC8, 4(%esp)
	movl	$test_bvmax, (%esp)
	call	run_tests
	movl	$.LC9, 4(%esp)
	movl	$test_bamax, (%esp)
	call	run_tests
	movl	$.LC10, 4(%esp)
	movl	$test_cmax, (%esp)
	call	run_tests
	movl	$.LC11, 4(%esp)
	movl	$test_ref, (%esp)
	call	run_tests
	movl	-4(%ebp), %ebx
	leave
	xorl	%eax, %eax
	ret
	.size	main, .-main
	.comm	one,2048,32
	.comm	zero,2048,32
	.comm	pm1,2048,32
	.comm	m1,2048,32
	.comm	cnt,4,4
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.2 20041017 (Red Hat 3.4.2-6.fc3)"
