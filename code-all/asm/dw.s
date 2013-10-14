	.file	"dw.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl dw_loop
	.type	 dw_loop,@function
dw_loop:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%esi
	movl 12(%ebp),%ebx
	movl 16(%ebp),%ecx
	.p2align 4,,7
.L6:
	imull %ecx,%ebx
	addl %ecx,%esi
	decl %ecx
	testl %ecx,%ecx
	setg %al
	cmpl %ecx,%ebx
	setl %dl
	andl %edx,%eax
	testb $1,%al
	jne .L6
	movl %esi,%eax
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 dw_loop,.Lfe1-dw_loop
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
