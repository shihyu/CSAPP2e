	.file	"switch.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl switch_eg
	.type	 switch_eg,@function
switch_eg:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	leal -100(%edx),%eax
	cmpl $6,%eax
	ja .L9
	jmp *.L10(,%eax,4)
	.p2align 4,,7
.section	.rodata
	.align 4
	.align 4
.L10:
	.long .L4
	.long .L9
	.long .L5
	.long .L6
	.long .L8
	.long .L9
	.long .L8
.text
	.p2align 4,,7
.L4:
	leal (%edx,%edx,2),%eax
	leal (%edx,%eax,4),%edx
	jmp .L3
	.p2align 4,,7
.L5:
	addl $10,%edx
.L6:
	addl $11,%edx
	jmp .L3
	.p2align 4,,7
.L8:
	imull %edx,%edx
	jmp .L3
	.p2align 4,,7
.L9:
	xorl %edx,%edx
.L3:
	movl %edx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 switch_eg,.Lfe1-switch_eg
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"






