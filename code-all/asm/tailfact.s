	.file	"tailfact.c"
	.text
	.p2align 4,,15
.globl tailfact
	.type	tailfact, @function
tailfact:
.LFB2:
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L5:
	imull	%edi, %esi
	subl	$1, %edi
.L7:
	cmpl	$1, %edi
	jg	.L5
	movl	%esi, %eax
	ret
.LFE2:
	.size	tailfact, .-tailfact
	.p2align 4,,15
.globl tfact
	.type	tfact, @function
tfact:
.LFB3:
	cmpl	$1, %edi
	movl	$1, %eax
	jle	.L11
	.p2align 4,,10
	.p2align 3
.L14:
	imull	%edi, %eax
	subl	$1, %edi
	cmpl	$1, %edi
	jg	.L14
.L11:
	rep
	ret
.LFE3:
	.size	tfact, .-tfact
	.p2align 4,,15
.globl rfact
	.type	rfact, @function
rfact:
.LFB4:
	cmpl	$1, %edi
	movl	$1, %eax
	jg	.L19
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L21:
	movl	%edx, %edi
.L19:
	leal	-1(%rdi), %edx
	imull	%edi, %eax
	cmpl	$1, %edx
	jg	.L21
.L18:
	rep
	ret
.LFE4:
	.size	rfact, .-rfact
	.p2align 4,,15
.globl tailfact_d
	.type	tailfact_d, @function
tailfact_d:
.LFB5:
	cmpl	$1, %edi
	movapd	%xmm0, %xmm1
	jle	.L23
	.p2align 4,,10
	.p2align 3
.L26:
	cvtsi2sd	%edi, %xmm0
	subl	$1, %edi
	cmpl	$1, %edi
	mulsd	%xmm0, %xmm1
	jg	.L26
.L23:
	movapd	%xmm1, %xmm0
	ret
.LFE5:
	.size	tailfact_d, .-tailfact_d
	.p2align 4,,15
.globl tfact_d
	.type	tfact_d, @function
