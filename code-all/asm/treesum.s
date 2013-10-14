	.file	"treesum.c"
	.text
	.p2align 4,,15
.globl sum_tree_rec
	.type	sum_tree_rec, @function
sum_tree_rec:
.LFB24:
	pushq	%r12
.LCFI0:
	xorl	%r12d, %r12d
	testq	%rdi, %rdi
	pushq	%rbp
.LCFI1:
	movq	%rdi, %rbp
	pushq	%rbx
.LCFI2:
	je	.L3
	.p2align 4,,10
	.p2align 3
.L6:
	movq	8(%rbp), %rdi
	movl	(%rbp), %ebx
	call	sum_tree_rec
	movq	16(%rbp), %rbp
	addl	%r12d, %eax
	leal	(%rax,%rbx), %r12d
	testq	%rbp, %rbp
	jne	.L6
.L3:
	popq	%rbx
	popq	%rbp
	movl	%r12d, %eax
	popq	%r12
	ret
.LFE24:
	.size	sum_tree_rec, .-sum_tree_rec
	.p2align 4,,15
.globl sum_tree_lrec
	.type	sum_tree_lrec, @function
sum_tree_lrec:
.LFB25:
	pushq	%r12
.LCFI3:
	xorl	%r12d, %r12d
	testq	%rdi, %rdi
	pushq	%rbp
.LCFI4:
	movq	%rdi, %rbp
	pushq	%rbx
.LCFI5:
	je	.L11
	.p2align 4,,10
	.p2align 3
.L14:
	movq	8(%rbp), %rdi
	movl	(%rbp), %ebx
	call	sum_tree_lrec
	movq	16(%rbp), %rbp
	addl	%r12d, %eax
	leal	(%rax,%rbx), %r12d
	testq	%rbp, %rbp
	jne	.L14
.L11:
	popq	%rbx
	popq	%rbp
	movl	%r12d, %eax
	popq	%r12
	ret
.LFE25:
	.size	sum_tree_lrec, .-sum_tree_lrec
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
	.long	.LFB24
	.long	.LFE24-.LFB24
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI0-.LFB24
	.byte	0xe
	.uleb128 0x10
	.byte	0x8c
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x18
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x20
	.byte	0x83
	.uleb128 0x4
	.align 8
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.long	.LFB25
	.long	.LFE25-.LFB25
	.uleb128 0x0
	.byte	0x4
	.long	.LCFI3-.LFB25
	.byte	0xe
	.uleb128 0x10
	.byte	0x8c
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x18
	.byte	0x86
	.uleb128 0x3
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x20
	.byte	0x83
	.uleb128 0x4
	.align 8
.LEFDE3:
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
