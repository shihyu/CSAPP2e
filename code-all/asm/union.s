	.file	"union.c"
	.version	"01.01"
gcc2_compiled.:
.text
	.align 4
.globl float2bit
	.type	 float2bit,@function
float2bit:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe1:
	.size	 float2bit,.Lfe1-float2bit
	.align 4
.globl copy
	.type	 copy,@function
copy:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp),%eax
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe2:
	.size	 copy,.Lfe2-copy
	.align 4
.globl bit2double
	.type	 bit2double,@function
bit2double:
	pushl %ebp
	movl %esp,%ebp
	subl $24,%esp
	movl 8(%ebp),%eax
	movl 12(%ebp),%edx
	movl %eax,-8(%ebp)
	movl %edx,-4(%ebp)
	fldl -8(%ebp)
	movl %ebp,%esp
	popl %ebp
	ret
.Lfe3:
	.size	 bit2double,.Lfe3-bit2double
	.ident	"GCC: (GNU) 2.95.3 20010315 (release)"
