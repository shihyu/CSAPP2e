
main.o:     file format elf32-i386
main.o
architecture: i386, flags 0x00000011:
HAS_RELOC, HAS_SYMS
start address 0x00000000

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000011  00000000  00000000  00000034  2**2
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
  1 .data         00000008  00000000  00000000  00000048  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  2 .bss          00000000  00000000  00000000  00000050  2**2
                  ALLOC
  3 .note         00000014  00000000  00000000  00000050  2**0
                  CONTENTS, READONLY
  4 .comment      00000026  00000000  00000000  00000064  2**0
                  CONTENTS, READONLY
SYMBOL TABLE:
00000000 l    df *ABS*	00000000 main.c
00000000 l    d  .text	00000000 
00000000 l    d  .data	00000000 
00000000 l    d  .bss	00000000 
00000000 l       .text	00000000 gcc2_compiled.
00000000 l    d  .note	00000000 
00000000 l    d  .comment	00000000 
00000000 g     O .data	00000008 buf
00000000 g     F .text	00000011 main
00000000         *UND*	00000000 swap


Disassembly of section .data:

00000000 <buf>:
   0:	01 00 00 00 02 00 00 00                             ........
