	.file	"simple-if.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl cond
	.type	 cond,@function
cond:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	testl %eax,%eax
	je .L3
	testl %edx,%edx
	jle .L3
	addl %edx,(%eax)
.L3:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 cond,.Lfe1-cond
	.align 4
.globl goto_cond
	.type	 goto_cond,@function
goto_cond:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	testl %eax,%eax
	je .L6
	testl %edx,%edx
	jle .L6
	addl %edx,(%eax)
.L6:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 goto_cond,.Lfe2-goto_cond
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
