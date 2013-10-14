
okmul:     file format elf32-i386


Disassembly of section .init:

08048300 <_init>:
 8048300:	55                   	push   %ebp
 8048301:	89 e5                	mov    %esp,%ebp
 8048303:	53                   	push   %ebx
 8048304:	83 ec 04             	sub    $0x4,%esp
 8048307:	e8 00 00 00 00       	call   804830c <_init+0xc>
 804830c:	5b                   	pop    %ebx
 804830d:	81 c3 e8 1c 00 00    	add    $0x1ce8,%ebx
 8048313:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 8048319:	85 d2                	test   %edx,%edx
 804831b:	74 05                	je     8048322 <_init+0x22>
 804831d:	e8 1e 00 00 00       	call   8048340 <__gmon_start__@plt>
 8048322:	e8 f9 00 00 00       	call   8048420 <frame_dummy>
 8048327:	e8 24 06 00 00       	call   8048950 <__do_global_ctors_aux>
 804832c:	58                   	pop    %eax
 804832d:	5b                   	pop    %ebx
 804832e:	c9                   	leave  
 804832f:	c3                   	ret    

Disassembly of section .plt:

08048330 <__gmon_start__@plt-0x10>:
 8048330:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 8048336:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 804833c:	00 00                	add    %al,(%eax)
	...

08048340 <__gmon_start__@plt>:
 8048340:	ff 25 00 a0 04 08    	jmp    *0x804a000
 8048346:	68 00 00 00 00       	push   $0x0
 804834b:	e9 e0 ff ff ff       	jmp    8048330 <_init+0x30>

08048350 <__printf_chk@plt>:
 8048350:	ff 25 04 a0 04 08    	jmp    *0x804a004
 8048356:	68 08 00 00 00       	push   $0x8
 804835b:	e9 d0 ff ff ff       	jmp    8048330 <_init+0x30>

08048360 <__libc_start_main@plt>:
 8048360:	ff 25 08 a0 04 08    	jmp    *0x804a008
 8048366:	68 10 00 00 00       	push   $0x10
 804836b:	e9 c0 ff ff ff       	jmp    8048330 <_init+0x30>

08048370 <strtol@plt>:
 8048370:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048376:	68 18 00 00 00       	push   $0x18
 804837b:	e9 b0 ff ff ff       	jmp    8048330 <_init+0x30>

08048380 <exit@plt>:
 8048380:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048386:	68 20 00 00 00       	push   $0x20
 804838b:	e9 a0 ff ff ff       	jmp    8048330 <_init+0x30>

Disassembly of section .text:

08048390 <_start>:
 8048390:	31 ed                	xor    %ebp,%ebp
 8048392:	5e                   	pop    %esi
 8048393:	89 e1                	mov    %esp,%ecx
 8048395:	83 e4 f0             	and    $0xfffffff0,%esp
 8048398:	50                   	push   %eax
 8048399:	54                   	push   %esp
 804839a:	52                   	push   %edx
 804839b:	68 e0 88 04 08       	push   $0x80488e0
 80483a0:	68 f0 88 04 08       	push   $0x80488f0
 80483a5:	51                   	push   %ecx
 80483a6:	56                   	push   %esi
 80483a7:	68 42 85 04 08       	push   $0x8048542
 80483ac:	e8 af ff ff ff       	call   8048360 <__libc_start_main@plt>
 80483b1:	f4                   	hlt    
 80483b2:	90                   	nop    
 80483b3:	90                   	nop    
 80483b4:	90                   	nop    
 80483b5:	90                   	nop    
 80483b6:	90                   	nop    
 80483b7:	90                   	nop    
 80483b8:	90                   	nop    
 80483b9:	90                   	nop    
 80483ba:	90                   	nop    
 80483bb:	90                   	nop    
 80483bc:	90                   	nop    
 80483bd:	90                   	nop    
 80483be:	90                   	nop    
 80483bf:	90                   	nop    

