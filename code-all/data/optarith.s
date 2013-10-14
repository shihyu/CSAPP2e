	.file	"optarith.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl optarith
	.type	 optarith,@function
optarith:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx  # t = x; 
	movl 12(%ebp),%eax # y
	sall $4,%edx       # x <<= 4; 
	subl 8(%ebp),%edx  # x -= t; 
	testl %eax,%eax    
	jge .L3
	addl $3,%eax       # if (y < 0) y -= 3; 
.L3:
	sarl $2,%eax       # y >>= 4; 
	addl %edx,%eax     # return x+y; 
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 optarith,.Lfe1-optarith
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
