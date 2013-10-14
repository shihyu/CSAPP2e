	.file	"fcomp.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.p2align 4,,15
.globl do_nothing
	.type	do_nothing, @function
do_nothing:
.LFB19:
	.file 1 "fcomp.c"
	.loc 1 5 0
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	.loc 1 5 0
	popl	%ebp
	ret
.LFE19:
	.size	do_nothing, .-do_nothing
	.p2align 4,,15
.globl set_fpu_double
	.type	set_fpu_double, @function
set_fpu_double:
.LFB20:
	.loc 1 9 0
	pushl	%ebp
.LCFI2:
	movl	%esp, %ebp
.LCFI3:
	subl	$16, %esp
.LCFI4:
	.loc 1 10 0
	movl	$639, -4(%ebp)
.LVL0:
	.loc 1 11 0
#APP
# 11 "fcomp.c" 1
	fldcw -4(%ebp)
# 0 "" 2
	.loc 1 12 0
#NO_APP
	leave
	ret
.LFE20:
	.size	set_fpu_double, .-set_fpu_double
	.p2align 4,,15
.globl recip
	.type	recip, @function
recip:
.LFB21:
	.loc 1 18 0
.LVL1:
	.loc 1 19 0
	movl	rcnt, %eax
	.loc 1 18 0
	pushl	%ebp
.LCFI5:
	movl	%esp, %ebp
.LCFI6:
	.loc 1 19 0
	fildl	8(%ebp)
	addl	$1, %eax
	fdivrs	.LC0
	movl	%eax, rcnt
	.loc 1 21 0
	popl	%ebp
	ret
.LFE21:
	.size	recip, .-recip
	.p2align 4,,15
.globl dequal
	.type	dequal, @function
dequal:
.LFB22:
	.loc 1 23 0
.LVL2:
	pushl	%ebp
.LCFI7:
	movl	%esp, %ebp
.LCFI8:
	.loc 1 23 0
	fldl	16(%ebp)
	fldl	8(%ebp)
	fucompp
	fnstsw	%ax
	.loc 1 25 0
	popl	%ebp
	.loc 1 23 0
	sahf
	sete	%al
	setnp	%dl
	andl	%edx, %eax
	movzbl	%al, %eax
	.loc 1 25 0
	ret
.LFE22:
	.size	dequal, .-dequal
	.p2align 4,,15
.globl recip_l
	.type	recip_l, @function
recip_l:
.LFB25:
	.loc 1 53 0
.LVL3:
	pushl	%ebp
.LCFI9:
	movl	%esp, %ebp
.LCFI10:
	.loc 1 53 0
	fildl	8(%ebp)
	.loc 1 55 0
	popl	%ebp
	.loc 1 53 0
	fdivrs	.LC0
	.loc 1 55 0
	ret
.LFE25:
	.size	recip_l, .-recip_l
	.p2align 4,,15
.globl dlequal
	.type	dlequal, @function
dlequal:
.LFB26:
	.loc 1 59 0
.LVL4:
	pushl	%ebp
.LCFI11:
	movl	%esp, %ebp
.LCFI12:
	.loc 1 59 0
	fldt	20(%ebp)
	fldt	8(%ebp)
	.loc 1 61 0
	popl	%ebp
	.loc 1 59 0
	fucompp
	fnstsw	%ax
	sahf
	sete	%al
	setnp	%dl
	andl	%edx, %eax
	movzbl	%al, %eax
	.loc 1 61 0
	ret
.LFE26:
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
.LFB27:
	.loc 1 63 0
.LVL5:
	pushl	%ebp
.LCFI13:
	movl	%esp, %ebp
.LCFI14:
	subl	$72, %esp
.LCFI15:
	.loc 1 67 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	recip_l
.LBB16:
.LBB18:
	.file 2 "/usr/include/bits/stdio2.h"
	.loc 2 105 0
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
.LBE18:
.LBE16:
	.loc 1 67 0
	fld	%st(0)
	.loc 1 72 0
	fstl	-24(%ebp)
	fucomp	%st(0)
	fnstsw	%ax
	sahf
