	.file	"array.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl get_value
	.type	 get_value,@function
get_value:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl 16(%ebp),%ecx
	sall $2,%ecx
	leal (%edx,%edx,2),%edx
	leal (%ecx,%edx,4),%edx
	movl %ebp,%esp
	popl %ebp
	movl (%eax,%edx),%eax
	ret
.Lfe1:
	.size	 get_value,.Lfe1-get_value
.globl B
.data
	.align 4
	.type	 B,@object
	.size	 B,16
B:
	.long row0
	.long row1
	.long row2
	.long row3
.text
	.align 4
.globl get_value2
	.type	 get_value2,@function
get_value2:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%ecx
	movl 12(%ebp),%eax
	movl 16(%ebp),%edx
	movl (%ecx,%eax,4),%eax
	movl %ebp,%esp
	popl %ebp
	movl (%eax,%edx,4),%eax
	ret
.Lfe2:
	.size	 get_value2,.Lfe2-get_value2
	.align 4
.globl fix_prod_ele
	.type	 fix_prod_ele,@function
fix_prod_ele:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 20(%ebp),%ecx
	movl 16(%ebp),%edx
	xorl %esi,%esi
	sall $2,%ecx
	addl 12(%ebp),%ecx
	sall $6,%edx
	addl 8(%ebp),%edx
	movl $15,%ebx
	.p2align 4,,7
.L23:
	movl (%edx),%eax
	imull (%ecx),%eax
	addl %eax,%esi
	addl $64,%ecx
	addl $4,%edx
	decl %ebx
	jns .L23
	movl %esi,%eax
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe3:
	.size	 fix_prod_ele,.Lfe3-fix_prod_ele
	.align 4
.globl fix_prod_ele_opt
	.type	 fix_prod_ele_opt,@function
fix_prod_ele_opt:
	pushl %ebp
	movl %esp,%ebp
	pushl %esi
	pushl %ebx
	movl 16(%ebp),%ecx
	movl 20(%ebp),%edx
	sall $6,%ecx
	addl 8(%ebp),%ecx
	sall $2,%edx
	addl 12(%ebp),%edx
	movl $15,%ebx
	xorl %esi,%esi
	.p2align 4,,7
.L29:
	movl (%ecx),%eax
	imull (%edx),%eax
	addl %eax,%esi
	addl $4,%ecx
	addl $64,%edx
	decl %ebx
	jns .L29
	movl %esi,%eax
	popl %ebx
	popl %esi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe4:
	.size	 fix_prod_ele_opt,.Lfe4-fix_prod_ele_opt
	.align 4
.globl fix_ele
	.type	 fix_ele,@function
fix_ele:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl 16(%ebp),%edx
	movl 12(%ebp),%ecx
	sall $2,%edx
	sall $6,%ecx
	addl %ecx,%edx
	movl %ebp,%esp
	popl %ebp
	movl (%eax,%edx),%eax
	ret
.Lfe5:
	.size	 fix_ele,.Lfe5-fix_ele
	.align 4
.globl new_var_matrix
	.type	 new_var_matrix,@function
new_var_matrix:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	movl 8(%ebp),%eax
	imull %eax,%eax
	addl $-8,%esp
	pushl %eax
	pushl $4
	call calloc
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe6:
	.size	 new_var_matrix,.Lfe6-new_var_matrix
	.align 4
.globl var_ele
	.type	 var_ele,@function
var_ele:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%edx
	movl 12(%ebp),%eax
	imull 20(%ebp),%eax
	addl 16(%ebp),%eax
	movl %ebp,%esp
	popl %ebp
	movl (%edx,%eax,4),%eax
	ret
.Lfe7:
	.size	 var_ele,.Lfe7-var_ele
	.align 4
.globl var_prod_ele
	.type	 var_prod_ele,@function
var_prod_ele:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 16(%ebp),%edx
	xorl %esi,%esi
	cmpl 24(%ebp),%esi
	jge .L35
	imull 24(%ebp),%edx
	movl 8(%ebp),%eax
	movl 20(%ebp),%ecx
	leal (%eax,%edx,4),%ebx
	movl 24(%ebp),%edx
	.p2align 4,,7
.L37:
	movl 12(%ebp),%eax
	movl (%ebx),%edi
	addl $4,%ebx
	imull (%eax,%ecx,4),%edi
	addl %edi,%esi
	addl 24(%ebp),%ecx
	decl %edx
	jnz .L37
.L35:
	movl %esi,%eax
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe8:
	.size	 var_prod_ele,.Lfe8-var_prod_ele
	.align 4
.globl var_prod_ele_opt
	.type	 var_prod_ele_opt,@function
var_prod_ele_opt:
	pushl %ebp
	movl %esp,%ebp
	subl $12,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	movl 24(%ebp),%eax
	imull 16(%ebp),%eax
	movl 24(%ebp),%ebx
	leal 0(,%eax,4),%ecx
	addl 8(%ebp),%ecx
	movl %ebx,%edx
	xorl %esi,%esi
	testl %edx,%edx
	jg .L44
	xorl %eax,%eax
	jmp .L45
	.p2align 4,,7
.L44:
	movl 12(%ebp),%eax
	movl (%ecx),%edi
	addl $4,%ecx
	imull (%eax,%ebx,4),%edi
	addl %edi,%esi
	addl 24(%ebp),%ebx
	decl %edx
	jnz .L44
	movl %esi,%eax
.L45:
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe9:
	.size	 var_prod_ele_opt,.Lfe9-var_prod_ele_opt
	.align 4
.globl fix_set_diag
	.type	 fix_set_diag,@function
fix_set_diag:
	pushl %ebp
	movl %esp,%ebp
	movl 12(%ebp),%edx
	movl 8(%ebp),%eax
	movl $15,%ecx
	addl $1020,%eax
	.p2align 4,,7
.L50:
	movl %edx,(%eax)
	addl $-68,%eax
	decl %ecx
	jns .L50
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe10:
	.size	 fix_set_diag,.Lfe10-fix_set_diag
	.align 4
.globl fix_set_diag_opt
	.type	 fix_set_diag_opt,@function
fix_set_diag_opt:
	pushl %ebp
	movl %esp,%ebp
	movl 12(%ebp),%edx
	movl 8(%ebp),%eax
	addl $1020,%eax
	movl $15,%ecx
	.p2align 4,,7
.L56:
	movl %edx,(%eax)
	addl $-68,%eax
	decl %ecx
	jns .L56
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe11:
	.size	 fix_set_diag_opt,.Lfe11-fix_set_diag_opt
	.comm	A,48,32
	.comm	row0,12,4
	.comm	row1,12,4
	.comm	row2,12,4
	.comm	row3,12,4
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
