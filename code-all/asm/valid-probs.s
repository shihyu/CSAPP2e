# For each of these instructions, determine:
	# 1. Is this valid IA32? (Explain)
	# For valid cases
		# 2. What is the operand size (in bytes)?
		# 3. Could we drop the size suffix?

# Part A
	movb (%eax), %cl	# Yes / 1 / yes
	movl 24(%esp), -16(%ebp) # No (Can't have memory-memory)
	movw 4(%esp), %eax	# No (operand size mismatch)
	imulw $0xFF, %dx	# Yes / 2 / yes
	addl $1000, (%edx)	# Yes / 4 / no
	xorw (%bx), %cx		# No (Addresses require 4-byte registers)
	subw %dx, %di		# Yes / 2 / yes
	xorb $0xF0F0, %dh	# No (Constant too large)
	addw 0xF0F0, %si	# Yes (absolute address) / 2 / yes	

# Checking suffix removal	
	mov (%eax), %cl		# Yes / 1 / yes
	imul $0xFF, %dx		# Yes / 2 / yes
	add $1000, (%edx)	# Yes / 4 / no
	sub %dx, %di		# Yes / 2 / yes
	add 0xF0F0, %si		# Yes (absolute address) / 2 / yes	

	
# Part B
	imulw $0xF0F0, %ax	# Yes / 2 / yes	
	addl $0x100, (%ebx)	# Yes / 4 / no
	movl 8(%ebp), 16(%esp)	# No (Can't have memory-memory)
	movw %edx, 4(%esp)	# No (operand size mismatch)
	movb (%edi), %dl	# Yes / 1 / yes
	xorw %bx, (%ax)		# No (Addresses require 4-byte registers)
	addw 0xFFFF, %di	# Yes (absolute address) / 2 / yes	
	xorb $0xFFFF, %dh	# No (Constant too large)
	andw %dx, %di		# Yes / 2 / yes

# Checking suffix removal	
	imul $0xF0F0, %ax	# Yes / 2 / yes	
	add $0x100, (%ebx)	# Yes / 4 / no
	mov (%edi), %dl	# Yes / 1 / yes
	add 0xFFFF, %di	# Yes (absolute address) / 2 / yes	
	and %dx, %di		# Yes / 2 / yes


