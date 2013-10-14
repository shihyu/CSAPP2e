	.file	"while.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl loop_while
	.type	 loop_while,@function
loop_while:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%ebx
	xorl %ecx,%ecx
	movl %eax,%edx
	.p2align 4,,7
.L5:
	addl %eax,%edx
	subl %ebx,%eax
	addl %ebx,%ecx
	cmpl $255,%ecx
	jle .L5
	movl %edx,%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 loop_while,.Lfe1-loop_while
	.align 4
.globl loop_while_goto
	.type	 loop_while_goto,@function
loop_while_goto:
	pushl %ebp
	movl %esp,%ebp
	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%ebx
	xorl %ecx,%ecx
	movl %eax,%edx
.L8:
	addl %eax,%edx
	subl %ebx,%eax
	addl %ebx,%ecx
	cmpl $255,%ecx
	jle .L8
	movl %edx,%eax
	popl %ebx
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 loop_while_goto,.Lfe2-loop_while_goto
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
