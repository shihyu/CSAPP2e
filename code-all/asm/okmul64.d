
okmul64:     file format elf64-x86-64


Disassembly of section .init:

0000000000400470 <_init>:
  400470:	48 83 ec 08          	sub    $0x8,%rsp
  400474:	e8 93 00 00 00       	callq  40050c <call_gmon_start>
  400479:	e8 22 01 00 00       	callq  4005a0 <frame_dummy>
  40047e:	e8 8d 05 00 00       	callq  400a10 <__do_global_ctors_aux>
  400483:	48 83 c4 08          	add    $0x8,%rsp
  400487:	c3                   	retq   

Disassembly of section .plt:

0000000000400488 <exit@plt-0x10>:
  400488:	ff 35 62 0b 20 00    	pushq  0x200b62(%rip)        # 600ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  40048e:	ff 25 64 0b 20 00    	jmpq   *0x200b64(%rip)        # 600ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  400494:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400498 <exit@plt>:
  400498:	ff 25 62 0b 20 00    	jmpq   *0x200b62(%rip)        # 601000 <_GLOBAL_OFFSET_TABLE_+0x18>
  40049e:	68 00 00 00 00       	pushq  $0x0
  4004a3:	e9 e0 ff ff ff       	jmpq   400488 <_init+0x18>

00000000004004a8 <__printf_chk@plt>:
  4004a8:	ff 25 5a 0b 20 00    	jmpq   *0x200b5a(%rip)        # 601008 <_GLOBAL_OFFSET_TABLE_+0x20>
  4004ae:	68 01 00 00 00       	pushq  $0x1
  4004b3:	e9 d0 ff ff ff       	jmpq   400488 <_init+0x18>

00000000004004b8 <__libc_start_main@plt>:
  4004b8:	ff 25 52 0b 20 00    	jmpq   *0x200b52(%rip)        # 601010 <_GLOBAL_OFFSET_TABLE_+0x28>
  4004be:	68 02 00 00 00       	pushq  $0x2
  4004c3:	e9 c0 ff ff ff       	jmpq   400488 <_init+0x18>

00000000004004c8 <strtol@plt>:
  4004c8:	ff 25 4a 0b 20 00    	jmpq   *0x200b4a(%rip)        # 601018 <_GLOBAL_OFFSET_TABLE_+0x30>
  4004ce:	68 03 00 00 00       	pushq  $0x3
  4004d3:	e9 b0 ff ff ff       	jmpq   400488 <_init+0x18>

Disassembly of section .text:

00000000004004e0 <_start>:
  4004e0:	31 ed                	xor    %ebp,%ebp
  4004e2:	49 89 d1             	mov    %rdx,%r9
  4004e5:	5e                   	pop    %rsi
  4004e6:	48 89 e2             	mov    %rsp,%rdx
  4004e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4004ed:	50                   	push   %rax
  4004ee:	54                   	push   %rsp
  4004ef:	49 c7 c0 70 09 40 00 	mov    $0x400970,%r8
  4004f6:	48 c7 c1 80 09 40 00 	mov    $0x400980,%rcx
  4004fd:	48 c7 c7 1c 06 40 00 	mov    $0x40061c,%rdi
  400504:	e8 af ff ff ff       	callq  4004b8 <__libc_start_main@plt>
  400509:	f4                   	hlt    
  40050a:	90                   	nop    
  40050b:	90                   	nop    

000000000040050c <call_gmon_start>:
  40050c:	48 83 ec 08          	sub    $0x8,%rsp
  400510:	48 8b 05 c9 0a 20 00 	mov    0x200ac9(%rip),%rax        # 600fe0 <_DYNAMIC+0x1a0>
  400517:	48 85 c0             	test   %rax,%rax
  40051a:	74 02                	je     40051e <call_gmon_start+0x12>
  40051c:	ff d0                	callq  *%rax
  40051e:	48 83 c4 08          	add    $0x8,%rsp
  400522:	c3                   	retq   
  400523:	90                   	nop    
  400524:	90                   	nop    
  400525:	90                   	nop    
  400526:	90                   	nop    
  400527:	90                   	nop    
  400528:	90                   	nop    
  400529:	90                   	nop    
  40052a:	90                   	nop    
  40052b:	90                   	nop    
  40052c:	90                   	nop    
  40052d:	90                   	nop    
  40052e:	90                   	nop    
  40052f:	90                   	nop    