080483c0 <__do_global_dtors_aux>:
 80483c0:	55                   	push   %ebp
 80483c1:	89 e5                	mov    %esp,%ebp
 80483c3:	53                   	push   %ebx
 80483c4:	83 ec 04             	sub    $0x4,%esp
 80483c7:	80 3d 1c a0 04 08 00 	cmpb   $0x0,0x804a01c
 80483ce:	75 40                	jne    8048410 <__do_global_dtors_aux+0x50>
 80483d0:	8b 15 20 a0 04 08    	mov    0x804a020,%edx
 80483d6:	b8 18 9f 04 08       	mov    $0x8049f18,%eax
 80483db:	2d 14 9f 04 08       	sub    $0x8049f14,%eax
 80483e0:	c1 f8 02             	sar    $0x2,%eax
 80483e3:	8d 58 ff             	lea    -0x1(%eax),%ebx
 80483e6:	39 da                	cmp    %ebx,%edx
 80483e8:	73 1f                	jae    8048409 <__do_global_dtors_aux+0x49>
 80483ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80483f0:	8d 42 01             	lea    0x1(%edx),%eax
 80483f3:	a3 20 a0 04 08       	mov    %eax,0x804a020
 80483f8:	ff 14 85 14 9f 04 08 	call   *0x8049f14(,%eax,4)
 80483ff:	8b 15 20 a0 04 08    	mov    0x804a020,%edx
 8048405:	39 da                	cmp    %ebx,%edx
 8048407:	72 e7                	jb     80483f0 <__do_global_dtors_aux+0x30>
 8048409:	c6 05 1c a0 04 08 01 	movb   $0x1,0x804a01c
 8048410:	83 c4 04             	add    $0x4,%esp
 8048413:	5b                   	pop    %ebx
 8048414:	5d                   	pop    %ebp
 8048415:	c3                   	ret    
 8048416:	8d 76 00             	lea    0x0(%esi),%esi
 8048419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048420 <frame_dummy>:
 8048420:	55                   	push   %ebp
 8048421:	89 e5                	mov    %esp,%ebp
 8048423:	83 ec 08             	sub    $0x8,%esp
 8048426:	a1 1c 9f 04 08       	mov    0x8049f1c,%eax
 804842b:	85 c0                	test   %eax,%eax
 804842d:	74 12                	je     8048441 <frame_dummy+0x21>
 804842f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048434:	85 c0                	test   %eax,%eax
 8048436:	74 09                	je     8048441 <frame_dummy+0x21>
 8048438:	c7 04 24 1c 9f 04 08 	movl   $0x8049f1c,(%esp)
 804843f:	ff d0                	call   *%eax
 8048441:	c9                   	leave  
 8048442:	c3                   	ret    
 8048443:	90                   	nop    

08048444 <tmult_ok_ref>:
 8048444:	55                   	push   %ebp
 8048445:	89 e5                	mov    %esp,%ebp
 8048447:	53                   	push   %ebx
 8048448:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804844b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804844e:	89 da                	mov    %ebx,%edx
 8048450:	0f af d1             	imul   %ecx,%edx
 8048453:	8b 45 10             	mov    0x10(%ebp),%eax
 8048456:	89 10                	mov    %edx,(%eax)
 8048458:	b8 01 00 00 00       	mov    $0x1,%eax
 804845d:	85 c9                	test   %ecx,%ecx
 804845f:	74 0f                	je     8048470 <tmult_ok_ref+0x2c>
 8048461:	89 d0                	mov    %edx,%eax
 8048463:	c1 fa 1f             	sar    $0x1f,%edx
 8048466:	f7 f9                	idiv   %ecx
 8048468:	39 d8                	cmp    %ebx,%eax
 804846a:	0f 94 c0             	sete   %al
 804846d:	0f b6 c0             	movzbl %al,%eax
 8048470:	5b                   	pop    %ebx
 8048471:	5d                   	pop    %ebp
 8048472:	c3                   	ret    

