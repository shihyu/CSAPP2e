	.text
.globl pushtest
pushtest:
	pushl	%ebp
	movl	%esp, %ebp
	movl	%esp, %eax # Copy stack pointer
	pushl   %esp	   # Push stack pointer
	popl	%edx	   # Pop it back
	subl	%edx, %eax # Return 0 or 4
	leave		   # Restore stack & frame pointers
	ret

	.text
.globl poptest
poptest:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	$0xabcd	    # Push test value
	popl	%esp	    # Pop to stack pointer
	movl	%esp, %eax  # Set popped value as return value
	leave		    # Restore stack and frame pointers 
	ret


