# Demonstration of data size suffixes
/* $begin asm-eg-suffix */
	# With suffixes
	# 1 byte operands
	addb %al, %bh
	movb $0xF3, (%esp)
	# 2 byte operands
	movw (%edi), %ax
	subw $12345, %dx		# Immediate data
	addw 0xBFFFFF0, %di		# Absolute address
	# 4 byte operands
	movl 8(%ebp), %eax
	xorl $0xF0F0F0F0, 8(%edx)
/* $end asm-eg-suffix */

	nop
	
/* $begin asm-eg-no-suffix */
	# Without suffixes
	# 1 byte operands
	add %al, %bh
	movb $0xF3, (%esp)		# Must designate size #line:asm:suffix1
	# 2 byte operands
	mov (%edi), %ax
	sub $12345, %dx			# Immediate data
	add 0xBFFFFF0, %di		# Absolute address
	# 4 byte operands
	mov 8(%ebp), %eax
	xorl $0xF0F0F0F0, 8(%edx)	# Must designate size #line:asm:suffix2
/* $end asm-eg-no-suffix */

