	.file	"shift.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl shift_left2_rightn
	.type	 shift_left2_rightn,@function
shift_left2_rightn:
	pushl %ebp
	movl %esp,%ebp
	movl 12(%ebp),%ecx
	movl 8(%ebp),%eax
	sall $2,%eax
	sarl %cl,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 shift_left2_rightn,.Lfe1-shift_left2_rightn
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