tfact_d:
.LFB6:
	cmpl	$1, %edi
	jle	.L34
	movsd	.LC0(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L31:
	cvtsi2sd	%edi, %xmm0
	subl	$1, %edi
	cmpl	$1, %edi
	mulsd	%xmm0, %xmm1
	jg	.L31
.L30:
	movapd	%xmm1, %xmm0
	ret
.L34:
	movsd	.LC0(%rip), %xmm1
	jmp	.L30
.LFE6:
	.size	tfact_d, .-tfact_d
	.p2align 4,,15
.globl rfact_d
	.type	rfact_d, @function
rfact_d:
.LFB7:
	movq	%rbx, -48(%rsp)
.LCFI0:
	movq	%rbp, -40(%rsp)
.LCFI1:
	movl	%edi, %ebx
	movq	%r12, -32(%rsp)
.LCFI2:
	movq	%r13, -24(%rsp)
.LCFI3:
	movq	%r14, -16(%rsp)
.LCFI4:
	movq	%r15, -8(%rsp)
.LCFI5:
	subq	$72, %rsp
.LCFI6:
	cmpl	$1, %edi
	jle	.L55
	leal	-1(%rbx), %ebp
	cmpl	$1, %ebp
	je	.L56
	leal	-2(%rbx), %r12d
	cmpl	$1, %r12d
	je	.L57
	leal	-3(%rbx), %r13d
	cmpl	$1, %r13d
	je	.L58
	leal	-4(%rbx), %r14d
	cmpl	$1, %r14d
	je	.L59
	leal	-5(%rbx), %r15d
	cmpl	$1, %r15d
	je	.L60
	leal	-6(%rbx), %r8d
	cmpl	$1, %r8d
	je	.L61
	leal	-7(%rbx), %r10d
	cmpl	$1, %r10d
	je	.L62
	leal	-8(%rbx), %r9d
	cmpl	$1, %r9d
	je	.L63
	leal	-9(%rbx), %edi
	movl	%r8d, 16(%rsp)
	movl	%r9d, 8(%rsp)
	movl	%r10d, (%rsp)
	call	rfact_d
	movl	8(%rsp), %r9d
	movl	(%rsp), %r10d
	movl	16(%rsp), %r8d
	cvtsi2sd	%r9d, %xmm2
	mulsd	%xmm0, %xmm2
.L53:
	cvtsi2sd	%r10d, %xmm1
	mulsd	%xmm2, %xmm1
.L51:
	cvtsi2sd	%r8d, %xmm0
	mulsd	%xmm1, %xmm0
.L49:
	cvtsi2sd	%r15d, %xmm1
	mulsd	%xmm0, %xmm1
.L47:
	cvtsi2sd	%r14d, %xmm0
	mulsd	%xmm1, %xmm0
.L45:
	cvtsi2sd	%r13d, %xmm1
	mulsd	%xmm0, %xmm1
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L56:
	movsd	.LC0(%rip), %xmm1
.L39:
	cvtsi2sd	%ebx, %xmm0
	mulsd	%xmm1, %xmm0
.L37:
	movq	24(%rsp), %rbx
	movq	32(%rsp), %rbp
	movq	40(%rsp), %r12
	movq	48(%rsp), %r13
	movq	56(%rsp), %r14
	movq	64(%rsp), %r15
	addq	$72, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L55:
	movsd	.LC0(%rip), %xmm0
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L57:
	movsd	.LC0(%rip), %xmm0
.L41:
	cvtsi2sd	%ebp, %xmm1
	mulsd	%xmm0, %xmm1
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L58:
	movsd	.LC0(%rip), %xmm1
.L43:
	cvtsi2sd	%r12d, %xmm0
	mulsd	%xmm1, %xmm0
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L60:
	movsd	.LC0(%rip), %xmm1
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L59:
	movsd	.LC0(%rip), %xmm0
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L61:
	movsd	.LC0(%rip), %xmm0
	jmp	.L49
.L62:
	movsd	.LC0(%rip), %xmm1
	jmp	.L51
.L63:
	movsd	.LC0(%rip), %xmm2
	jmp	.L53
.LFE7:
	.size	rfact_d, .-rfact_d
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.section	.eh_frame,"a",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0x0
	.byte	0x1
	.string	"zR"
	.uleb128 0x1
	.sleb128 -8
	.byte	0x10
	.uleb128 0x1
	.byte	0x3
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
	.long	.LFB2
	.long	.LFE2-.LFB2
	.uleb128 0x0
	.align 8
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.long	.LFB3
	.long	.LFE3-.LFB3
	.uleb128 0x0
	.align 8
.LEFDE3:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.long	.LFB4
	.long	.LFE4-.LFB4
	.uleb128 0x0
	.align 8
.LEFDE5:
.LSFDE7:
	.long	.LEFDE7-.LASFDE7
.LASFDE7:
	.long	.LASFDE7-.Lframe1
	.long	.LFB5
	.long	.LFE5-.LFB5
	.uleb128 0x0
	.align 8
.LEFDE7:
.LSFDE9:
	.long	.LEFDE9-.LASFDE9
.LASFDE9:
	.long	.LASFDE9-.Lframe1
	.long	.LFB6
	.long	.LFE6-.LFB6
	.uleb128 0x0
	.align 8
.LEFDE9:
.LSFDE11:
	.long	.LEFDE11-.LASFDE11
.LASFDE11:
	.long	.LASFDE11-.Lframe1
	.long	.LFB7
	.long	.LFE7-.LFB7
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI1-.LFB7
	.byte	0x86
	.uleb128 0x6
	.byte	0x83
	.uleb128 0x7
	.byte	0x4
	.long	.LCFI6-.LCFI1
	.byte	0xe
	.uleb128 0x50
	.byte	0x8f
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x3
	.byte	0x8d
	.uleb128 0x4
	.byte	0x8c
	.uleb128 0x5
	.align 8
.LEFDE11:
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
