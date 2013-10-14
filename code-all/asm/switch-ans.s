	.file	"switch-ans.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl switch_prob
	.type	 switch_prob,@function
switch_prob:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 switch_prob,.Lfe1-switch_prob
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
