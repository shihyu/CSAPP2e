# Examples of invalid instructions 
/* $begin bad-instrs-prob-s 0 */
    movb $0xF, (%bl)
    movl %ax, (%esp)
    movw (%eax),4(%esp)
    movb %ah,%sh
    movl %eax,$0x123
    movl %eax,%dx
    movb %si, 8(%ebp)
/* $end bad-instrs-prob-s 0 */

/* $begin bad-instrs-ans-s 0 */
    movb $0xF, (%bl)	  # Cannot use %bl as address register
    movl %ax, (%esp)	  # Mismatch between instruction suffix and register ID
    movw (%eax),4(%esp)	  # Cannot have both source and destination be memory references
    movb %ah,%sh	  # No register named %sh	
    movl %eax,$0x123	  # Cannot have immediate as destination
    movl %eax,%dx	  # Destination operand incorrect size
    movb %si, 8(%ebp)	  # Mismatch between instruction suffix and register ID
/* $end bad-instrs-ans-s 0 */
