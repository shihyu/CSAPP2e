	.file	"list.c"
	.text
	.p2align 4,,15
.globl val
	.type	val, @function
val:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L3
	movl	(%edx), %eax
.L3:
	popl	%ebp
	ret
	.size	val, .-val
	.p2align 4,,15
.globl next
	.type	next, @function
next:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L8
	movl	4(%edx), %eax
.L8:
	popl	%ebp
	ret
	.size	next, .-next
	.p2align 4,,15
.globl is_null
	.type	is_null, @function
is_null:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	cmpl	$0, 8(%ebp)
	popl	%ebp
	sete	%al
	ret
	.size	is_null, .-is_null
	.p2align 4,,15
.globl sum_list_rec
	.type	sum_list_rec, @function
sum_list_rec:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L14
	movl	4(%edx), %eax
	movl	(%edx), %ebx
	movl	%eax, (%esp)
	call	sum_list_rec
	addl	%ebx, %eax
.L14:
	addl	$4, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	sum_list_rec, .-sum_list_rec
	.p2align 4,,15
.globl dsum_list_rec
	.type	dsum_list_rec, @function
dsum_list_rec:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	testl	%eax, %eax
	je	.L20
	fildl	(%eax)
	movl	4(%eax), %eax
	fstpl	-8(%ebp)
	movl	%eax, (%esp)
	call	dsum_list_rec
	faddl	-8(%ebp)
	leave
	ret
	.p2align 4,,7
	.p2align 3
.L20:
	fldz
	leave
	ret
	.size	dsum_list_rec, .-dsum_list_rec
	.p2align 4,,15
.globl diff_list_rec
	.type	diff_list_rec, @function
diff_list_rec:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L23
	movl	4(%edx), %eax
	movl	(%edx), %ebx
	movl	%eax, (%esp)
	call	diff_list_rec
	subl	%eax, %ebx
	movl	%ebx, %eax
.L23:
	addl	$4, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	diff_list_rec, .-diff_list_rec
	.p2align 4,,15
.globl diff_list_rec_helper
	.type	diff_list_rec_helper, @function
diff_list_rec_helper:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	movl	8(%ebp), %ecx
	movl	12(%ebp), %edx
	testl	%ecx, %ecx
	je	.L27
	movl	%edx, %ebx
	negl	%edx
	imull	(%ecx), %ebx
	movl	%edx, 4(%esp)
	movl	4(%ecx), %eax
	movl	%eax, (%esp)
	call	diff_list_rec_helper
	addl	%ebx, %eax
.L27:
	addl	$20, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	diff_list_rec_helper, .-diff_list_rec_helper
	.p2align 4,,15
.globl diff_list_rec2
	.type	diff_list_rec2, @function
diff_list_rec2:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	diff_list_rec_helper
	leave
	ret
	.size	diff_list_rec2, .-diff_list_rec2
	.p2align 4,,15
.globl diff_list_iter1
	.type	diff_list_iter1, @function
diff_list_iter1:
	pushl	%ebp
	movl	$1, %ecx
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	pushl	%ebx
	xorl	%ebx, %ebx
	testl	%edx, %edx
	je	.L33
	.p2align 4,,7
	.p2align 3
.L36:
	movl	%ecx, %eax
	negl	%ecx
	imull	(%edx), %eax
	movl	4(%edx), %edx
	addl	%eax, %ebx
	testl	%edx, %edx
	jne	.L36
.L33:
	movl	%ebx, %eax
	popl	%ebx
	popl	%ebp
	ret
	.size	diff_list_iter1, .-diff_list_iter1
	.p2align 4,,15
.globl sum_list_rec_abs
	.type	sum_list_rec_abs, @function
sum_list_rec_abs:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	%esi, -4(%ebp)
	movl	8(%ebp), %esi
	movl	%ebx, -8(%ebp)
	movl	%esi, (%esp)
	call	is_null
	xorl	%edx, %edx
	testl	%eax, %eax
	jne	.L40
	movl	%esi, (%esp)
	call	val
	movl	%esi, (%esp)
	movl	%eax, %ebx
	call	next
	movl	%eax, (%esp)
	call	sum_list_rec_abs
	leal	(%eax,%ebx), %edx
.L40:
	movl	-8(%ebp), %ebx
	movl	%edx, %eax
	movl	-4(%ebp), %esi
	movl	%ebp, %esp
	popl	%ebp
	ret
	.size	sum_list_rec_abs, .-sum_list_rec_abs
	.p2align 4,,15
.globl sum_list_tail
	.type	sum_list_tail, @function
