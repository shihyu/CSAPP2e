# Demonstration of data size suffixes

	# With suffixes
	# 1 byte operands
	movb $0xF3, (%rsp)
	addb %al, %ah
	# 2 byte operands
	movw (%rsp), %ax
	subw $12345, -16(%ebp)
	# 4 byte operands
	movl 8(%rbp), %eax
	xorl $0xF0F0F0F0, 8(%rdx)
	# 8 byte operands (x86-64 only)
	movq $0x0123456789ABCDEF, %rax
	addq %r8, 0x10(%rsp)

	# Without suffixes
	# 1 byte operands
	movb $0xF3, (%rsp)		# Must designate size
	add %al, %ah
	# 2 byte operands
	mov (%rsp), %ax
	subw $12345, -16(%rbp)		# Must designate size
	# 4 byte operands
	mov 8(%rbp), %eax
	xorl $0xF0F0F0F0, 8(%rdx)	# Must designate size
	# 8 byte operands (x86-64 only)
	mov $0x0123456789ABCDEF, %rax
	add %r8, 0x10(%rsp)