.LBB20:
.LBB17:
	.loc 2 105 0
	fldl	-24(%ebp)
	fstl	20(%esp)
	fstpl	8(%esp)
	fstpt	-40(%ebp)
.LBE17:
.LBE20:
	.loc 1 72 0
	setnp	%al
	movzbl	%al, %eax
	subl	$1, %eax
	andl	$-28, %eax
	addl	$61, %eax
.LBB21:
.LBB19:
	.loc 2 105 0
	movl	%eax, 16(%esp)
	call	__printf_chk
.LBE19:
.LBE21:
	.loc 1 70 0
	fldt	-40(%ebp)
	fld	%st(0)
	fstpt	12(%esp)
	fstpt	(%esp)
	call	dlequal
	.loc 1 74 0
	testl	%eax, %eax
.LVL6:
	jne	.L16
.LVL7:
.LBB22:
.LBB23:
	.loc 2 105 0
	fldl	-24(%ebp)
	fstl	20(%esp)
	movl	$33, 16(%esp)
	fstpl	8(%esp)
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
.LVL8:
	movl	$33, %eax
.L17:
.LBE23:
.LBE22:
.LBB25:
.LBB26:
	fldl	-24(%ebp)
	movl	%eax, 16(%esp)
	fstpl	8(%esp)
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
.LBE26:
.LBE25:
	.loc 1 78 0
	leave
	ret
.LVL9:
	.p2align 4,,7
	.p2align 3
.L16:
.LBB27:
.LBB24:
	.loc 2 105 0
	fldl	-24(%ebp)
	fstl	20(%esp)
	movl	$61, 16(%esp)
	fstpl	8(%esp)
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
.LVL10:
	movl	$61, %eax
	jmp	.L17
.LBE24:
.LBE27:
.LFE27:
	.size	test3, .-test3
	.section	.rodata.str1.1
.LC5:
	.string	"test2 t1: r1 %f %c= 1.0/10.0\n"
	.text
	.p2align 4,,15
.globl test2
	.type	test2, @function
test2:
.LFB24:
	.loc 1 41 0
.LVL11:
	pushl	%ebp
.LCFI16:
	movl	%esp, %ebp
.LCFI17:
	pushl	%ebx
.LCFI18:
	subl	$20, %esp
.LCFI19:
	.loc 1 41 0
	movl	8(%ebp), %ebx
	.loc 1 44 0
	movl	%ebx, (%esp)
	call	recip
	.loc 1 46 0
	pushl	%ebx
	fildl	(%esp)
	addl	$4, %esp
	fdivrs	.LC0
.LBB28:
.LBB30:
	.loc 2 105 0
	movl	$.LC5, 4(%esp)
	movl	$1, (%esp)
.LBE30:
.LBE28:
	.loc 1 46 0
	fucomp	%st(1)
	fnstsw	%ax
	sahf
.LBB32:
.LBB29:
	.loc 2 105 0
	fstpl	8(%esp)
.LBE29:
.LBE32:
	.loc 1 46 0
	sete	%al
	setnp	%dl
	andl	%edx, %eax
	movzbl	%al, %eax
	subl	$1, %eax
	andl	$-28, %eax
	addl	$61, %eax
.LBB33:
.LBB31:
	.loc 2 105 0
	movl	%eax, 16(%esp)
	call	__printf_chk
.LBE31:
.LBE33:
	.loc 1 47 0
	addl	$20, %esp
	popl	%ebx
	popl	%ebp
	ret
.LFE24:
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
.LFB23:
	.loc 1 27 0
.LVL12:
	pushl	%ebp
.LCFI20:
	movl	%esp, %ebp
.LCFI21:
	pushl	%ebx
.LCFI22:
	subl	$52, %esp
.LCFI23:
	.loc 1 27 0
	movl	8(%ebp), %ebx
	.loc 1 31 0
	movl	%ebx, (%esp)
	call	recip
	.loc 1 32 0
	movl	%ebx, (%esp)
	.loc 1 31 0
	fstpl	-24(%ebp)
.LVL13:
	.loc 1 32 0
	call	recip
