	.file	"absdiff2-ans.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl absdiff2
	.type	 absdiff2,@function
absdiff2:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%ecx
	movl %edx,%eax
	subl %ecx,%eax
	cmpl %ecx,%edx
	jge .L3
	movl %ecx,%eax
	subl %edx,%eax
.L3:
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 absdiff2,.Lfe1-absdiff2
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