08048473 <umult_ok_ref>:
 8048473:	55                   	push   %ebp
 8048474:	89 e5                	mov    %esp,%ebp
 8048476:	53                   	push   %ebx
 8048477:	8b 4d 08             	mov    0x8(%ebp),%ecx
 804847a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804847d:	89 da                	mov    %ebx,%edx
 804847f:	0f af d1             	imul   %ecx,%edx
 8048482:	8b 45 10             	mov    0x10(%ebp),%eax
 8048485:	89 10                	mov    %edx,(%eax)
 8048487:	b8 01 00 00 00       	mov    $0x1,%eax
 804848c:	85 c9                	test   %ecx,%ecx
 804848e:	74 11                	je     80484a1 <umult_ok_ref+0x2e>
 8048490:	89 d0                	mov    %edx,%eax
 8048492:	ba 00 00 00 00       	mov    $0x0,%edx
 8048497:	f7 f1                	div    %ecx
 8048499:	39 d8                	cmp    %ebx,%eax
 804849b:	0f 94 c0             	sete   %al
 804849e:	0f b6 c0             	movzbl %al,%eax
 80484a1:	5b                   	pop    %ebx
 80484a2:	5d                   	pop    %ebp
 80484a3:	c3                   	ret    

080484a4 <tmult_ok1>:
 80484a4:	55                   	push   %ebp
 80484a5:	89 e5                	mov    %esp,%ebp
 80484a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80484aa:	0f af 45 08          	imul   0x8(%ebp),%eax
 80484ae:	8b 55 10             	mov    0x10(%ebp),%edx
 80484b1:	89 02                	mov    %eax,(%edx)
 80484b3:	0f 93 c0             	setae  %al
 80484b6:	b8 00 00 00 00       	mov    $0x0,%eax
 80484bb:	5d                   	pop    %ebp
 80484bc:	c3                   	ret    

080484bd <tmult_ok2>:
 80484bd:	55                   	push   %ebp
 80484be:	89 e5                	mov    %esp,%ebp
 80484c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80484c3:	0f af 45 08          	imul   0x8(%ebp),%eax
 80484c7:	8b 55 10             	mov    0x10(%ebp),%edx
 80484ca:	89 02                	mov    %eax,(%edx)
 80484cc:	0f 93 c0             	setae  %al
 80484cf:	a1 24 a0 04 08       	mov    0x804a024,%eax
 80484d4:	5d                   	pop    %ebp
 80484d5:	c3                   	ret    

080484d6 <tmult_ok3>:
 80484d6:	55                   	push   %ebp
 80484d7:	89 e5                	mov    %esp,%ebp
 80484d9:	53                   	push   %ebx
 80484da:	8b 45 0c             	mov    0xc(%ebp),%eax
 80484dd:	0f af 45 08          	imul   0x8(%ebp),%eax
 80484e1:	8b 55 10             	mov    0x10(%ebp),%edx
 80484e4:	89 02                	mov    %eax,(%edx)
 80484e6:	0f 93 c3             	setae  %bl
 80484e9:	0f b6 c3             	movzbl %bl,%eax
 80484ec:	5b                   	pop    %ebx
 80484ed:	5d                   	pop    %ebp
 80484ee:	c3                   	ret    

080484ef <tmult_ok4>:
 80484ef:	55                   	push   %ebp
 80484f0:	89 e5                	mov    %esp,%ebp
 80484f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80484f5:	0f af 45 08          	imul   0x8(%ebp),%eax
 80484f9:	8b 55 10             	mov    0x10(%ebp),%edx
 80484fc:	89 02                	mov    %eax,(%edx)
 80484fe:	0f 93 c0             	setae  %al
 8048501:	0f b6 c0             	movzbl %al,%eax
 8048504:	5d                   	pop    %ebp
 8048505:	c3                   	ret    

08048506 <umult_ok>:
 8048506:	55                   	push   %ebp
 8048507:	89 e5                	mov    %esp,%ebp
 8048509:	53                   	push   %ebx
 804850a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 804850d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048510:	89 c8                	mov    %ecx,%eax
 8048512:	f7 e3                	mul    %ebx
 8048514:	89 c1                	mov    %eax,%ecx
 8048516:	0f 93 c2             	setae  %dl
 8048519:	0f b6 da             	movzbl %dl,%ebx
 804851c:	8b 45 10             	mov    0x10(%ebp),%eax
 804851f:	89 08                	mov    %ecx,(%eax)
 8048521:	89 d8                	mov    %ebx,%eax
 8048523:	5b                   	pop    %ebx
 8048524:	5d                   	pop    %ebp
 8048525:	c3                   	ret    

