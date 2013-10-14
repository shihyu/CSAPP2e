	.file	"swapadd.c"
	.text
	.p2align 4,,15
.globl swap_add
	.type	swap_add, @function
swap_add:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	12(%ebp), %ecx
	pushl	%ebx
	movl	(%edx), %ebx
	movl	(%ecx), %eax
	movl	%eax, (%edx)
	addl	%ebx, %eax
	movl	%ebx, (%ecx)
	popl	%ebx
	popl	%ebp
	ret
	.size	swap_add, .-swap_add
	.p2align 4,,15
.globl caller
	.type	caller, @function
caller:
	pushl	%ebp
	movl	$832093, %eax
	movl	%esp, %ebp
	popl	%ebp
	ret
	.size	caller, .-caller
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