0000000000400530 <__do_global_dtors_aux>:
  400530:	55                   	push   %rbp
  400531:	48 89 e5             	mov    %rsp,%rbp
  400534:	53                   	push   %rbx
  400535:	48 83 ec 08          	sub    $0x8,%rsp
  400539:	80 3d f0 0a 20 00 00 	cmpb   $0x0,0x200af0(%rip)        # 601030 <__bss_start>
  400540:	75 4b                	jne    40058d <__do_global_dtors_aux+0x5d>
  400542:	b8 30 0e 60 00       	mov    $0x600e30,%eax
  400547:	48 8b 15 ea 0a 20 00 	mov    0x200aea(%rip),%rdx        # 601038 <dtor_idx.6989>
  40054e:	48 2d 28 0e 60 00    	sub    $0x600e28,%rax
  400554:	48 c1 f8 03          	sar    $0x3,%rax
  400558:	48 8d 58 ff          	lea    -0x1(%rax),%rbx
  40055c:	48 39 da             	cmp    %rbx,%rdx
  40055f:	73 25                	jae    400586 <__do_global_dtors_aux+0x56>
  400561:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400568:	48 8d 42 01          	lea    0x1(%rdx),%rax
  40056c:	48 89 05 c5 0a 20 00 	mov    %rax,0x200ac5(%rip)        # 601038 <dtor_idx.6989>
  400573:	ff 14 c5 28 0e 60 00 	callq  *0x600e28(,%rax,8)
  40057a:	48 8b 15 b7 0a 20 00 	mov    0x200ab7(%rip),%rdx        # 601038 <dtor_idx.6989>
  400581:	48 39 da             	cmp    %rbx,%rdx
  400584:	72 e2                	jb     400568 <__do_global_dtors_aux+0x38>
  400586:	c6 05 a3 0a 20 00 01 	movb   $0x1,0x200aa3(%rip)        # 601030 <__bss_start>
  40058d:	48 83 c4 08          	add    $0x8,%rsp
  400591:	5b                   	pop    %rbx
  400592:	c9                   	leaveq 
  400593:	c3                   	retq   
  400594:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  40059b:	00 00 00 00 00 

00000000004005a0 <frame_dummy>:
  4005a0:	55                   	push   %rbp
  4005a1:	48 83 3d 8f 08 20 00 	cmpq   $0x0,0x20088f(%rip)        # 600e38 <__JCR_END__>
  4005a8:	00 
  4005a9:	48 89 e5             	mov    %rsp,%rbp
  4005ac:	74 1a                	je     4005c8 <frame_dummy+0x28>
  4005ae:	b8 00 00 00 00       	mov    $0x0,%eax
  4005b3:	48 85 c0             	test   %rax,%rax
  4005b6:	74 10                	je     4005c8 <frame_dummy+0x28>
  4005b8:	bf 38 0e 60 00       	mov    $0x600e38,%edi
  4005bd:	49 89 c3             	mov    %rax,%r11
  4005c0:	c9                   	leaveq 
  4005c1:	41 ff e3             	jmpq   *%r11
  4005c4:	0f 1f 40 00          	nopl   0x0(%rax)
  4005c8:	c9                   	leaveq 
  4005c9:	c3                   	retq   
  4005ca:	90                   	nop    
  4005cb:	90                   	nop    

00000000004005cc <tmult_ok1>:
  4005cc:	0f af f7             	imul   %edi,%esi
  4005cf:	89 32                	mov    %esi,(%rdx)
  4005d1:	0f 93 c0             	setae  %al
  4005d4:	b8 00 00 00 00       	mov    $0x0,%eax
  4005d9:	c3                   	retq   

00000000004005da <tmult_ok2>:
  4005da:	53                   	push   %rbx
  4005db:	0f af f7             	imul   %edi,%esi
  4005de:	89 32                	mov    %esi,(%rdx)
  4005e0:	0f 93 c3             	setae  %bl
  4005e3:	0f b6 c3             	movzbl %bl,%eax
  4005e6:	5b                   	pop    %rbx
  4005e7:	c3                   	retq   

