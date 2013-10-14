	.file	"bufdemo.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl gets
	.type	 gets,@function
gets:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%esi
	movl %esi,%ebx
	jmp .L33
	.p2align 4,,7
.L35:
	movb %al,(%ebx)
	incl %ebx
.L33:
	movl stdin,%eax
	addl $-12,%esp
	pushl %eax
	call _IO_getc
	addl $16,%esp
	cmpl $10,%eax
	je .L34
	cmpl $-1,%eax
	jne .L35
.L34:
	movb $0,(%ebx)
	cmpl $-1,%eax
	je .L39
	movl %esi,%eax
	jmp .L40
	.p2align 4,,7
.L39:
	xorl %eax,%eax
.L40:
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 gets,.Lfe1-gets
	.align 4
.globl echo
	.type	 echo,@function
echo:
	pushl %ebp
	movl %esp,%ebp
	subl $20,%esp
	pushl %ebx
	addl $-12,%esp
	leal -4(%ebp),%ebx
	pushl %ebx
	call gets
	addl $-12,%esp
	pushl %ebx
	call puts
	movl -24(%ebp),%ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 echo,.Lfe2-echo
	.align 4
.globl good_echo
	.type	 good_echo,@function
good_echo:
	pushl %ebp
	movl %esp,%ebp
	subl $80,%esp
	pushl %esi
	pushl %ebx
	leal -64(%ebp),%esi
	.p2align 4,,7
.L45:
	movl stdin,%eax
	addl $-4,%esp
	pushl %eax
	pushl $64
	pushl %esi
	call fgets
	addl $16,%esp
	testl %eax,%eax
	je .L42
	xorl %ebx,%ebx
	movb -64(%ebp),%al
	testb %al,%al
	je .L48
	cmpb $10,%al
	je .L58
	.p2align 4,,7
.L50:
	movl stdout,%eax
	movsbl (%ebx,%esi),%edx
	addl $-8,%esp
	pushl %eax
	pushl %edx
	call _IO_putc
	addl $16,%esp
	cmpl $-1,%eax
	je .L42
	incl %ebx
	movb (%ebx,%esi),%al
	testb %al,%al
	je .L48
	cmpb $10,%al
	jne .L50
.L48:
	cmpb $10,(%ebx,%esi)
	jne .L45
.L58:
	movl stdout,%eax
	addl $-8,%esp
	pushl %eax
	pushl $10
	call _IO_putc
.L42:
	leal -88(%ebp),%esp
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe3:
	.size	 good_echo,.Lfe3-good_echo
.section	.rodata
.LC0:
	.string	"Type a string:"
.text
	.align 4
.globl main
	.type	 main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	subl $20,%esp
	pushl %ebx
	cmpl $1,8(%ebp)
	setg %al
	movzbl %al,%ebx
	addl $-12,%esp
	pushl $.LC0
	call printf
	addl $16,%esp
	testl %ebx,%ebx
	je .L60
	call good_echo
	jmp .L61
	.p2align 4,,7
.L60:
	call echo
.L61:
	movl -24(%ebp),%ebx
	xorl %eax,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe4:
	.size	 main,.Lfe4-main
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
