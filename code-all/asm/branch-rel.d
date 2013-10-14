
branch.o:     file format elf32-i386

Disassembly of section .text:

00000000 <silly>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	8b 55 08             	mov    0x8(%ebp),%edx
   6:	85 d2                	test   %edx,%edx
   8:	7e 11                	jle    1b <silly+0x1b>
   a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10:	89 d0                	mov    %edx,%eax
  12:	c1 f8 01             	sar    $0x1,%eax
  15:	29 c2                	sub    %eax,%edx
  17:	85 d2                	test   %edx,%edx
  19:	7f f5                	jg     10 <silly+0x10>
  1b:	89 d0                	mov    %edx,%eax
  1d:	89 ec                	mov    %ebp,%esp
  1f:	5d                   	pop    %ebp
  20:	c3                   	ret    
  21:	8d 76 00             	lea    0x0(%esi),%esi

00000024 <main>:
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	83 ec 08             	sub    $0x8,%esp
  2a:	83 c4 f4             	add    $0xfffffff4,%esp
  2d:	6a 02                	push   $0x2
  2f:	e8 fc ff ff ff       	call   30 <main+0xc>
  34:	89 ec                	mov    %ebp,%esp
  36:	5d                   	pop    %ebp
  37:	c3                   	ret    
