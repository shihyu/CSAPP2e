
code.o:     file format elf32-i386

Disassembly of section .text:

00000000 <sum>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 45 0c             	mov    0xc(%ebp),%eax
   6:	03 45 08             	add    0x8(%ebp),%eax
   9:	01 05 00 00 00 00    	add    %eax,0x0
   f:	89 ec                	mov    %ebp,%esp
  11:	5d                   	pop    %ebp
  12:	c3                   	ret    
  13:	90                   	nop    

00000014 <p>:
  14:	55                   	push   %ebp
  15:	89 e5                	mov    %esp,%ebp
  17:	83 ec 08             	sub    $0x8,%esp
  1a:	8b 45 08             	mov    0x8(%ebp),%eax
  1d:	83 c4 f8             	add    $0xfffffff8,%esp
  20:	50                   	push   %eax
  21:	50                   	push   %eax
  22:	e8 fc ff ff ff       	call   23 <p+0xf>
  27:	89 ec                	mov    %ebp,%esp
  29:	5d                   	pop    %ebp
  2a:	c3                   	ret    
