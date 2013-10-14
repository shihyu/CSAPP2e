	.file	"optfuns.c"
	.text
.globl select
	.type	select, @function
select:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	16(%ebp), %edx
	movl	$0, %eax
	cmpl	$1, %edx
	ja	.L3
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	%edx, %eax
	andl	$1, %eax
	movl	-8(%ebp,%eax,4), %eax
.L3:
	leave
	ret
	.size	select, .-select
.globl test_select
	.type	test_select, @function
test_select:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$12, %esp
	movl	$1, 8(%esp)
	movl	$6, 4(%esp)
	movl	$5, (%esp)
	call	select
	leave
	ret
	.size	test_select, .-test_select
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
