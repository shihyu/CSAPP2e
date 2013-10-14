/* $begin tmult_ok_asm64 */
.globl tmult_ok_asm
tmult_ok_asm:
	imull	%edi, %esi
	movl	%esi, (%rdx)
	setae   %al	# Set low-order byte
	movzbl	%al, %eax
	ret
/* $end tmult_ok_asm64 */
	
/* $begin umult_ok_asm64 */
.globl umult_ok_asm
umult_ok_asm:
	movq 	%rdx, %rcx	# Save copy of dest
	movl	%esi, %eax	# Copy y to %eax
	mull	%edi		# Unsigned multiply by x
	movl    %eax, (%rcx)	# Store product at dest
	setae	%al		# Set low-order byte
	movzbl	%al, %eax
	ret
/* $end umult_ok_asm64 */