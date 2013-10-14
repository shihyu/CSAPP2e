prob:
	/* $begin add-suffixes-prob-s 0 */
	mov   %eax, (%esp)
	mov   (%eax), %dx
	mov   $0xFF, %bl
	mov   (%esp,%edx,4), %dh
	push  $0xFF
	mov   %dx, (%eax)
	pop   %edi
	/* $end add-suffixes-prob-s 0 */
ans:
	/* $begin add-suffixes-ans-s 0 */
	movl   %eax, (%esp)
	movw   (%eax), %dx
	movb   $0xFF, %bl
	movb   (%esp,%edx,4), %dh
	pushl  $0xFF
	movw   %dx, (%eax)
	popl   %edi
	/* $end add-suffixes-ans-s 0 */

extra:
	add   $0x4050, %esp
	add   (%edi), %al
	add   %si, 4(%eax,%edx)
	lea   (%edi), %ax
	lea   (%esp,%edx,4), %edx
	inc   %eax