.LBB34:
.LBB36:
	.loc 2 105 0
	movl	$.LC6, 4(%esp)
	movl	$1, (%esp)
.LBE36:
.LBE34:
	.loc 1 32 0
	fstl	-16(%ebp)
.LVL14:
	.loc 1 35 0
	fldl	-24(%ebp)
	fucom	%st(1)
	fnstsw	%ax
	fxch	%st(1)
	sahf
.LBB38:
.LBB35:
	.loc 2 105 0
	fstpl	20(%esp)
	fstpl	8(%esp)
.LBE35:
.LBE38:
	.loc 1 35 0
	setnp	%dl
	sete	%al
	andl	%edx, %eax
	movzbl	%al, %eax
	subl	$1, %eax
	andl	$-28, %eax
	addl	$61, %eax
.LBB39:
.LBB37:
	.loc 2 105 0
	movl	%eax, 16(%esp)
	call	__printf_chk
.LBE37:
.LBE39:
	.loc 1 34 0
	fldl	-16(%ebp)
	fstpl	8(%esp)
	fldl	-24(%ebp)
	fstpl	(%esp)
	call	dequal
.LBB40:
.LBB43:
	.loc 2 105 0
	movl	$.LC7, 4(%esp)
	movl	$1, (%esp)
.LBE43:
.LBE40:
	.loc 1 36 0
	cmpl	$1, %eax
.LVL15:
.LBB46:
.LBB42:
	.loc 2 105 0
	fldl	-16(%ebp)
.LBE42:
.LBE46:
	.loc 1 36 0
	sbbl	%eax, %eax
.LVL16:
.LBB47:
.LBB44:
	.loc 2 105 0
	fstpl	20(%esp)
.LBE44:
.LBE47:
	.loc 1 36 0
	andl	$-28, %eax
.LBB48:
.LBB41:
	.loc 2 105 0
	fldl	-24(%ebp)
.LBE41:
.LBE48:
	.loc 1 36 0
	addl	$61, %eax
.LBB49:
.LBB45:
	.loc 2 105 0
	movl	%eax, 16(%esp)
	fstpl	8(%esp)
	call	__printf_chk
.LBE45:
.LBE49:
	.loc 1 37 0
	addl	$52, %esp
	popl	%ebx
	popl	%ebp
	ret
.LFE23:
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
.LFB28:
	.loc 1 80 0
.LVL17:
	leal	4(%esp), %ecx
.LCFI24:
	andl	$-16, %esp
	pushl	-4(%ecx)
.LCFI25:
	pushl	%ebp
.LCFI26:
	movl	%esp, %ebp
.LCFI27:
	pushl	%ecx
.LCFI28:
	subl	$20, %esp
.LCFI29:
	.loc 1 85 0
	cmpl	$1, (%ecx)
	jle	.L31
	.loc 1 86 0
	call	set_fpu_double
.L31:
	.loc 1 87 0
	movl	$10, (%esp)
	call	test1
	.loc 1 89 0
	movl	$10, (%esp)
	call	test2
	.loc 1 91 0
	movl	$10, (%esp)
	call	test3
.LBB50:
.LBB51:
	.loc 2 105 0
	movl	$12, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
.LBE51:
.LBE50:
	.loc 1 95 0
	addl	$20, %esp
	xorl	%eax, %eax
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
.LFE28:
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
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -4
	.byte	0x8
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x1
	.align 4
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.byte	0x4
	.long	.LCFI0-.LFB19
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB20
	.long	.LFE20-.LFB20
	.byte	0x4
	.long	.LCFI2-.LFB20
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB21
	.long	.LFE21-.LFB21
	.byte	0x4
	.long	.LCFI5-.LFB21
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB22
	.long	.LFE22-.LFB22
	.byte	0x4
	.long	.LCFI7-.LFB22
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB25
	.long	.LFE25-.LFB25
	.byte	0x4
	.long	.LCFI9-.LFB25
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB26
	.long	.LFE26-.LFB26
	.byte	0x4
	.long	.LCFI11-.LFB26
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB27
	.long	.LFE27-.LFB27
	.byte	0x4
	.long	.LCFI13-.LFB27
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x5
	.align 4
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB24
	.long	.LFE24-.LFB24
	.byte	0x4
	.long	.LCFI16-.LFB24
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI19-.LCFI17
	.byte	0x83
	.uleb128 0x3
	.align 4
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB23
	.long	.LFE23-.LFB23
	.byte	0x4
	.long	.LCFI20-.LFB23
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI23-.LCFI21
	.byte	0x83
	.uleb128 0x3
	.align 4
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB28
	.long	.LFE28-.LFB28
	.byte	0x4
	.long	.LCFI24-.LFB28
	.byte	0xc
	.uleb128 0x1
	.uleb128 0x0
	.byte	0x9
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xc
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x8
	.byte	0x85
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0xd
	.uleb128 0x5
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0x84
	.uleb128 0x3
	.align 4
