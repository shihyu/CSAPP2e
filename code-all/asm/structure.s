	.file	"structure.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl copy
	.type	 copy,@function
copy:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl %ebp,%esp
	movl (%edx),%eax
	movl %eax,4(%edx)
	popl %ebp
	ret
.Lfe1:
	.size	 copy,.Lfe1-copy
	.align 4
.globl set_i
	.type	 set_i,@function
set_i:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	movl %eax,(%edx)
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 set_i,.Lfe2-set_i
	.align 4
.globl set_a_ele
	.type	 set_a_ele,@function
set_a_ele:
	pushl %ebp
	movl %esp,%ebp
	movl 16(%ebp),%ecx
	movl 12(%ebp),%edx
	movl 8(%ebp),%eax
	sall $2,%edx
	addl $8,%eax
	movl %ecx,(%edx,%eax)
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe3:
	.size	 set_a_ele,.Lfe3-set_a_ele
	.align 4
.globl set_p
	.type	 set_p,@function
set_p:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	movl %eax,20(%edx)
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe4:
	.size	 set_p,.Lfe4-set_p
	.align 4
.globl find_a
	.type	 find_a,@function
find_a:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl %eax,p
	movl %edx,j
	leal 8(%eax,%edx,4),%ecx
	movl %eax,q
	movl %edx,k
	movl %ecx,%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe5:
	.size	 find_a,.Lfe5-find_a
	.align 4
.globl link_p
	.type	 link_p,@function
link_p:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl %ebp,%esp
	movl 4(%edx),%eax
	addl (%edx),%eax
	leal 8(%edx,%eax,4),%eax
	movl %eax,20(%edx)
	popl %ebp
	ret
.Lfe6:
	.size	 link_p,.Lfe6-link_p
	.comm	p,4,4
	.comm	q,4,4
	.comm	j,4,4
	.comm	k,4,4
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
