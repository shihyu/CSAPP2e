	/* $begin mov-sa 0 */
	movl $0x4050,%eax  	# Immediate--Register, 4 bytes
	movw  %bp,%sp  		# Register--Register,  2 bytes
	movb (%edi,%ecx),%ah  	# Memory--Register,    1 byte
	movb $-17,(%esp)  	# Immediate--Memory,   1 byte
	movl %eax,-12(%ebp)  	# Register--Memory,    4 bytes
	/* $end mov-sa 0 */


	/* $begin pushl-sa 0 */
	subl $4,%esp 		# Decrement stack pointer
	movl %ebp,(%esp) 	# Store %ebp on stack
	/* $end pushl-sa 0 */

	/* $begin popl-sa 0 */
	movl (%esp),%eax 	# Read %eax from stack
	addl $4,%esp 		# Increment stack pointer
	/* $end popl-sa 0 */

	/* $begin word-sizes-sa 0 */
	movb %bl,%al		# One byte
	movw %bx,%ax		# Two bytes
	movl %ebx,%eax		# Four bytes
	/* $end word-sizes-sa 0 */

	/* $begin word-sizes-sa 0 */
	mov %bl,%al		# One byte
	mov %bx,%ax		# Two bytes
	mov %ebx,%eax		# Four bytes
	/* $end word-sizes-sa 0 */

	/* $begin byte-move-sa 0 */
	# Assume initially that %dh = CD, %eax = 98765432
	movb %dh,%al		# %eax = 987654CD
	movsbl %dh,%eax		# %eax = FFFFFFCD
	movzbl %dh,%eax		# %eax = 000000CD
	/* $end byte-move-sa 0 */

	/* $begin jump-sa 0 */
	movl $0,%eax	   	# Set %eax to 0 
	jmp .L1          	# Goto .L1 
	movl (%eax),%edx 	# Null pointer dereference 
.L1: 
	popl %edx 
	/* $end jump-sa 0 */

 
	/* $begin leave-sa 0 */
	movl %ebp, %esp	# Set stack pointer to beginning of frame 
	popl %ebp	# Restore saved \ebpreg and set stack ptr to end of caller's frame
	/* $end leave-sa 0 */

	/* $begin loadpc-sa 0 */
        call next 
next: 	
	popl %eax 
	/* $end loadpc-sa 0 */


	/* $begin idivl-alt-sa 0 */
# x at \ebpreg+8, y at \ebpreg+12	
	movl    8(%ebp),%eax	# Load x into \eaxreg
	cltd			# Sign extend into \edxreg
	idivl   12(%ebp)	# Divide by y
	movl    %eax, 4(%esp)	# Store x / y
	movl	%edx, (%esp)	# Store x % y
	/* $end idivl-alt-sa 0 */

	/* $begin divl-sa 0 */
# x at \ebpreg+8, y at \ebpreg+12	
	movl    8(%ebp),%eax	# Load x into \eaxreg
	movl    $0,%edx		# Set high-order bits to 0	
	divl    12(%ebp)	# Unsigned divide by y
	movl	%eax, 4(%esp)	# Store x / y
	movl	%edx, (%esp)	# Store x % y
	/* $end divl-sa 0 */

# Experiments with zeroing a register */
zero:
	xorl %edx,%edx
	movl $0, %edx
