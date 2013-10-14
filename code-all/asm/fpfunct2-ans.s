	.file	"fpfunct2-ans.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl funct2
	.type	 funct2,@function
funct2:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	movl 8(%ebp),%eax
	fldl 12(%ebp)
	flds 20(%ebp)
	movl %eax,-4(%ebp)
	fildl -4(%ebp)
	fxch %st(2)
	faddp %st,%st(1)
	fdivrp %st,%st(1)
	fld1
	flds 24(%ebp)
	faddp %st,%st(1)
	movl %ebp,%esp
	popl %ebp
	fsubrp %st,%st(1)
	ret
.Lfe1:
	.size	 funct2,.Lfe1-funct2
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