00000000004005e8 <tmult_ok3>:
  4005e8:	0f af f7             	imul   %edi,%esi
  4005eb:	89 32                	mov    %esi,(%rdx)
  4005ed:	0f 93 c0             	setae  %al
  4005f0:	0f b6 c0             	movzbl %al,%eax
  4005f3:	c3                   	retq   

00000000004005f4 <umult_ok1>:
  4005f4:	48 89 d1             	mov    %rdx,%rcx
  4005f7:	89 f8                	mov    %edi,%eax
  4005f9:	f7 e6                	mul    %esi
  4005fb:	89 c7                	mov    %eax,%edi
  4005fd:	0f 93 c2             	setae  %dl
  400600:	0f b6 f2             	movzbl %dl,%esi
  400603:	89 39                	mov    %edi,(%rcx)
  400605:	89 f0                	mov    %esi,%eax
  400607:	c3                   	retq   

0000000000400608 <umult_ok2>:
  400608:	48 89 d1             	mov    %rdx,%rcx
  40060b:	89 f8                	mov    %edi,%eax
  40060d:	f7 e6                	mul    %esi
  40060f:	89 c7                	mov    %eax,%edi
  400611:	40 0f 93 c6          	setae  %sil
  400615:	89 39                	mov    %edi,(%rcx)
  400617:	40 0f b6 c6          	movzbl %sil,%eax
  40061b:	c3                   	retq   

