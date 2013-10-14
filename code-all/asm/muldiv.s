	.file	"muldiv.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl shrink
	.type	 shrink,@function
shrink:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 shrink,.Lfe1-shrink
	.align 4
.globl prod
	.type	 prod,@function
prod:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	movl 8(%ebp),%eax
	imull 12(%ebp)
	addl $-8,%esp
	pushl %edx
	pushl %eax
	call shrink
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 prod,.Lfe2-prod
	.align 4
.globl combine
	.type	 combine,@function
combine:
	pushl %ebp
	movl %esp,%ebp
	movl 12(%ebp),%eax
	addl 8(%ebp),%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe3:
	.size	 combine,.Lfe3-combine
	.align 4
.globl div
	.type	 div,@function
div:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	movl 8(%ebp),%eax
	cltd
	idivl 12(%ebp)
	addl $-8,%esp
	pushl %eax
	pushl %edx
	call combine
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe4:
	.size	 div,.Lfe4-div
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
