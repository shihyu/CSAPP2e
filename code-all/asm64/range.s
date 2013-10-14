	.file	"range.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"negative"
.LC1:
	.string	"zero"
.LC2:
	.string	"positive"
.LC3:
	.string	"other"
.globl ranges
	.data
	.align 32
	.type	ranges, @object
	.size	ranges, 32
ranges:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.section	.rodata.str1.1
.LC4:
	.string	"Caught FPE signal"
	.text
	.p2align 4,,15
.globl float_handler
	.type	float_handler, @function
float_handler:
.LFB29:
	movl	$.LC4, %edi
	jmp	puts
.LFE29:
	.size	float_handler, .-float_handler
	.p2align 4,,15
.globl b2f
	.type	b2f, @function
b2f:
.LFB30:
	movl	%edi, -4(%rsp)
	movss	-4(%rsp), %xmm1
	movaps	%xmm1, %xmm0
	ret
.LFE30:
	.size	b2f, .-b2f
	.p2align 4,,15
.globl find_range
	.type	find_range, @function
find_range:
.LFB31:
	xorps	%xmm1, %xmm1
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	ja	.L3
	movb	$1, %al
	ucomiss	%xmm1, %xmm0
	jp	.L11
	je	.L3
.L11:
	xorl	%eax, %eax
	ucomiss	%xmm1, %xmm0
	setbe	%al
	addl	$2, %eax
	.p2align 4,,7
.L3:
	rep ; ret
.LFE31:
	.size	find_range, .-find_range
	.section	.rodata.str1.1
.LC7:
	.string	"%g (0x%.8x) is %s\n"
.LC8:
	.string	"\t%g %c= %g\n"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
.LFB32:
	pushq	%r13
.LCFI0:
	fldz
	movl	%edi, %r13d
	movl	$8, %edi
	pushq	%r12
.LCFI1:
	movl	$1, %r12d
	pushq	%rbp
.LCFI2:
	pushq	%rbx
.LCFI3:
	movq	%rsi, %rbx
	movl	$float_handler, %esi
	subq	$24, %rsp
.LCFI4:
	fstps	20(%rsp)
	call	signal
	cmpl	%r13d, %r12d
	jge	.L24
	leaq	8(%rbx), %rbp
	.p2align 4,,7
.L22:
	movq	(%rbp), %rdi
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	xorl	%esi, %esi
	call	__strtoul_internal
	movl	%eax, %edi
	movq	%rax, %rbx
	call	b2f
	movss	%xmm0, 16(%rsp)
	call	find_range
	flds	16(%rsp)
	mov	%eax, %eax
	movl	%ebx, %esi
	movq	ranges(,%rax,8), %rdx
	movl	$.LC7, %edi
	movl	$1, %eax
	fstpl	8(%rsp)
	movlpd	8(%rsp), %xmm0
	call	printf
	cmpl	$1, %r12d
	jle	.L18
	movss	16(%rsp), %xmm0
	movl	$33, %eax
	ucomiss	20(%rsp), %xmm0
	movl	$61, %esi
	cvtss2sd	20(%rsp), %xmm1
	movl	$.LC8, %edi
	movlpd	8(%rsp), %xmm0
	cmovne	%eax, %esi
	cmovp	%eax, %esi
	movl	$2, %eax
	movsbl	%sil,%esi
	call	printf
.L18:
	flds	16(%rsp)
	incl	%r12d
	addq	$8, %rbp
	cmpl	%r13d, %r12d
	fstps	20(%rsp)
	jl	.L22
.L24:
	addq	$24, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.LFE32:
	.size	main, .-main
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0x0
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -8
	.byte	0x10
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x1
	.align 8
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.align 8
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.align 8
.LEFDE3:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.align 8
.LEFDE5:
.LSFDE7:
	.long	.LEFDE7-.LASFDE7
.LASFDE7:
	.long	.LASFDE7-.Lframe1
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.byte	0x4
	.long	.LCFI0-.LFB32
	.byte	0xe
	.uleb128 0x10
	.byte	0x8d
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x18
	.byte	0x8c
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x28
	.byte	0x83
	.uleb128 0x5
	.byte	0x86
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x40
	.align 8
.LEFDE7:
	.section	.note.GNU-stack,"",@progbits
	.ident	"GCC: (GNU) 3.4.2 20041017 (Red Hat 3.4.2-6.fc3)"