sum_list_tail:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	testl	%edx, %edx
	je	.L43
	addl	(%edx), %eax
	movl	%eax, 4(%esp)
	movl	4(%edx), %eax
	movl	%eax, (%esp)
	call	sum_list_tail
.L43:
	leave
	ret
	.size	sum_list_tail, .-sum_list_tail
	.p2align 4,,15
.globl sum_list_tail_call
	.type	sum_list_tail_call, @function
sum_list_tail_call:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	sum_list_tail
	leave
	ret
	.size	sum_list_tail_call, .-sum_list_tail_call
	.p2align 4,,15
.globl sum_list_iter
	.type	sum_list_iter, @function
sum_list_iter:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L49
	.p2align 4,,7
	.p2align 3
.L52:
	addl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	jne	.L52
.L49:
	popl	%ebp
	ret
	.size	sum_list_iter, .-sum_list_iter
	.p2align 4,,15
.globl sum_list_iter_abs
	.type	sum_list_iter_abs, @function
sum_list_iter_abs:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	xorl	%esi, %esi
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %ebx
	jmp	.L55
	.p2align 4,,7
	.p2align 3
.L56:
	movl	%ebx, (%esp)
	call	val
	movl	%ebx, (%esp)
	addl	%eax, %esi
	call	next
	movl	%eax, %ebx
.L55:
	movl	%ebx, (%esp)
	call	is_null
	testl	%eax, %eax
	je	.L56
	addl	$4, %esp
	movl	%esi, %eax
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.size	sum_list_iter_abs, .-sum_list_iter_abs
	.p2align 4,,15
.globl sum_list_iter_expand
	.type	sum_list_iter_expand, @function
sum_list_iter_expand:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L60
	.p2align 4,,7
	.p2align 3
.L63:
	addl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	jne	.L63
.L60:
	popl	%ebp
	ret
	.size	sum_list_iter_expand, .-sum_list_iter_expand
	.p2align 4,,15
.globl max
	.type	max, @function
max:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	cmpl	%edx, %eax
	jge	.L66
	movl	%edx, %eax
.L66:
	popl	%ebp
	ret
	.size	max, .-max
	.p2align 4,,15
.globl max_list_rec
	.type	max_list_rec, @function
max_list_rec:
	pushl	%ebp
	movl	$-2147483648, %eax
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	movl	8(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L70
	movl	4(%ebx), %eax
	movl	%eax, (%esp)
	call	max_list_rec
	movl	%eax, 4(%esp)
	movl	(%ebx), %eax
	movl	%eax, (%esp)
	call	max
.L70:
	addl	$20, %esp
	popl	%ebx
	popl	%ebp
	ret
	.size	max_list_rec, .-max_list_rec
	.p2align 4,,15
.globl max_list_tail
	.type	max_list_tail, @function
max_list_tail:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	movl	8(%ebp), %ebx
	movl	12(%ebp), %edx
	testl	%ebx, %ebx
	je	.L73
	movl	(%ebx), %eax
	movl	%edx, (%esp)
	movl	%eax, 4(%esp)
	call	max
	movl	%eax, 4(%esp)
	movl	4(%ebx), %eax
	movl	%eax, (%esp)
	call	max_list_tail
	movl	%eax, %edx
.L73:
	addl	$20, %esp
	movl	%edx, %eax
	popl	%ebx
	popl	%ebp
	ret
	.size	max_list_tail, .-max_list_tail
	.p2align 4,,15
.globl max_list_tail_call
	.type	max_list_tail_call, @function
max_list_tail_call:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %eax
	movl	$-2147483648, 4(%esp)
	movl	%eax, (%esp)
	call	max_list_tail
	leave
	ret
	.size	max_list_tail_call, .-max_list_tail_call
	.p2align 4,,15
.globl sum_list_iter2
	.type	sum_list_iter2, @function
sum_list_iter2:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	testl	%edx, %edx
	je	.L79
	movl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	je	.L79
	.p2align 4,,7
	.p2align 3
.L82:
	addl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	jne	.L82
.L79:
	popl	%ebp
	ret
	.size	sum_list_iter2, .-sum_list_iter2
	.p2align 4,,15
.globl sum_list_itail
	.type	sum_list_itail, @function
sum_list_itail:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	testl	%edx, %edx
	je	.L85
	.p2align 4,,7
	.p2align 3
.L88:
	addl	(%edx), %eax
	movl	4(%edx), %edx
	testl	%edx, %edx
	jne	.L88
.L85:
	popl	%ebp
	ret
	.size	sum_list_itail, .-sum_list_itail
	.p2align 4,,15
.globl new_ele
	.type	new_ele, @function
new_ele:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	$8, (%esp)
	call	malloc
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	leave
	ret
	.size	new_ele, .-new_ele
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
