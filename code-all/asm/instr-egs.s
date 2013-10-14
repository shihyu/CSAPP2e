# Test of different instruction forms

# MOV instructions

mov:
# Quad word
  /* $begin MOV-q-s */
  movq $0x4050,%rax	# Immediate--Register
  movq %rbp,%rsp  	# Register--Register
  movq (%rdi,%rcx),%rax   # Memory--Register 
  movq $-17,(%rsp)  	  # Immediate--Memory
  movq %rax,-12(%rbp)  	  # Register--Memory
  /* $end MOV-l-s */


# Double word
  /* $begin MOV-l-s */
  movl $0x4050,%eax	# Immediate--Register
  movl %ebp,%esp  	# Register--Register
  movl (%rdi,%rdx),%eax   # Memory--Register 
  movl $-17,(%rsp)  	  # Immediate--Memory
  movl %eax,-12(%rbp)  	  # Register--Memory
  /* $end MOV-l-s */

# Word
  /* $begin MOV-w-s */
  movw $0x4050,%ax	# Immediate--Register
  movw %bp,%sp			# Register--Register
  movw (%rdi,%rdx),%ax  	# Memory--Register 
  movw $-17,(%rsp)  		# Immediate--Memory
  movw %ax,-12(%rbp)  		# Register--Memory
  /* $end MOV-w-s */

# Byte
  /* $begin MOV-b-s */
  movb $0x50,%ah    # Immediate--Register
  movb %bh,%bl		# Register--Register
  movb (%rdi,%rdx),%ah    # Memory--Register 
  movb $-17,(%rsp)  	  # Immediate--Memory
  movb %al,-12(%rbp)  	  # Register--Memory
  /* $end MOV-b-s */

mov32:
# 32-bit addressing
  movw (%ebp),%ax	# Memory--Register 
  movw $-17,(%ebp)  	# Immediate--Memory
  movw %ax,-12(%ebp)  	# Register--Memory


push:
# PUSH
  /* $begin PUSH-s */
# pushb %al 	   # Byte (Invalid)
  pushw %ax	     # Word
#  pushl %eax	       # Double word
  pushq %rax	       	 # Quad Word
  pushw $0xFF		   # Word
#  pushl $0xFFFF		     # Double word
  pushq $0xFFFF		       # Quad word
  /* $end PUSH-s */

pop:
# POP
  /* $begin POP-s */
# popb %al  	  # Byte (Invalid)
  popw %ax	    # Word
#  popl %eax	      # Double word
  popq %rax	      	# Quad word
  /* $end POP-s */

movs:
# MOVS
  /* $begin MOVS-s */
  movsbw %al,%bx
  movsbl %al,%edx
  movswl %ax,%edx
  movsbq %al,%rbx
  movswq %ax,%rbx
  movslq %eax,%rbx
  /* $end MOVS-s */

movz:
# MOVZ
  /* $begin MOVZ-s */
  movzbw %al,%bx
  movzbl %al,%edx
  movzwl %ax,%edx
  movzbq %al,%rbx
  movzwq %ax,%rbx
#  movzlq %eax,%rbx  # invalid

  /* $end MOVZ-s */
add:
# Quad word
  /* $begin ADD-q-s */
  addq $0x4050,%rax	# Immediate--Register
  addq %rbp,%rsp  	# Register--Register
  addq (%rdi,%rdx),%rax   # Memory--Register 
  addq $-17,(%rsp)  	  # Immediate--Memory
  addq %rax,-12(%rbp)  	  # Register--Memory
#  addq $0x100000000,%rax # Operand too big.
  /* $end ADD-q-s */

# Double word
  /* $begin ADD-l-s */
  addl $0x4050,%eax	# Immediate--Register
  addl %ebp,%esp  	# Register--Register
  addl (%rdi,%rdx),%eax   # Memory--Register 
  addl $-17,(%rsp)  	  # Immediate--Memory
  addl %eax,-12(%rbp)  	  # Register--Memory
  /* $end ADD-l-s */

# Word
  /* $begin ADD-w-s */
  addw $0x4050,%ax	# Immediate--Register
  addw %bp,%sp			# Register--Register
  addw (%rdi,%rdx),%ax  	# Memory--Register 
  addw $-17,(%rsp)  		# Immediate--Memory
  addw %ax,-12(%rbp)  		# Register--Memory
  /* $end ADD-w-s */

# Byte
  /* $begin ADD-b-s */
  addb $0x50,%ah    # Immediate--Register
  addb %bh,%bl		# Register--Register
  addb (%rdi,%rdx),%ah    # Memory--Register 
  addb $-17,(%rsp)  	  # Immediate--Memory
  addb %al,-12(%rbp)  	  # Register--Memory
  /* $end ADD-b-s */

lea:
	/* $begin LEA-s */
	leaw 4(%rax,%rdx,2),%bx
	leal 4(%rax,%rdx,2),%ebx
	leaq 4(%rax,%rdx,2),%rbx
	/* $end LEA-s */

inc32:
	incw (%ebp)

inc:
	incb %al
	incb 4(%rsp,%rax)
	incw %ax
	incw 4(%rsp,%rax)
	incl %eax
	incl 4(%rsp,%rax)
	incq %rax
	incq 4(%rsp,%rax)

shift:
	salb %cl,%al
	salb $0xFF,8(%rsp,%rdx,4)
	salw %cl,%ax
	salw $0xFF,8(%rsp,%rdx,4)
	sall %cl,%eax
	sall $0xFF,8(%rsp,%rdx,4)
	salq %cl,%rax
	salq $0xFF,8(%rsp,%rdx,4)

cmp:
	cmpb %al,%ah
	cmpb (%rax),%cl
	cmpw $0,(%rax)
	cmpw %cx,(%rax)
	cmpl $0,%eax
	cmpl %eax,(%rax)
	cmpq $0,%rax
	cmpq %rax,(%rax)

test:
	testb %ah,%al
	testb (%rax),%cl
	testw $0,(%rax)
	testw %cx,(%rax)
	testl $0,%eax
	testl %eax,(%rax)
	testq $0,%rax
	testq %rax,(%rax)

