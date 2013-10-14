/* $begin tmult_ok_asm32 */
# Hand-generated code for tmult_ok
.globl tmult_ok_asm
tmult_ok_asm:
	pushl	%ebp		
	movl	%esp, %ebp	
	movl	12(%ebp), %eax # Get y
	imull	8(%ebp), %eax  # Multiply by y
	movl	16(%ebp), %edx # Get dest
	movl	%eax, (%edx)   # Store product at dest
# Deleted code	
#	testl	%eax, %eax
#	setg	%al
# Inserted code
	setae   %al	       # Set low-order byte
# End of inserted code
	movzbl	%al, %eax      # Zero remaining bytes
	popl	%ebp
	ret
/* $end tmult_ok_asm32 */

/* $begin umult_ok_asm32 */
# Hand-generated code for umult_ok
.globl umult_ok_asm
umult_ok_asm:
	pushl	%ebp
	movl	%esp, %ebp
	movl	12(%ebp), %eax  # Get y
	movl    8(%ebp), %ecx	# Get x
	mull	%ecx   		# Unsigned multiply
	movl	16(%ebp), %edx  # Get dest
	movl	%eax, (%edx)	# Store product at dest
	setae   %al		# Set low-order byte
	movzbl	%al, %eax	# Zero remaining bytes
	popl	%ebp
	ret
/* $end umult_ok_asm32 */
