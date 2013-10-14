
relo3prob.o:     file format elf32-i386

Disassembly of section .text:

00000000 <relo3>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 45 08             	mov    0x8(%ebp),%eax
   6:	8d 50 9c             	lea    0xffffff9c(%eax),%edx
   9:	83 fa 05             	cmp    $0x5,%edx
   c:	77 17                	ja     25 <relo3+0x25>
   e:	ff 24 95 00 00 00 00 	jmp    *0x0(,%edx,4)
  15:	40                   	inc    %eax
  16:	eb 10                	jmp    28 <relo3+0x28>
  18:	83 c0 03             	add    $0x3,%eax
  1b:	eb 0b                	jmp    28 <relo3+0x28>
  1d:	8d 76 00             	lea    0x0(%esi),%esi
  20:	83 c0 05             	add    $0x5,%eax
  23:	eb 03                	jmp    28 <relo3+0x28>
  25:	83 c0 06             	add    $0x6,%eax
  28:	89 ec                	mov    %ebp,%esp
  2a:	5d                   	pop    %ebp
  2b:	c3                   	ret    