08048526 <umult_ok2>:
 8048526:	55                   	push   %ebp
 8048527:	89 e5                	mov    %esp,%ebp
 8048529:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804852c:	8b 55 08             	mov    0x8(%ebp),%edx
 804852f:	89 d0                	mov    %edx,%eax
 8048531:	f7 e1                	mul    %ecx
 8048533:	89 c2                	mov    %eax,%edx
 8048535:	0f 93 c1             	setae  %cl
 8048538:	8b 45 10             	mov    0x10(%ebp),%eax
 804853b:	89 10                	mov    %edx,(%eax)
 804853d:	0f b6 c1             	movzbl %cl,%eax
 8048540:	5d                   	pop    %ebp
 8048541:	c3                   	ret    

08048542 <main>:
 8048542:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048546:	83 e4 f0             	and    $0xfffffff0,%esp
 8048549:	ff 71 fc             	pushl  -0x4(%ecx)
 804854c:	55                   	push   %ebp
 804854d:	89 e5                	mov    %esp,%ebp
 804854f:	57                   	push   %edi
 8048550:	56                   	push   %esi
 8048551:	53                   	push   %ebx
 8048552:	51                   	push   %ecx
 8048553:	83 ec 38             	sub    $0x38,%esp
 8048556:	8b 39                	mov    (%ecx),%edi
 8048558:	8b 49 04             	mov    0x4(%ecx),%ecx
 804855b:	89 4d dc             	mov    %ecx,-0x24(%ebp)
 804855e:	bb 00 00 01 00       	mov    $0x10000,%ebx
 8048563:	83 ff 01             	cmp    $0x1,%edi
 8048566:	7e 20                	jle    8048588 <main+0x46>
 8048568:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804856f:	00 
 8048570:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048577:	00 
 8048578:	8b 55 dc             	mov    -0x24(%ebp),%edx
 804857b:	8b 42 04             	mov    0x4(%edx),%eax
 804857e:	89 04 24             	mov    %eax,(%esp)
 8048581:	e8 ea fd ff ff       	call   8048370 <strtol@plt>
 8048586:	89 c3                	mov    %eax,%ebx
 8048588:	be ff ff 00 00       	mov    $0xffff,%esi
 804858d:	83 ff 02             	cmp    $0x2,%edi
 8048590:	7e 20                	jle    80485b2 <main+0x70>
 8048592:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8048599:	00 
 804859a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 80485a1:	00 
 80485a2:	8b 55 dc             	mov    -0x24(%ebp),%edx
 80485a5:	8b 42 08             	mov    0x8(%edx),%eax
 80485a8:	89 04 24             	mov    %eax,(%esp)
 80485ab:	e8 c0 fd ff ff       	call   8048370 <strtol@plt>
 80485b0:	89 c6                	mov    %eax,%esi
 80485b2:	bf 01 00 00 00       	mov    $0x1,%edi
 80485b7:	85 db                	test   %ebx,%ebx
 80485b9:	74 14                	je     80485cf <main+0x8d>
 80485bb:	89 f2                	mov    %esi,%edx
 80485bd:	0f af d3             	imul   %ebx,%edx
 80485c0:	89 d0                	mov    %edx,%eax
 80485c2:	c1 fa 1f             	sar    $0x1f,%edx
 80485c5:	f7 fb                	idiv   %ebx
 80485c7:	39 c6                	cmp    %eax,%esi
 80485c9:	0f 94 c0             	sete   %al
 80485cc:	0f b6 f8             	movzbl %al,%edi
 80485cf:	89 7c 24 14          	mov    %edi,0x14(%esp)
 80485d3:	89 f0                	mov    %esi,%eax
 80485d5:	0f af c3             	imul   %ebx,%eax
 80485d8:	89 44 24 10          	mov    %eax,0x10(%esp)
 80485dc:	89 74 24 0c          	mov    %esi,0xc(%esp)
 80485e0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80485e4:	c7 44 24 04 a0 89 04 	movl   $0x80489a0,0x4(%esp)
 80485eb:	08 
 80485ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80485f3:	e8 58 fd ff ff       	call   8048350 <__printf_chk@plt>
 80485f8:	8d 45 ec             	lea    -0x14(%ebp),%eax
 80485fb:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485ff:	89 74 24 04          	mov    %esi,0x4(%esp)
 8048603:	89 1c 24             	mov    %ebx,(%esp)
 8048606:	e8 a1 02 00 00       	call   80488ac <tmult_ok_asm>
 804860b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 804860e:	ba 1c 8b 04 08       	mov    $0x8048b1c,%edx
 8048613:	39 c7                	cmp    %eax,%edi
 8048615:	74 05                	je     804861c <main+0xda>
 8048617:	ba 18 8b 04 08       	mov    $0x8048b18,%edx
 804861c:	89 44 24 18          	mov    %eax,0x18(%esp)
 8048620:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 8048624:	89 74 24 10          	mov    %esi,0x10(%esp)
 8048628:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 804862c:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048630:	c7 44 24 04 c8 89 04 	movl   $0x80489c8,0x4(%esp)
 8048637:	08 
 8048638:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804863f:	e8 0c fd ff ff       	call   8048350 <__printf_chk@plt>
 8048644:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8048647:	89 44 24 08          	mov    %eax,0x8(%esp)
 804864b:	89 74 24 04          	mov    %esi,0x4(%esp)
 804864f:	89 1c 24             	mov    %ebx,(%esp)
 8048652:	e8 4d fe ff ff       	call   80484a4 <tmult_ok1>
 8048657:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 804865a:	ba 1c 8b 04 08       	mov    $0x8048b1c,%edx
 804865f:	39 c7                	cmp    %eax,%edi
 8048661:	74 05                	je     8048668 <main+0x126>
 8048663:	ba 18 8b 04 08       	mov    $0x8048b18,%edx
 8048668:	89 44 24 18          	mov    %eax,0x18(%esp)
 804866c:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 8048670:	89 74 24 10          	mov    %esi,0x10(%esp)
 8048674:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8048678:	89 54 24 08          	mov    %edx,0x8(%esp)
 804867c:	c7 44 24 04 f0 89 04 	movl   $0x80489f0,0x4(%esp)
 8048683:	08 
 8048684:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804868b:	e8 c0 fc ff ff       	call   8048350 <__printf_chk@plt>
 8048690:	8d 45 ec             	lea    -0x14(%ebp),%eax
 8048693:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048697:	89 74 24 04          	mov    %esi,0x4(%esp)
 804869b:	89 1c 24             	mov    %ebx,(%esp)
 804869e:	e8 1a fe ff ff       	call   80484bd <tmult_ok2>
 80486a3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 80486a6:	ba 1c 8b 04 08       	mov    $0x8048b1c,%edx
 80486ab:	39 c7                	cmp    %eax,%edi
 80486ad:	74 05                	je     80486b4 <main+0x172>
 80486af:	ba 18 8b 04 08       	mov    $0x8048b18,%edx
 80486b4:	89 44 24 18          	mov    %eax,0x18(%esp)
 80486b8:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 80486bc:	89 74 24 10          	mov    %esi,0x10(%esp)
 80486c0:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 80486c4:	89 54 24 08          	mov    %edx,0x8(%esp)
 80486c8:	c7 44 24 04 14 8a 04 	movl   $0x8048a14,0x4(%esp)
 80486cf:	08 
 80486d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80486d7:	e8 74 fc ff ff       	call   8048350 <__printf_chk@plt>
 80486dc:	8d 45 ec             	lea    -0x14(%ebp),%eax
 80486df:	89 44 24 08          	mov    %eax,0x8(%esp)
 80486e3:	89 74 24 04          	mov    %esi,0x4(%esp)
 80486e7:	89 1c 24             	mov    %ebx,(%esp)
 80486ea:	e8 e7 fd ff ff       	call   80484d6 <tmult_ok3>
 80486ef:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 80486f2:	ba 1c 8b 04 08       	mov    $0x8048b1c,%edx
 80486f7:	39 c7                	cmp    %eax,%edi
 80486f9:	74 05                	je     8048700 <main+0x1be>
 80486fb:	ba 18 8b 04 08       	mov    $0x8048b18,%edx
 8048700:	89 44 24 18          	mov    %eax,0x18(%esp)
 8048704:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 8048708:	89 74 24 10          	mov    %esi,0x10(%esp)
 804870c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8048710:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048714:	c7 44 24 04 38 8a 04 	movl   $0x8048a38,0x4(%esp)
 804871b:	08 
 804871c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048723:	e8 28 fc ff ff       	call   8048350 <__printf_chk@plt>
 8048728:	8d 45 ec             	lea    -0x14(%ebp),%eax
 804872b:	89 44 24 08          	mov    %eax,0x8(%esp)
 804872f:	89 74 24 04          	mov    %esi,0x4(%esp)
 8048733:	89 1c 24             	mov    %ebx,(%esp)
 8048736:	e8 b4 fd ff ff       	call   80484ef <tmult_ok4>
 804873b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 804873e:	ba 1c 8b 04 08       	mov    $0x8048b1c,%edx
 8048743:	39 c7                	cmp    %eax,%edi
 8048745:	74 05                	je     804874c <main+0x20a>
 8048747:	ba 18 8b 04 08       	mov    $0x8048b18,%edx
 804874c:	89 44 24 18          	mov    %eax,0x18(%esp)
 8048750:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 8048754:	89 74 24 10          	mov    %esi,0x10(%esp)
 8048758:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 804875c:	89 54 24 08          	mov    %edx,0x8(%esp)
 8048760:	c7 44 24 04 5c 8a 04 	movl   $0x8048a5c,0x4(%esp)
 8048767:	08 
 8048768:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804876f:	e8 dc fb ff ff       	call   8048350 <__printf_chk@plt>
 8048774:	bf 01 00 00 00       	mov    $0x1,%edi
 8048779:	85 db                	test   %ebx,%ebx
 804877b:	74 14                	je     8048791 <main+0x24f>
 804877d:	89 f0                	mov    %esi,%eax
 804877f:	0f af c3             	imul   %ebx,%eax
 8048782:	ba 00 00 00 00       	mov    $0x0,%edx
 8048787:	f7 f3                	div    %ebx
 8048789:	39 f0                	cmp    %esi,%eax
 804878b:	0f 94 c0             	sete   %al
 804878e:	0f b6 f8             	movzbl %al,%edi
 8048791:	89 7c 24 14          	mov    %edi,0x14(%esp)
 8048795:	89 f0                	mov    %esi,%eax
 8048797:	0f af c3             	imul   %ebx,%eax
 804879a:	89 44 24 10          	mov    %eax,0x10(%esp)
 804879e:	89 74 24 0c          	mov    %esi,0xc(%esp)
 80487a2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 80487a6:	c7 44 24 04 80 8a 04 	movl   $0x8048a80,0x4(%esp)
 80487ad:	08 
 80487ae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80487b5:	e8 96 fb ff ff       	call   8048350 <__printf_chk@plt>
 80487ba:	8d 45 e8             	lea    -0x18(%ebp),%eax
 80487bd:	89 44 24 08          	mov    %eax,0x8(%esp)
 80487c1:	89 74 24 04          	mov    %esi,0x4(%esp)
 80487c5:	89 1c 24             	mov    %ebx,(%esp)
 80487c8:	e8 f6 00 00 00       	call   80488c3 <umult_ok_asm>
 80487cd:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 80487d0:	ba 1c 8b 04 08       	mov    $0x8048b1c,%edx
 80487d5:	39 c7                	cmp    %eax,%edi
 80487d7:	74 05                	je     80487de <main+0x29c>
 80487d9:	ba 18 8b 04 08       	mov    $0x8048b18,%edx
 80487de:	89 44 24 18          	mov    %eax,0x18(%esp)
 80487e2:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 80487e6:	89 74 24 10          	mov    %esi,0x10(%esp)
 80487ea:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 80487ee:	89 54 24 08          	mov    %edx,0x8(%esp)
 80487f2:	c7 44 24 04 a8 8a 04 	movl   $0x8048aa8,0x4(%esp)
 80487f9:	08 
 80487fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048801:	e8 4a fb ff ff       	call   8048350 <__printf_chk@plt>
 8048806:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048809:	89 44 24 08          	mov    %eax,0x8(%esp)
 804880d:	89 74 24 04          	mov    %esi,0x4(%esp)
 8048811:	89 1c 24             	mov    %ebx,(%esp)
 8048814:	e8 ed fc ff ff       	call   8048506 <umult_ok>
 8048819:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 804881c:	ba 1c 8b 04 08       	mov    $0x8048b1c,%edx
 8048821:	39 c7                	cmp    %eax,%edi
 8048823:	74 05                	je     804882a <main+0x2e8>
 8048825:	ba 18 8b 04 08       	mov    $0x8048b18,%edx
 804882a:	89 44 24 18          	mov    %eax,0x18(%esp)
 804882e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 8048832:	89 74 24 10          	mov    %esi,0x10(%esp)
 8048836:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 804883a:	89 54 24 08          	mov    %edx,0x8(%esp)
 804883e:	c7 44 24 04 d0 8a 04 	movl   $0x8048ad0,0x4(%esp)
 8048845:	08 
 8048846:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804884d:	e8 fe fa ff ff       	call   8048350 <__printf_chk@plt>
 8048852:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048855:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048859:	89 74 24 04          	mov    %esi,0x4(%esp)
 804885d:	89 1c 24             	mov    %ebx,(%esp)
 8048860:	e8 c1 fc ff ff       	call   8048526 <umult_ok2>
 8048865:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8048868:	ba 1c 8b 04 08       	mov    $0x8048b1c,%edx
 804886d:	39 c7                	cmp    %eax,%edi
 804886f:	74 05                	je     8048876 <main+0x334>
 8048871:	ba 18 8b 04 08       	mov    $0x8048b18,%edx
 8048876:	89 44 24 18          	mov    %eax,0x18(%esp)
 804887a:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 804887e:	89 74 24 10          	mov    %esi,0x10(%esp)
 8048882:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 8048886:	89 54 24 08          	mov    %edx,0x8(%esp)
 804888a:	c7 44 24 04 f4 8a 04 	movl   $0x8048af4,0x4(%esp)
 8048891:	08 
 8048892:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048899:	e8 b2 fa ff ff       	call   8048350 <__printf_chk@plt>
 804889e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80488a5:	e8 d6 fa ff ff       	call   8048380 <exit@plt>
 80488aa:	90                   	nop    
 80488ab:	90                   	nop    

