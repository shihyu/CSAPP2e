# Test of different instruction forms

# MOV instructions

mov:
# Double word
  /* $end MOV-l-s 0 */
  movl $0x4050,%eax	# Immediate--Register
  movl %ebp,%esp  	# Register--Register
  movl (%edi,%ecx),%eax   # Memory--Register 
  movl $-17,(%esp)  	  # Immediate--Memory
  movl %eax,-12(%ebp)  	  # Register--Memory
  /* $end MOV-l-s 0 */

# Word
  /* $end MOV-w-s 0 */
  movw $0x4050,%ax	# Immediate--Register
  movw %bp,%sp			# Register--Register
  movw (%edi,%ecx),%ax  	# Memory--Register 
  movw $-17,(%esp)  		# Immediate--Memory
  movw %ax,-12(%ebp)  		# Register--Memory
  /* $end MOV-w-s 0 */

# Byte
  /* $end MOV-b-s 0 */
  movb $0x50,%ah    # Immediate--Register
  movb %bh,%bl		# Register--Register
  movb (%edi,%ecx),%ah    # Memory--Register 
  movb $-17,(%esp)  	  # Immediate--Memory
  movb %al,-12(%ebp)  	  # Register--Memory
  /* $end MOV-b-s 0 */

movw16:
# 16-bit addressing
  movw (%bp),%ax	# Memory--Register 
  movw $-17,(%bp)  	# Immediate--Memory
  movw %ax,-12(%bp)  	# Register--Memory


push:
# PUSH
  /* $begin PUSH-s */
# pushb %al 	   # Byte (Invalid)
  pushw %ax	     # Word
  pushl %eax	       # Double word
  pushw $0xFF	       	 # Word
  pushl $0xFFFF		   # Double word
  /* $end PUSH-s */

pop:
# POP
  /* $begin POP-s */
# popb %al  	  # Byte (Invalid)
  popw %ax	    # Word
  popl %eax	      # Double word
  /* $end POP-s */

movsbl:
# movsbl
  /* $begin movsbl-s */
  movsbl %bl,%esp	# Register--Register
  movsbl (%edi,%ecx),%eax	# Memory--Register 
  /* $end movsbl-s */

movs:
# MOVS
  /* $begin MOVS-s */
  movsbw %al,%bx
  movsbl %al,%edx
  movswl %ax,%edx
  /* $end MOVS-s */

movz:
# MOVZ
  /* $begin MOVZ-s */
  movzbw %al,%bx
  movzbl %al,%edx
  movzwl %ax,%edx
  /* $end MOVZ-s */
add:
# Double word
  /* $end ADD-l-s 0 */
  addl $0x4050,%eax	# Immediate--Register
  addl %ebp,%esp  	# Register--Register
  addl (%edi,%ecx),%eax   # Memory--Register 
  addl $-17,(%esp)  	  # Immediate--Memory
  addl %eax,-12(%ebp)  	  # Register--Memory
  /* $end ADD-l-s 0 */

# Word
  /* $end ADD-w-s 0 */
  addw $0x4050,%ax	# Immediate--Register
  addw %bp,%sp			# Register--Register
  addw (%edi,%ecx),%ax  	# Memory--Register 
  addw $-17,(%esp)  		# Immediate--Memory
  addw %ax,-12(%ebp)  		# Register--Memory
  /* $end ADD-w-s 0 */

# Byte
  /* $end ADD-b-s 0 */
  addb $0x50,%ah    # Immediate--Register
  addb %bh,%bl		# Register--Register
  addb (%edi,%ecx),%ah    # Memory--Register 
  addb $-17,(%esp)  	  # Immediate--Memory
  addb %al,-12(%ebp)  	  # Register--Memory
  /* $end ADD-b-s 0 */

lea:
	leaw 4(%eax,%edx,2),%bx
	leal 4(%eax,%edx,2),%ebx

inc16:
	incw (%bp)

inc:
	incb %al
	incb 4(%esp,%eax)
	incw %ax
	incw 4(%esp,%eax)
	incl %eax
	incl 4(%esp,%eax)

shift:
	salb %cl,%al
	salb $0xFF,8(%esp,%edx,4)
	salw %cl,%ax
	salw $0xFF,8(%esp,%edx,4)
	sall %cl,%eax
	sall $0xFF,8(%esp,%edx,4)

cmp:
	cmpl $0,%eax
	cmpw $0,(%eax)
	cmpw %cx,(%eax)
	cmpb %al,%ah
	cmpb (%eax),%cl

test:
	testl $0,%eax
	testw $0,(%eax)
	testw %cx,(%eax)
	testb %ah,%al
	testb (%eax),%cl
