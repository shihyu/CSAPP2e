	.file	"decode1-ans.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl decode1
	.type	 decode1,@function
decode1:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 8(%ebp),%edi
	movl 12(%ebp),%ebx
	movl 16(%ebp),%esi
	movl (%edi),%eax
	movl (%ebx),%edx
	movl (%esi),%ecx
	movl %eax,(%ebx)
	movl %edx,(%esi)
	movl %ecx,(%edi)
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 decode1,.Lfe1-decode1
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
