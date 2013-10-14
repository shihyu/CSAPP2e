	.file	"okmul.c"
	.text
.globl tmult_ok1
	.type	tmult_ok1, @function
tmult_ok1:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	imull	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%eax, (%edx)
#APP
# 21 "okmul.c" 1
	setae %al
# 0 "" 2
#NO_APP
	movl	$0, %eax
	popl	%ebp
	ret
	.size	tmult_ok1, .-tmult_ok1
.globl tmult_ok2
	.type	tmult_ok2, @function
tmult_ok2:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	12(%ebp), %eax
	imull	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%eax, (%edx)
#APP
# 32 "okmul.c" 1
	setae %bl          # Set low-order byte
	movzbl %bl,%eax  # Zero extend to be result
# 0 "" 2
#NO_APP
	popl	%ebx
	popl	%ebp
	ret
	.size	tmult_ok2, .-tmult_ok2
.globl tmult_ok3
	.type	tmult_ok3, @function
tmult_ok3:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax
	imull	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%eax, (%edx)
#APP
# 49 "okmul.c" 1
	setae %al            # Set result
# 0 "" 2
#NO_APP
	movzbl	%al, %eax
	popl	%ebp
	ret
	.size	tmult_ok3, .-tmult_ok3
.globl umult_ok
	.type	umult_ok, @function
umult_ok:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	12(%ebp), %ebx
	movl	8(%ebp), %ecx
#APP
# 70 "okmul.c" 1
	movl %ecx,%eax      # Get x
	mull %ebx            # Unsigned multiply by y
	movl %eax,%ecx      # Store low-order 4 bytes at dest
	setae %bl           # Set result
# 0 "" 2
#NO_APP
	movl	16(%ebp), %eax
	movl	%ecx, (%eax)
	movzbl	%bl, %eax
	popl	%ebx
	popl	%ebp
	ret
	.size	umult_ok, .-umult_ok
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align 4
.LC0:
	.string	"Signed multiply: %d*%d->%d, ok = %d\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"OK"
.LC2:
	.string	"ERR"
	.section	.rodata.str1.4
	.align 4
.LC3:
	.string	"%s tmult_ok_asm: %d*%d->%d, ok = %d\n"
	.align 4
.LC4:
	.string	"%s tmult_ok1: %d*%d->%d, ok = %d\n"
	.align 4
.LC5:
	.string	"%s tmult_ok2: %d*%d->%d, ok = %d\n"
	.align 4
.LC6:
	.string	"%s tmult_ok3: %d*%d->%d, ok = %d\n"
	.align 4
.LC7:
	.string	"\nUnsigned multiply: %u*%u->%u, ok = %d\n"
	.align 4
.LC8:
	.string	"%s umult_ok_asm: %u*%u->%u, ok = %d\n"
	.align 4
.LC9:
	.string	"%s umult_ok: %u*%u->%u, ok = %d\n"
	.text
.globl main
	.type	main, @function
main:
	leal	4(%esp), %ecx
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	subl	$56, %esp
	movl	(%ecx), %edi
	movl	4(%ecx), %ecx
	movl	%ecx, -44(%ebp)
	movl	$65536, %ebx
	cmpl	$1, %edi
	jle	.L11
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	-44(%ebp), %edx
	movl	4(%edx), %eax
	movl	%eax, (%esp)
	call	strtol
	movl	%eax, %ebx
.L11:
	movl	$65535, %esi
	cmpl	$2, %edi
	jle	.L13
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	-44(%ebp), %edx
	movl	8(%edx), %eax
	movl	%eax, (%esp)
	call	strtol
	movl	%eax, %esi
.L13:
	movl	$1, %edi
	testl	%ebx, %ebx
	je	.L15
	movl	%esi, %edx
	imull	%ebx, %edx
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	%ebx
	cmpl	%eax, %esi
	sete	%al
	movzbl	%al, %edi
.L15:
	movl	%esi, %eax
	imull	%ebx, %eax
	movl	%eax, -40(%ebp)
	movl	%edi, 20(%esp)
	movl	%eax, 16(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	tmult_ok_asm
	movl	-20(%ebp), %edx
	cmpl	%eax, %edi
	jne	.L16
	movl	$.LC1, %ecx
	cmpl	%edx, -40(%ebp)
	je	.L17
.L16:
	movl	$.LC2, %ecx
.L17:
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	tmult_ok1
	movl	-20(%ebp), %edx
	cmpl	%eax, %edi
	jne	.L18
	movl	$.LC1, %ecx
	cmpl	%edx, -40(%ebp)
	je	.L19
.L18:
	movl	$.LC2, %ecx
.L19:
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	tmult_ok2
	movl	-20(%ebp), %edx
	cmpl	%eax, %edi
	jne	.L20
	movl	$.LC1, %ecx
	cmpl	%edx, -40(%ebp)
	je	.L21
.L20:
	movl	$.LC2, %ecx
.L21:
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC5, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	tmult_ok2
	movl	-20(%ebp), %edx
	cmpl	%eax, %edi
	jne	.L22
	movl	$.LC1, %ecx
	cmpl	%edx, -40(%ebp)
	je	.L23
.L22:
	movl	$.LC2, %ecx
.L23:
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC5, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	tmult_ok3
	movl	-20(%ebp), %edx
	cmpl	%eax, %edi
	jne	.L24
	movl	$.LC1, %ecx
	cmpl	%edx, -40(%ebp)
	je	.L25
.L24:
	movl	$.LC2, %ecx
.L25:
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC6, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$1, %edi
	testl	%ebx, %ebx
	je	.L27
	movl	%esi, %eax
	imull	%ebx, %eax
	movl	$0, %edx
	divl	%ebx
	cmpl	%esi, %eax
	sete	%al
	movzbl	%al, %edi
.L27:
	movl	%esi, %edx
	imull	%ebx, %edx
	movl	%edx, -36(%ebp)
	movl	%edi, 20(%esp)
	movl	%edx, 16(%esp)
	movl	%esi, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	$.LC7, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leal	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	umult_ok_asm
	movl	-24(%ebp), %edx
	cmpl	%eax, %edi
	jne	.L28
	movl	$.LC1, %ecx
	cmpl	%edx, -36(%ebp)
	je	.L29
.L28:
	movl	$.LC2, %ecx
.L29:
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	leal	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%esi, 4(%esp)
	movl	%ebx, (%esp)
	call	umult_ok
	movl	-24(%ebp), %edx
	cmpl	%eax, %edi
	jne	.L30
	movl	$.LC1, %ecx
	cmpl	%edx, -36(%ebp)
	je	.L31
.L30:
	movl	$.LC2, %ecx
.L31:
	movl	%eax, 24(%esp)
	movl	%edx, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC9, 4(%esp)
	movl	$1, (%esp)
	call	__printf_chk
	movl	$0, (%esp)
	call	exit
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.3.2-1ubuntu11) 4.3.2"
	.section	.note.GNU-stack,"",@progbits
