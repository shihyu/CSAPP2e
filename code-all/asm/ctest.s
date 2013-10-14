	.file	"ctest.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl ctest
	.type	 ctest,@function
ctest:
	pushl %ebp
	movl %esp,%ebp
	subl $16,%esp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%esi
	cmpl %esi,%ecx
	setl %al
	cmpl %ecx,%esi
	setb -1(%ebp)
	cmpw %cx,16(%ebp)
	setge -2(%ebp)
	movb %cl,%dl
	cmpb 16(%ebp),%dl
	setne %bl
	cmpl %esi,16(%ebp)
	setg -3(%ebp)
	testl %ecx,%ecx
	setg %dl
	addb -1(%ebp),%al
	addb -2(%ebp),%al
	addb %bl,%al
	addb -3(%ebp),%al
	addb %dl,%al
	movsbl %al,%eax
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 ctest,.Lfe1-ctest
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