.LEFDE18:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB19-.Ltext0
	.long	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI1-.Ltext0
	.long	.LFE19-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST1:
	.long	.LFB20-.Ltext0
	.long	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI2-.Ltext0
	.long	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI3-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST2:
	.long	.LFB21-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI5-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI6-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST3:
	.long	.LFB22-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI7-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI8-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST4:
	.long	.LFB25-.Ltext0
	.long	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI9-.Ltext0
	.long	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI10-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LFB26-.Ltext0
	.long	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI11-.Ltext0
	.long	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI12-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST6:
	.long	.LFB27-.Ltext0
	.long	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI13-.Ltext0
	.long	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI14-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST7:
	.long	.LVL5-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL7-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST8:
	.long	.LVL6-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LFB24-.Ltext0
	.long	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI16-.Ltext0
	.long	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI17-.Ltext0
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LFB23-.Ltext0
	.long	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI20-.Ltext0
	.long	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI21-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
.LLST11:
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LFB28-.Ltext0
	.long	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI24-.Ltext0
	.long	.LCFI25-.Ltext0
	.value	0x1
	.byte	0x51
	.long	.LCFI25-.Ltext0
	.long	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI26-.Ltext0
	.long	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI27-.Ltext0
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0x3a7
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF28
	.byte	0x1
	.long	.LASF29
	.long	.LASF30
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF8
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.uleb128 0x5
	.byte	0x4
	.long	0x74
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x5
	.byte	0x4
	.long	0x81
	.uleb128 0x6
	.long	0x74
	.uleb128 0x7
	.long	0x4f
	.uleb128 0x8
	.byte	0x1
	.long	.LASF10
	.byte	0x2
	.byte	0x68
	.byte	0x1
	.long	0x4f
	.byte	0x2
	.long	0xaa
	.uleb128 0x9
	.long	.LASF31
	.byte	0x2
	.byte	0x67
	.long	0x7b
	.uleb128 0xa
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.byte	0x5
	.long	.LFB19
	.long	.LFE19
	.long	.LLST0
	.uleb128 0xc
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x9
	.long	.LFB20
	.long	.LFE20
	.long	.LLST1
	.long	0xe5
	.uleb128 0xd
	.long	.LASF19
	.byte	0x1
	.byte	0xa
	.long	0x25
	.byte	0x2
	.byte	0x75
	.sleb128 -4
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.long	0x111
	.long	.LFB21
	.long	.LFE21
	.long	.LLST2
	.long	0x111
	.uleb128 0xf
	.long	.LASF15
	.byte	0x1
	.byte	0x12
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF12
	.uleb128 0xe
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.long	0x4f
	.long	.LFB22
	.long	.LFE22
	.long	.LLST3
	.long	0x14e
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x17
	.long	0x111
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.string	"y"
	.byte	0x1
	.byte	0x17
	.long	0x111
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.long	0x17a
	.long	.LFB25
	.long	.LFE25
	.long	.LLST4
	.long	0x17a
	.uleb128 0xf
	.long	.LASF15
	.byte	0x1
	.byte	0x35
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0x0
	.uleb128 0x2
	.byte	0xc
	.byte	0x4
	.long	.LASF17
	.uleb128 0xe
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0x3b
	.byte	0x1
	.long	0x4f
	.long	.LFB26
	.long	.LFE26
	.long	.LLST5
	.long	0x1b7
	.uleb128 0x10
	.string	"x"
	.byte	0x1
	.byte	0x3b
	.long	0x17a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.string	"y"
	.byte	0x1
	.byte	0x3b
	.long	0x17a
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.long	.LFB27
	.long	.LFE27
	.long	.LLST6
	.long	0x257
	.uleb128 0x12
	.long	.LASF15
	.byte	0x1
	.byte	0x3f
	.long	0x4f
	.long	.LLST7
	.uleb128 0x13
	.string	"r1"
	.byte	0x1
	.byte	0x40
	.long	0x17a
	.byte	0x1
	.byte	0x5d
	.uleb128 0x14
	.string	"r2"
	.byte	0x1
	.byte	0x40
	.long	0x17a
	.uleb128 0x14
	.string	"t1"
	.byte	0x1
	.byte	0x41
	.long	0x4f
	.uleb128 0x15
	.string	"t2"
	.byte	0x1
	.byte	0x41
	.long	0x4f
	.long	.LLST8
	.uleb128 0x14
	.string	"t3"
	.byte	0x1
	.byte	0x41
	.long	0x4f
	.uleb128 0x16
	.long	0x8b
	.long	.Ldebug_ranges0+0x0
	.byte	0x1
	.byte	0x48
	.long	0x22c
	.uleb128 0x17
	.long	0x9d
	.byte	0x0
	.uleb128 0x16
	.long	0x8b
	.long	.Ldebug_ranges0+0x20
	.byte	0x1
	.byte	0x4a
	.long	0x241
	.uleb128 0x17
	.long	0x9d
	.byte	0x0
	.uleb128 0x18
	.long	0x8b
	.long	.LBB25
	.long	.LBE25
	.byte	0x1
	.byte	0x4c
	.uleb128 0x17
	.long	0x9d
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.long	.LFB24
	.long	.LFE24
	.long	.LLST9
	.long	0x2a6
	.uleb128 0xf
	.long	.LASF15
	.byte	0x1
	.byte	0x29
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.string	"r1"
	.byte	0x1
	.byte	0x2a
	.long	0x111
	.byte	0x1
	.byte	0x5b
	.uleb128 0x14
	.string	"t1"
	.byte	0x1
	.byte	0x2b
	.long	0x4f
	.uleb128 0x19
	.long	0x8b
	.long	.Ldebug_ranges0+0x38
	.byte	0x1
	.byte	0x2e
	.uleb128 0x17
	.long	0x9d
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x1b
	.byte	0x1
	.long	.LFB23
	.long	.LFE23
	.long	.LLST10
	.long	0x326
	.uleb128 0xf
	.long	.LASF15
	.byte	0x1
	.byte	0x1b
	.long	0x4f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.string	"r1"
	.byte	0x1
	.byte	0x1c
	.long	0x111
	.byte	0x2
	.byte	0x75
	.sleb128 -24
	.uleb128 0x13
	.string	"r2"
	.byte	0x1
	.byte	0x1c
	.long	0x111
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x14
	.string	"t1"
	.byte	0x1
	.byte	0x1d
	.long	0x4f
	.uleb128 0x15
	.string	"t2"
	.byte	0x1
	.byte	0x1d
	.long	0x4f
	.long	.LLST11
	.uleb128 0x16
	.long	0x8b
	.long	.Ldebug_ranges0+0x58
	.byte	0x1
	.byte	0x23
	.long	0x314
	.uleb128 0x17
	.long	0x9d
	.byte	0x0
	.uleb128 0x19
	.long	0x8b
	.long	.Ldebug_ranges0+0x78
	.byte	0x1
	.byte	0x24
	.uleb128 0x17
	.long	0x9d
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.long	0x4f
	.long	.LFB28
	.long	.LFE28
	.long	.LLST12
	.long	0x380
	.uleb128 0xf
	.long	.LASF24
	.byte	0x1
	.byte	0x50
	.long	0x4f
	.byte	0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0xf
	.long	.LASF25
	.byte	0x1
	.byte	0x50
	.long	0x380
	.byte	0x2
	.byte	0x71
	.sleb128 4
	.uleb128 0x1a
	.long	.LASF15
	.byte	0x1
	.byte	0x51
	.long	0x4f
	.uleb128 0x18
	.long	0x8b
	.long	.LBB50
	.long	.LBE50
	.byte	0x1
	.byte	0x5d
	.uleb128 0x17
	.long	0x9d
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.long	0x6e
	.uleb128 0x1b
	.long	.LASF26
	.byte	0x1
	.byte	0x10
	.long	0x86
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rcnt
	.uleb128 0x1b
	.long	.LASF27
	.byte	0x1
	.byte	0x32
	.long	0x86
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	rlcnt
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x18
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x97
	.value	0x2
	.long	.Ldebug_info0
	.long	0x3ab
	.long	0xaa
	.string	"do_nothing"
	.long	0xbe
	.string	"set_fpu_double"
	.long	0xe5
	.string	"recip"
	.long	0x118
	.string	"dequal"
	.long	0x14e
	.string	"recip_l"
	.long	0x181
	.string	"dlequal"
	.long	0x1b7
	.string	"test3"
	.long	0x257
	.string	"test2"
	.long	0x2a6
	.string	"test1"
	.long	0x326
	.string	"main"
	.long	0x386
	.string	"rcnt"
	.long	0x398
	.string	"rlcnt"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.value	0x0
	.value	0x0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB16-.Ltext0
	.long	.LBE16-.Ltext0
	.long	.LBB21-.Ltext0
	.long	.LBE21-.Ltext0
	.long	.LBB20-.Ltext0
	.long	.LBE20-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB22-.Ltext0
	.long	.LBE22-.Ltext0
	.long	.LBB27-.Ltext0
	.long	.LBE27-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB28-.Ltext0
	.long	.LBE28-.Ltext0
	.long	.LBB33-.Ltext0
	.long	.LBE33-.Ltext0
	.long	.LBB32-.Ltext0
	.long	.LBE32-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB34-.Ltext0
	.long	.LBE34-.Ltext0
	.long	.LBB39-.Ltext0
	.long	.LBE39-.Ltext0
	.long	.LBB38-.Ltext0
	.long	.LBE38-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB40-.Ltext0
	.long	.LBE40-.Ltext0
	.long	.LBB49-.Ltext0
	.long	.LBE49-.Ltext0
	.long	.LBB48-.Ltext0
	.long	.LBE48-.Ltext0
	.long	.LBB47-.Ltext0
	.long	.LBE47-.Ltext0
	.long	.LBB46-.Ltext0
	.long	.LBE46-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"dequal"