000000000040061c <main>:
  40061c:	41 57                	push   %r15
  40061e:	41 56                	push   %r14
  400620:	41 55                	push   %r13
  400622:	41 54                	push   %r12
  400624:	55                   	push   %rbp
  400625:	53                   	push   %rbx
  400626:	48 83 ec 18          	sub    $0x18,%rsp
  40062a:	89 fb                	mov    %edi,%ebx
  40062c:	48 89 f5             	mov    %rsi,%rbp
  40062f:	41 be 00 00 01 00    	mov    $0x10000,%r14d
  400635:	83 ff 01             	cmp    $0x1,%edi
  400638:	7e 16                	jle    400650 <main+0x34>
  40063a:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  40063e:	ba 00 00 00 00       	mov    $0x0,%edx
  400643:	be 00 00 00 00       	mov    $0x0,%esi
  400648:	e8 7b fe ff ff       	callq  4004c8 <strtol@plt>
  40064d:	49 89 c6             	mov    %rax,%r14
  400650:	41 bf ff ff 00 00    	mov    $0xffff,%r15d
  400656:	83 fb 02             	cmp    $0x2,%ebx
  400659:	7e 16                	jle    400671 <main+0x55>
  40065b:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
  40065f:	ba 00 00 00 00       	mov    $0x0,%edx
  400664:	be 00 00 00 00       	mov    $0x0,%esi
  400669:	e8 5a fe ff ff       	callq  4004c8 <strtol@plt>
  40066e:	49 89 c7             	mov    %rax,%r15
  400671:	44 89 f3             	mov    %r14d,%ebx
  400674:	44 89 fd             	mov    %r15d,%ebp
  400677:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  40067d:	45 85 f6             	test   %r14d,%r14d
  400680:	74 19                	je     40069b <main+0x7f>
  400682:	44 89 fa             	mov    %r15d,%edx
  400685:	41 0f af d6          	imul   %r14d,%edx
  400689:	89 d0                	mov    %edx,%eax
  40068b:	c1 fa 1f             	sar    $0x1f,%edx
  40068e:	41 f7 fe             	idiv   %r14d
  400691:	44 39 f8             	cmp    %r15d,%eax
  400694:	0f 94 c0             	sete   %al
  400697:	44 0f b6 e0          	movzbl %al,%r12d
  40069b:	41 89 ed             	mov    %ebp,%r13d
  40069e:	44 0f af eb          	imul   %ebx,%r13d
  4006a2:	45 89 e1             	mov    %r12d,%r9d
  4006a5:	45 89 e8             	mov    %r13d,%r8d
  4006a8:	89 e9                	mov    %ebp,%ecx
  4006aa:	89 da                	mov    %ebx,%edx
  4006ac:	be 60 0a 40 00       	mov    $0x400a60,%esi
  4006b1:	bf 01 00 00 00       	mov    $0x1,%edi
  4006b6:	b8 00 00 00 00       	mov    $0x0,%eax
  4006bb:	e8 e8 fd ff ff       	callq  4004a8 <__printf_chk@plt>
  4006c0:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  4006c5:	89 ee                	mov    %ebp,%esi
  4006c7:	89 df                	mov    %ebx,%edi
  4006c9:	e8 76 02 00 00       	callq  400944 <tmult_ok_asm>
  4006ce:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
  4006d2:	41 39 c4             	cmp    %eax,%r12d
  4006d5:	75 0a                	jne    4006e1 <main+0xc5>
  4006d7:	ba c8 0b 40 00       	mov    $0x400bc8,%edx
  4006dc:	41 39 cd             	cmp    %ecx,%r13d
  4006df:	74 05                	je     4006e6 <main+0xca>
  4006e1:	ba cb 0b 40 00       	mov    $0x400bcb,%edx
  4006e6:	89 04 24             	mov    %eax,(%rsp)
  4006e9:	41 89 c9             	mov    %ecx,%r9d
  4006ec:	41 89 e8             	mov    %ebp,%r8d
  4006ef:	89 d9                	mov    %ebx,%ecx
  4006f1:	be 88 0a 40 00       	mov    $0x400a88,%esi
  4006f6:	bf 01 00 00 00       	mov    $0x1,%edi
  4006fb:	b8 00 00 00 00       	mov    $0x0,%eax
  400700:	e8 a3 fd ff ff       	callq  4004a8 <__printf_chk@plt>
  400705:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  40070a:	89 ee                	mov    %ebp,%esi
  40070c:	89 df                	mov    %ebx,%edi
  40070e:	e8 b9 fe ff ff       	callq  4005cc <tmult_ok1>
  400713:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
  400717:	41 39 c4             	cmp    %eax,%r12d
  40071a:	75 0a                	jne    400726 <main+0x10a>
  40071c:	ba c8 0b 40 00       	mov    $0x400bc8,%edx
  400721:	41 39 cd             	cmp    %ecx,%r13d
  400724:	74 05                	je     40072b <main+0x10f>
  400726:	ba cb 0b 40 00       	mov    $0x400bcb,%edx
  40072b:	89 04 24             	mov    %eax,(%rsp)
  40072e:	41 89 c9             	mov    %ecx,%r9d
  400731:	41 89 e8             	mov    %ebp,%r8d
  400734:	89 d9                	mov    %ebx,%ecx
  400736:	be b0 0a 40 00       	mov    $0x400ab0,%esi
  40073b:	bf 01 00 00 00       	mov    $0x1,%edi
  400740:	b8 00 00 00 00       	mov    $0x0,%eax
  400745:	e8 5e fd ff ff       	callq  4004a8 <__printf_chk@plt>
  40074a:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  40074f:	89 ee                	mov    %ebp,%esi
  400751:	89 df                	mov    %ebx,%edi
  400753:	e8 82 fe ff ff       	callq  4005da <tmult_ok2>
  400758:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
  40075c:	41 39 c4             	cmp    %eax,%r12d
  40075f:	75 0a                	jne    40076b <main+0x14f>
  400761:	ba c8 0b 40 00       	mov    $0x400bc8,%edx
  400766:	41 39 cd             	cmp    %ecx,%r13d
  400769:	74 05                	je     400770 <main+0x154>
  40076b:	ba cb 0b 40 00       	mov    $0x400bcb,%edx
  400770:	89 04 24             	mov    %eax,(%rsp)
  400773:	41 89 c9             	mov    %ecx,%r9d
  400776:	41 89 e8             	mov    %ebp,%r8d
  400779:	89 d9                	mov    %ebx,%ecx
  40077b:	be d8 0a 40 00       	mov    $0x400ad8,%esi
  400780:	bf 01 00 00 00       	mov    $0x1,%edi
  400785:	b8 00 00 00 00       	mov    $0x0,%eax
  40078a:	e8 19 fd ff ff       	callq  4004a8 <__printf_chk@plt>
  40078f:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  400794:	89 ee                	mov    %ebp,%esi
  400796:	89 df                	mov    %ebx,%edi
  400798:	e8 3d fe ff ff       	callq  4005da <tmult_ok2>
  40079d:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
  4007a1:	41 39 c4             	cmp    %eax,%r12d
  4007a4:	75 0a                	jne    4007b0 <main+0x194>
  4007a6:	ba c8 0b 40 00       	mov    $0x400bc8,%edx
  4007ab:	41 39 cd             	cmp    %ecx,%r13d
  4007ae:	74 05                	je     4007b5 <main+0x199>
  4007b0:	ba cb 0b 40 00       	mov    $0x400bcb,%edx
  4007b5:	89 04 24             	mov    %eax,(%rsp)
  4007b8:	41 89 c9             	mov    %ecx,%r9d
  4007bb:	41 89 e8             	mov    %ebp,%r8d
  4007be:	89 d9                	mov    %ebx,%ecx
  4007c0:	be d8 0a 40 00       	mov    $0x400ad8,%esi
  4007c5:	bf 01 00 00 00       	mov    $0x1,%edi
  4007ca:	b8 00 00 00 00       	mov    $0x0,%eax
  4007cf:	e8 d4 fc ff ff       	callq  4004a8 <__printf_chk@plt>
  4007d4:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  4007d9:	89 ee                	mov    %ebp,%esi
  4007db:	89 df                	mov    %ebx,%edi
  4007dd:	e8 06 fe ff ff       	callq  4005e8 <tmult_ok3>
  4007e2:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
  4007e6:	41 39 c4             	cmp    %eax,%r12d
  4007e9:	75 0a                	jne    4007f5 <main+0x1d9>
  4007eb:	ba c8 0b 40 00       	mov    $0x400bc8,%edx
  4007f0:	41 39 cd             	cmp    %ecx,%r13d
  4007f3:	74 05                	je     4007fa <main+0x1de>
  4007f5:	ba cb 0b 40 00       	mov    $0x400bcb,%edx
  4007fa:	89 04 24             	mov    %eax,(%rsp)
  4007fd:	41 89 c9             	mov    %ecx,%r9d
  400800:	41 89 e8             	mov    %ebp,%r8d
  400803:	89 d9                	mov    %ebx,%ecx
  400805:	be 00 0b 40 00       	mov    $0x400b00,%esi
  40080a:	bf 01 00 00 00       	mov    $0x1,%edi
  40080f:	b8 00 00 00 00       	mov    $0x0,%eax
  400814:	e8 8f fc ff ff       	callq  4004a8 <__printf_chk@plt>
  400819:	44 89 f3             	mov    %r14d,%ebx
  40081c:	44 89 fd             	mov    %r15d,%ebp
  40081f:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  400825:	45 85 f6             	test   %r14d,%r14d
  400828:	74 19                	je     400843 <main+0x227>
  40082a:	44 89 f8             	mov    %r15d,%eax
  40082d:	41 0f af c6          	imul   %r14d,%eax
  400831:	ba 00 00 00 00       	mov    $0x0,%edx
  400836:	41 f7 f6             	div    %r14d
  400839:	44 39 f8             	cmp    %r15d,%eax
  40083c:	0f 94 c0             	sete   %al
  40083f:	44 0f b6 e0          	movzbl %al,%r12d
  400843:	41 89 ed             	mov    %ebp,%r13d
  400846:	44 0f af eb          	imul   %ebx,%r13d
  40084a:	45 89 e1             	mov    %r12d,%r9d
  40084d:	45 89 e8             	mov    %r13d,%r8d
  400850:	89 e9                	mov    %ebp,%ecx
  400852:	89 da                	mov    %ebx,%edx
  400854:	be 28 0b 40 00       	mov    $0x400b28,%esi
  400859:	bf 01 00 00 00       	mov    $0x1,%edi
  40085e:	b8 00 00 00 00       	mov    $0x0,%eax
  400863:	e8 40 fc ff ff       	callq  4004a8 <__printf_chk@plt>
  400868:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  40086d:	89 ee                	mov    %ebp,%esi
  40086f:	89 df                	mov    %ebx,%edi
  400871:	e8 da 00 00 00       	callq  400950 <umult_ok_asm>
  400876:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
  40087a:	41 39 c4             	cmp    %eax,%r12d
  40087d:	75 0a                	jne    400889 <main+0x26d>
  40087f:	ba c8 0b 40 00       	mov    $0x400bc8,%edx
  400884:	41 39 cd             	cmp    %ecx,%r13d
  400887:	74 05                	je     40088e <main+0x272>
  400889:	ba cb 0b 40 00       	mov    $0x400bcb,%edx
  40088e:	89 04 24             	mov    %eax,(%rsp)
  400891:	41 89 c9             	mov    %ecx,%r9d
  400894:	41 89 e8             	mov    %ebp,%r8d
  400897:	89 d9                	mov    %ebx,%ecx
  400899:	be 50 0b 40 00       	mov    $0x400b50,%esi
  40089e:	bf 01 00 00 00       	mov    $0x1,%edi
  4008a3:	b8 00 00 00 00       	mov    $0x0,%eax
  4008a8:	e8 fb fb ff ff       	callq  4004a8 <__printf_chk@plt>
  4008ad:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  4008b2:	89 ee                	mov    %ebp,%esi
  4008b4:	89 df                	mov    %ebx,%edi
  4008b6:	e8 39 fd ff ff       	callq  4005f4 <umult_ok1>
  4008bb:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
  4008bf:	41 39 c4             	cmp    %eax,%r12d
  4008c2:	75 0a                	jne    4008ce <main+0x2b2>
  4008c4:	ba c8 0b 40 00       	mov    $0x400bc8,%edx
  4008c9:	41 39 cd             	cmp    %ecx,%r13d
  4008cc:	74 05                	je     4008d3 <main+0x2b7>
  4008ce:	ba cb 0b 40 00       	mov    $0x400bcb,%edx
  4008d3:	89 04 24             	mov    %eax,(%rsp)
  4008d6:	41 89 c9             	mov    %ecx,%r9d
  4008d9:	41 89 e8             	mov    %ebp,%r8d
  4008dc:	89 d9                	mov    %ebx,%ecx
  4008de:	be 78 0b 40 00       	mov    $0x400b78,%esi
  4008e3:	bf 01 00 00 00       	mov    $0x1,%edi
  4008e8:	b8 00 00 00 00       	mov    $0x0,%eax
  4008ed:	e8 b6 fb ff ff       	callq  4004a8 <__printf_chk@plt>
  4008f2:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  4008f7:	89 ee                	mov    %ebp,%esi
  4008f9:	89 df                	mov    %ebx,%edi
  4008fb:	e8 08 fd ff ff       	callq  400608 <umult_ok2>
  400900:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
  400904:	41 39 c4             	cmp    %eax,%r12d
  400907:	75 0a                	jne    400913 <main+0x2f7>
  400909:	ba c8 0b 40 00       	mov    $0x400bc8,%edx
  40090e:	41 39 cd             	cmp    %ecx,%r13d
  400911:	74 05                	je     400918 <main+0x2fc>
  400913:	ba cb 0b 40 00       	mov    $0x400bcb,%edx
  400918:	89 04 24             	mov    %eax,(%rsp)
  40091b:	41 89 c9             	mov    %ecx,%r9d
  40091e:	41 89 e8             	mov    %ebp,%r8d
  400921:	89 d9                	mov    %ebx,%ecx
  400923:	be a0 0b 40 00       	mov    $0x400ba0,%esi
  400928:	bf 01 00 00 00       	mov    $0x1,%edi
  40092d:	b8 00 00 00 00       	mov    $0x0,%eax
  400932:	e8 71 fb ff ff       	callq  4004a8 <__printf_chk@plt>
  400937:	bf 00 00 00 00       	mov    $0x0,%edi
  40093c:	e8 57 fb ff ff       	callq  400498 <exit@plt>
  400941:	90                   	nop    
  400942:	90                   	nop    
  400943:	90                   	nop    

