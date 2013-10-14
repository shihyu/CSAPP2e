	.file	"asmprobs-ans.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl full_umul
	.type	 full_umul,@function
full_umul:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%ecx
	movl 12(%ebp),%ebx
	movl 16(%ebp),%esi
#APP
	movl %ecx,%eax; mull %ebx; movl %eax,%ecx; movl %edx,%ebx
#NO_APP
	movl %ecx,(%esi)
	movl %ebx,4(%esi)
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 full_umul,.Lfe1-full_umul
	.align 4
.globl ok_smul
	.type	 ok_smul,@function
ok_smul:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 16(%ebp),%esi
	movl 8(%ebp),%eax
	imull 12(%ebp)
	movl %eax,%ecx
	movl %edx,%ebx
	movl %ecx,(%esi)
	xorl %esi,%esi
	cltd
	cmpl %ecx,%eax
	jne .L4
	cmpl %ebx,%edx
	sete %al
	movzbl %al,%esi
.L4:
	movl %esi,%eax
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 ok_smul,.Lfe2-ok_smul
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
