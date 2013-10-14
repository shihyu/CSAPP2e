	.file	"exchange.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl exchange
	.type	 exchange,@function
exchange:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl %ebp,%esp
	movl (%eax),%ecx
	movl %edx,(%eax)
	movl %ecx,%eax
	popl %ebp
	ret
.Lfe1:
	.size	 exchange,.Lfe1-exchange
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