0000000000400944 <tmult_ok_asm>:
  400944:	0f af f7             	imul   %edi,%esi
  400947:	89 32                	mov    %esi,(%rdx)
  400949:	0f 93 c0             	setae  %al
  40094c:	0f b6 c0             	movzbl %al,%eax
  40094f:	c3                   	retq   

0000000000400950 <umult_ok_asm>:
  400950:	0f af f7             	imul   %edi,%esi
  400953:	89 32                	mov    %esi,(%rdx)
  400955:	85 f6                	test   %esi,%esi
  400957:	0f 95 c0             	setne  %al
  40095a:	48 89 d1             	mov    %rdx,%rcx
  40095d:	89 f0                	mov    %esi,%eax
  40095f:	f7 e7                	mul    %edi
  400961:	89 01                	mov    %eax,(%rcx)
  400963:	0f 93 c0             	setae  %al
  400966:	0f b6 c0             	movzbl %al,%eax
  400969:	c3                   	retq   
  40096a:	90                   	nop    
  40096b:	90                   	nop    
  40096c:	90                   	nop    
  40096d:	90                   	nop    
  40096e:	90                   	nop    
  40096f:	90                   	nop    

0000000000400970 <__libc_csu_fini>:
  400970:	f3 c3                	repz retq 
  400972:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  400979:	1f 84 00 00 00 00 00 

