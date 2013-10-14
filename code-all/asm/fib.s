	.file	"fib.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl fib_dw
	.type	 fib_dw,@function
fib_dw:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%esi
	xorl %ecx,%ecx
	xorl %ebx,%ebx
	movl $1,%edx
	.p2align 4,,7
.L6:
	leal (%edx,%ebx),%eax
	movl %edx,%ebx
	movl %eax,%edx
	incl %ecx
	cmpl %esi,%ecx
	jl .L6
	movl %ebx,%eax
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 fib_dw,.Lfe1-fib_dw
	.align 4
.globl fib_w
	.type	 fib_w,@function
fib_w:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%eax
	movl $1,%ebx
	movl $1,%ecx
	cmpl %eax,%ebx
	jge .L9
	leal -1(%eax),%edx
	.p2align 4,,7
.L10:
	leal (%ecx,%ebx),%eax
	movl %ecx,%ebx
	movl %eax,%ecx
	decl %edx
	jnz .L10
.L9:
	movl %ebx,%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 fib_w,.Lfe2-fib_w
	.align 4
.globl fib_w_goto
	.type	 fib_w_goto,@function
fib_w_goto:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%eax
	movl $1,%ecx
	movl $1,%ebx
	cmpl %eax,%ecx
	jge .L14
	leal -1(%eax),%edx
.L15:
	leal (%ebx,%ecx),%eax
	movl %ebx,%ecx
	movl %eax,%ebx
	decl %edx
	jnz .L15
.L14:
	movl %ecx,%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe3:
	.size	 fib_w_goto,.Lfe3-fib_w_goto
	.align 4
.globl fib_f
	.type	 fib_f,@function
fib_f:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%eax
	movl $1,%ebx
	movl $1,%ecx
	cmpl %eax,%ebx
	jge .L19
	leal -1(%eax),%edx
	.p2align 4,,7
.L21:
	leal (%ecx,%ebx),%eax
	movl %ecx,%ebx
	movl %eax,%ecx
	decl %edx
	jnz .L21
.L19:
	movl %ebx,%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe4:
	.size	 fib_f,.Lfe4-fib_f
	.align 4
.globl fib_rec
	.type	 fib_rec,@function
fib_rec:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ebx
	cmpl $2,%ebx
	jle .L24
	addl $-12,%esp
	leal -2(%ebx),%eax
	pushl %eax
	call fib_rec
	movl %eax,%esi
	addl $-12,%esp
	leal -1(%ebx),%eax
	pushl %eax
	call fib_rec
	addl %esi,%eax
	jmp .L25
	.p2align 4,,7
.L24:
	movl $1,%eax
.L25:
	leal -24(%ebp),%esp
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe5:
	.size	 fib_rec,.Lfe5-fib_rec
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