080488ac <tmult_ok_asm>:
 80488ac:	55                   	push   %ebp
 80488ad:	89 e5                	mov    %esp,%ebp
 80488af:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488b2:	0f af 45 08          	imul   0x8(%ebp),%eax
 80488b6:	8b 55 10             	mov    0x10(%ebp),%edx
 80488b9:	89 02                	mov    %eax,(%edx)
 80488bb:	0f 93 c0             	setae  %al
 80488be:	0f b6 c0             	movzbl %al,%eax
 80488c1:	5d                   	pop    %ebp
 80488c2:	c3                   	ret    

080488c3 <umult_ok_asm>:
 80488c3:	55                   	push   %ebp
 80488c4:	89 e5                	mov    %esp,%ebp
 80488c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488c9:	8b 4b 08             	mov    0x8(%ebx),%ecx
 80488cc:	f7 e1                	mul    %ecx
 80488ce:	8b 55 10             	mov    0x10(%ebp),%edx
 80488d1:	89 02                	mov    %eax,(%edx)
 80488d3:	0f 93 c0             	setae  %al
 80488d6:	0f b6 c0             	movzbl %al,%eax
 80488d9:	5d                   	pop    %ebp
 80488da:	c3                   	ret    
 80488db:	90                   	nop    
 80488dc:	90                   	nop    
 80488dd:	90                   	nop    
 80488de:	90                   	nop    
 80488df:	90                   	nop    

