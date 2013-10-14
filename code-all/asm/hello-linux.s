# Hello World program implemented with Linux System Calls
	
.section .data

string:
	.ascii "Hello World!\n"
string_end:	
	.equ len, string_end - string

.section .text
	
.globl _start
_start:
	# First call write(stdout, "Hello World!\n", 13)
	movl $4, %eax		# System call number 4
	movl $1, %ebx		# stdout has descriptor 1
	movl $string, %ecx	# Hello world string
	movl $len, %edx		# String length
	int $0x80		# System call code

	# Now call exit(0)
	movl $1, %eax		# System call number 0
	movl $0, %ebx		# Argument 0
	int $0x80		# System call code


