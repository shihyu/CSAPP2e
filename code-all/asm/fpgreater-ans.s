	.file	"fpgreater-ans.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl greater
	.type	 greater,@function
greater:
	pushl %ebp
	movl %esp,%ebp
	fldl 16(%ebp)
	fcompl 8(%ebp)
	fnstsw %ax
	andb $69,%ah
	cmpb $1,%ah
	sete %al
	movzbl %al,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 greater,.Lfe1-greater
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
