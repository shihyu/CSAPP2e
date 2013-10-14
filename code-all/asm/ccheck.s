	.file	"ccheck.c"
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"Pos = %p, value = 0x%x, Pos ^ value = 0x%x, Pos - value = 0x%x\n"
	.text
.globl report
	.type	report, @function
report:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %ecx
	movl	(%ecx), %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	movl	%eax, 20(%esp)
	movl	%ecx, %eax
	xorl	%edx, %eax
	movl	%eax, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leave
	ret
	.size	report, .-report
.globl fun
	.type	fun, @function
fun:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	%gs:20, %eax
	movl	%eax, -4(%ebp)
	xorl	%eax, %eax
	leal	-4(%ebp), %eax
	movl	%eax, (%esp)
	call	report
	movl	-4(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L5
	call	__stack_chk_fail
.L5:
	leave
	.p2align 4,,5
	.p2align 3
	ret
	.size	fun, .-fun
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Hi!"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ecx
	subl	$4, %esp
	movl	$.LC1, (%esp)
	call	fun
	movl	$0, %eax
	addl	$4, %esp
	popl	%ecx
	popl	%ebp
	leal	-4(%ecx), %esp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
