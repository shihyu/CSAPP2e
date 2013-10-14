	.file	"optarith.c"
	.intel_syntax
	.text
.globl arith
	.type	arith,@function
arith:
	push	%ebp
	mov	%ebp, %esp
	sub	%esp, 12
	mov	DWORD PTR [%ebp-4], 0
	mov	%eax, DWORD PTR [%ebp+8]
	mov	%edx, %eax
	sal	%edx, 4
	mov	DWORD PTR [%ebp-8], %edx
	sub	DWORD PTR [%ebp-8], %eax
	mov	%eax, DWORD PTR [%ebp+12]
	mov	DWORD PTR [%ebp-12], %eax
	cmp	DWORD PTR [%ebp-12], 0
	jns	.L2
	add	DWORD PTR [%ebp-12], 3
.L2:
	mov	%eax, DWORD PTR [%ebp-12]
	sar	%eax, 2
	add	%eax, DWORD PTR [%ebp-8]
	mov	DWORD PTR [%ebp-4], %eax
	mov	%eax, DWORD PTR [%ebp-4]
	leave
	ret
.Lfe1:
	.size	arith,.Lfe1-arith
.globl optarith
	.type	optarith,@function
optarith:
	push	%ebp
	mov	%ebp, %esp
	sub	%esp, 4
	mov	%eax, DWORD PTR [%ebp+8]
	mov	DWORD PTR [%ebp-4], %eax
	sal	DWORD PTR [%ebp+8], 4
	mov	%eax, DWORD PTR [%ebp-4]
	sub	DWORD PTR [%ebp+8], %eax
	cmp	DWORD PTR [%ebp+12], 0
	jns	.L4
	lea	%eax, [%ebp+12]
	add	DWORD PTR [%eax], 3
.L4:
	lea	%eax, [%ebp+12]
	sar	DWORD PTR [%eax], 2
	mov	%eax, DWORD PTR [%ebp+12]
	add	%eax, DWORD PTR [%ebp+8]
	leave
	ret
.Lfe2:
	.size	optarith,.Lfe2-optarith
	.section	.rodata
.LC0:
	.string	"Whoops! "
	.align 32
.LC1:
	.string	"x = %d, y = %d, normal --> %d, opt --> %d\n"
	.text
.globl main
	.type	main,@function
main:
	push	%ebp
	mov	%ebp, %esp
	sub	%esp, 40
	and	%esp, -16
	mov	%eax, 0
	sub	%esp, %eax
	mov	%eax, DWORD PTR [%ebp+12]
	add	%eax, 4
	mov	%eax, DWORD PTR [%eax]
	mov	DWORD PTR [%esp], %eax
	call	atoi
	mov	DWORD PTR [%ebp-4], %eax
	mov	%eax, DWORD PTR [%ebp+12]
	add	%eax, 8
	mov	%eax, DWORD PTR [%eax]
	mov	DWORD PTR [%esp], %eax
	call	atoi
	mov	DWORD PTR [%ebp-8], %eax
	mov	%eax, DWORD PTR [%ebp-8]
	mov	DWORD PTR [%esp+4], %eax
	mov	%eax, DWORD PTR [%ebp-4]
	mov	DWORD PTR [%esp], %eax
	call	arith
	mov	DWORD PTR [%ebp-12], %eax
	mov	%eax, DWORD PTR [%ebp-8]
	mov	DWORD PTR [%esp+4], %eax
	mov	%eax, DWORD PTR [%ebp-4]
	mov	DWORD PTR [%esp], %eax
	call	optarith
	mov	DWORD PTR [%ebp-16], %eax
	mov	%eax, DWORD PTR [%ebp-12]
	cmp	%eax, DWORD PTR [%ebp-16]
	je	.L6
	mov	DWORD PTR [%esp], OFFSET FLAT:.LC0
	call	printf
.L6:
	mov	%eax, DWORD PTR [%ebp-16]
	mov	DWORD PTR [%esp+16], %eax
	mov	%eax, DWORD PTR [%ebp-12]
	mov	DWORD PTR [%esp+12], %eax
	mov	%eax, DWORD PTR [%ebp-8]
	mov	DWORD PTR [%esp+8], %eax
	mov	%eax, DWORD PTR [%ebp-4]
	mov	DWORD PTR [%esp+4], %eax
	mov	DWORD PTR [%esp], OFFSET FLAT:.LC1
	call	printf
	leave
	ret
.Lfe3:
	.size	main,.Lfe3-main
	.ident	"GCC: (GNU) 3.2.3"