0000000000400980 <__libc_csu_init>:
  400980:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  400985:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  40098a:	48 8d 2d 83 04 20 00 	lea    0x200483(%rip),%rbp        # 600e14 <__init_array_end>
  400991:	4c 8d 3d 7c 04 20 00 	lea    0x20047c(%rip),%r15        # 600e14 <__init_array_end>
  400998:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40099d:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  4009a2:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  4009a7:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  4009ac:	48 83 ec 38          	sub    $0x38,%rsp
  4009b0:	4c 29 fd             	sub    %r15,%rbp
  4009b3:	41 89 fe             	mov    %edi,%r14d
  4009b6:	49 89 f5             	mov    %rsi,%r13
  4009b9:	48 c1 fd 03          	sar    $0x3,%rbp
  4009bd:	49 89 d4             	mov    %rdx,%r12
  4009c0:	e8 ab fa ff ff       	callq  400470 <_init>
  4009c5:	48 85 ed             	test   %rbp,%rbp
  4009c8:	74 1c                	je     4009e6 <__libc_csu_init+0x66>
  4009ca:	31 db                	xor    %ebx,%ebx
  4009cc:	0f 1f 40 00          	nopl   0x0(%rax)
  4009d0:	4c 89 e2             	mov    %r12,%rdx
  4009d3:	4c 89 ee             	mov    %r13,%rsi
  4009d6:	44 89 f7             	mov    %r14d,%edi
  4009d9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  4009dd:	48 83 c3 01          	add    $0x1,%rbx
  4009e1:	48 39 eb             	cmp    %rbp,%rbx
  4009e4:	72 ea                	jb     4009d0 <__libc_csu_init+0x50>
  4009e6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4009eb:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  4009f0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  4009f5:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  4009fa:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  4009ff:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  400a04:	48 83 c4 38          	add    $0x38,%rsp
  400a08:	c3                   	retq   
  400a09:	90                   	nop    
  400a0a:	90                   	nop    
  400a0b:	90                   	nop    
  400a0c:	90                   	nop    
  400a0d:	90                   	nop    
  400a0e:	90                   	nop    
  400a0f:	90                   	nop    