.LASF31:
	.string	"__fmt"
.LASF5:
	.string	"short int"
.LASF30:
	.string	"/home/rbryant/ics2/code/data"
.LASF13:
	.string	"recip"
.LASF15:
	.string	"denom"
.LASF1:
	.string	"unsigned char"
.LASF16:
	.string	"recip_l"
.LASF3:
	.string	"long unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF28:
	.string	"GNU C 4.3.2"
.LASF12:
	.string	"double"
.LASF18:
	.string	"dlequal"
.LASF23:
	.string	"main"
.LASF0:
	.string	"unsigned int"
.LASF7:
	.string	"long long unsigned int"
.LASF29:
	.string	"fcomp.c"
.LASF19:
	.string	"mode"
.LASF24:
	.string	"argc"
.LASF6:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF10:
	.string	"printf"
.LASF26:
	.string	"rcnt"
.LASF25:
	.string	"argv"
.LASF8:
	.string	"long int"
.LASF17:
	.string	"long double"
.LASF4:
	.string	"signed char"
.LASF32:
	.string	"do_nothing"
.LASF22:
	.string	"test1"
.LASF21:
	.string	"test2"
.LASF20:
	.string	"test3"
.LASF27:
	.string	"rlcnt"
.LASF11:
	.string	"set_fpu_double"
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