080488e0 <__libc_csu_fini>:
 80488e0:	55                   	push   %ebp
 80488e1:	89 e5                	mov    %esp,%ebp
 80488e3:	5d                   	pop    %ebp
 80488e4:	c3                   	ret    
 80488e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80488e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080488f0 <__libc_csu_init>:
 80488f0:	55                   	push   %ebp
 80488f1:	89 e5                	mov    %esp,%ebp
 80488f3:	57                   	push   %edi
 80488f4:	56                   	push   %esi
 80488f5:	53                   	push   %ebx
 80488f6:	e8 4f 00 00 00       	call   804894a <__i686.get_pc_thunk.bx>
 80488fb:	81 c3 f9 16 00 00    	add    $0x16f9,%ebx
 8048901:	83 ec 0c             	sub    $0xc,%esp
 8048904:	e8 f7 f9 ff ff       	call   8048300 <_init>
 8048909:	8d bb 18 ff ff ff    	lea    -0xe8(%ebx),%edi
 804890f:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
 8048915:	29 c7                	sub    %eax,%edi
 8048917:	c1 ff 02             	sar    $0x2,%edi
 804891a:	85 ff                	test   %edi,%edi
 804891c:	74 24                	je     8048942 <__libc_csu_init+0x52>
 804891e:	31 f6                	xor    %esi,%esi
 8048920:	8b 45 10             	mov    0x10(%ebp),%eax
 8048923:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048927:	8b 45 0c             	mov    0xc(%ebp),%eax
 804892a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804892e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048931:	89 04 24             	mov    %eax,(%esp)
 8048934:	ff 94 b3 18 ff ff ff 	call   *-0xe8(%ebx,%esi,4)
 804893b:	83 c6 01             	add    $0x1,%esi
 804893e:	39 fe                	cmp    %edi,%esi
 8048940:	72 de                	jb     8048920 <__libc_csu_init+0x30>
 8048942:	83 c4 0c             	add    $0xc,%esp
 8048945:	5b                   	pop    %ebx
 8048946:	5e                   	pop    %esi
 8048947:	5f                   	pop    %edi
 8048948:	5d                   	pop    %ebp
 8048949:	c3                   	ret    