0000000000400a10 <__do_global_ctors_aux>:
  400a10:	55                   	push   %rbp
  400a11:	48 89 e5             	mov    %rsp,%rbp
  400a14:	53                   	push   %rbx
  400a15:	48 83 ec 08          	sub    $0x8,%rsp
  400a19:	48 8b 05 f8 03 20 00 	mov    0x2003f8(%rip),%rax        # 600e18 <__CTOR_LIST__>
  400a20:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  400a24:	74 19                	je     400a3f <__do_global_ctors_aux+0x2f>
  400a26:	bb 18 0e 60 00       	mov    $0x600e18,%ebx
  400a2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400a30:	48 83 eb 08          	sub    $0x8,%rbx
  400a34:	ff d0                	callq  *%rax
  400a36:	48 8b 03             	mov    (%rbx),%rax
  400a39:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  400a3d:	75 f1                	jne    400a30 <__do_global_ctors_aux+0x20>
  400a3f:	48 83 c4 08          	add    $0x8,%rsp
  400a43:	5b                   	pop    %rbx
  400a44:	c9                   	leaveq 
  400a45:	c3                   	retq   
  400a46:	90                   	nop    
  400a47:	90                   	nop    

Disassembly of section .fini:

0000000000400a48 <_fini>:
  400a48:	48 83 ec 08          	sub    $0x8,%rsp
  400a4c:	e8 df fa ff ff       	callq  400530 <__do_global_dtors_aux>
  400a51:	48 83 c4 08          	add    $0x8,%rsp
  400a55:	c3                   	retq   
