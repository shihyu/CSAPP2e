	.file	"fp.c"
	.text
.globl ident_x
	.type	ident_x, @function
ident_x:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movsd	8(%ebp), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -8(%ebp)
	fldl	-8(%ebp)
	leave
	ret
	.size	ident_x, .-ident_x
.globl ident_d
	.type	ident_d, @function
ident_d:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movsd	8(%ebp), %xmm1
	movapd	%xmm1, %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%ebp)
	movl	i, %eax
	movsd	-8(%ebp,%eax,8), %xmm0
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%ebp)
	fldl	-24(%ebp)
	leave
	ret
	.size	ident_d, .-ident_d
.globl funct
	.type	funct, @function
funct:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movss	16(%ebp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movapd	%xmm0, %xmm2
	mulsd	8(%ebp), %xmm2
	cvtsi2sd	28(%ebp), %xmm1
	movsd	20(%ebp), %xmm0
	divsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm2
	movsd	%xmm2, -8(%ebp)
	fldl	-8(%ebp)
	leave
	ret
	.size	funct, .-funct
.globl less
	.type	less, @function
less:
	pushl	%ebp
	movl	%esp, %ebp
	movsd	16(%ebp), %xmm0
	ucomisd	8(%ebp), %xmm0
	seta	%al
	movzbl	%al, %eax
	popl	%ebp
	ret
	.size	less, .-less
.globl lesseq
	.type	lesseq, @function
lesseq:
	pushl	%ebp
	movl	%esp, %ebp
	movsd	16(%ebp), %xmm0
	ucomisd	8(%ebp), %xmm0
	setae	%al
	movzbl	%al, %eax
	popl	%ebp
	ret
	.size	lesseq, .-lesseq
.globl i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