0804894a <__i686.get_pc_thunk.bx>:
 804894a:	8b 1c 24             	mov    (%esp),%ebx
 804894d:	c3                   	ret    
 804894e:	90                   	nop    
 804894f:	90                   	nop    

08048950 <__do_global_ctors_aux>:
 8048950:	55                   	push   %ebp
 8048951:	89 e5                	mov    %esp,%ebp
 8048953:	53                   	push   %ebx
 8048954:	83 ec 04             	sub    $0x4,%esp
 8048957:	a1 0c 9f 04 08       	mov    0x8049f0c,%eax
 804895c:	83 f8 ff             	cmp    $0xffffffff,%eax
 804895f:	74 13                	je     8048974 <__do_global_ctors_aux+0x24>
 8048961:	bb 0c 9f 04 08       	mov    $0x8049f0c,%ebx
 8048966:	66 90                	xchg   %ax,%ax
 8048968:	83 eb 04             	sub    $0x4,%ebx
 804896b:	ff d0                	call   *%eax
 804896d:	8b 03                	mov    (%ebx),%eax
 804896f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048972:	75 f4                	jne    8048968 <__do_global_ctors_aux+0x18>
 8048974:	83 c4 04             	add    $0x4,%esp
 8048977:	5b                   	pop    %ebx
 8048978:	5d                   	pop    %ebp
 8048979:	c3                   	ret    
 804897a:	90                   	nop    
 804897b:	90                   	nop    

Disassembly of section .fini:

0804897c <_fini>:
 804897c:	55                   	push   %ebp
 804897d:	89 e5                	mov    %esp,%ebp
 804897f:	53                   	push   %ebx
 8048980:	83 ec 04             	sub    $0x4,%esp
 8048983:	e8 00 00 00 00       	call   8048988 <_fini+0xc>
 8048988:	5b                   	pop    %ebx
 8048989:	81 c3 6c 16 00 00    	add    $0x166c,%ebx
 804898f:	e8 2c fa ff ff       	call   80483c0 <__do_global_dtors_aux>
 8048994:	59                   	pop    %ecx
 8048995:	5b                   	pop    %ebx
 8048996:	c9                   	leave  
 8048997:	c3                   	ret    
