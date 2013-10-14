
bufbomb:     file format elf32-i386

Disassembly of section .init:

0804830c <_init>:
 804830c:	55                   	push   %ebp
 804830d:	89 e5                	mov    %esp,%ebp
 804830f:	53                   	push   %ebx
 8048310:	e8 00 00 00 00       	call   8048315 <_init+0x9>
 8048315:	5b                   	pop    %ebx
 8048316:	81 c3 fb 12 00 00    	add    $0x12fb,%ebx
 804831c:	83 bb 20 00 00 00 00 	cmpl   $0x0,0x20(%ebx)
 8048323:	74 05                	je     804832a <_init+0x1e>
 8048325:	e8 d6 7c fb f7       	call   0 <_init-0x804830c>
 804832a:	89 f6                	mov    %esi,%esi
 804832c:	e8 ff 00 00 00       	call   8048430 <frame_dummy>
 8048331:	e8 3a 02 00 00       	call   8048570 <__do_global_ctors_aux>
 8048336:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8048339:	c9                   	leave  
 804833a:	c3                   	ret    
Disassembly of section .plt:

0804833c <.plt>:
 804833c:	ff 35 14 96 04 08    	pushl  0x8049614
 8048342:	ff 25 18 96 04 08    	jmp    *0x8049618
 8048348:	00 00                	add    %al,(%eax)
 804834a:	00 00                	add    %al,(%eax)
 804834c:	ff 25 1c 96 04 08    	jmp    *0x804961c
 8048352:	68 00 00 00 00       	push   $0x0
 8048357:	e9 e0 ff ff ff       	jmp    804833c <_init+0x30>
 804835c:	ff 25 20 96 04 08    	jmp    *0x8049620
 8048362:	68 08 00 00 00       	push   $0x8
 8048367:	e9 d0 ff ff ff       	jmp    804833c <_init+0x30>
 804836c:	ff 25 24 96 04 08    	jmp    *0x8049624
 8048372:	68 10 00 00 00       	push   $0x10
 8048377:	e9 c0 ff ff ff       	jmp    804833c <_init+0x30>
 804837c:	ff 25 28 96 04 08    	jmp    *0x8049628
 8048382:	68 18 00 00 00       	push   $0x18
 8048387:	e9 b0 ff ff ff       	jmp    804833c <_init+0x30>
 804838c:	ff 25 2c 96 04 08    	jmp    *0x804962c
 8048392:	68 20 00 00 00       	push   $0x20
 8048397:	e9 a0 ff ff ff       	jmp    804833c <_init+0x30>
Disassembly of section .text:

080483a0 <_start>:
 80483a0:	31 ed                	xor    %ebp,%ebp
 80483a2:	5e                   	pop    %esi
 80483a3:	89 e1                	mov    %esp,%ecx
 80483a5:	83 e4 f8             	and    $0xfffffff8,%esp
 80483a8:	50                   	push   %eax
 80483a9:	54                   	push   %esp
 80483aa:	52                   	push   %edx
 80483ab:	68 a4 85 04 08       	push   $0x80485a4
 80483b0:	68 0c 83 04 08       	push   $0x804830c
 80483b5:	51                   	push   %ecx
 80483b6:	56                   	push   %esi
 80483b7:	68 3c 85 04 08       	push   $0x804853c
 80483bc:	e8 ab ff ff ff       	call   804836c <_init+0x60>
 80483c1:	f4                   	hlt    
 80483c2:	90                   	nop    
 80483c3:	90                   	nop    

080483c4 <gcc2_compiled.>:
 80483c4:	90 90 90 90 90 90 90 90 90 90 90 90                 ............

080483d0 <__do_global_dtors_aux>:
 80483d0:	55                   	push   %ebp
 80483d1:	89 e5                	mov    %esp,%ebp
 80483d3:	83 ec 08             	sub    $0x8,%esp
 80483d6:	83 3d f8 95 04 08 00 	cmpl   $0x0,0x80495f8
 80483dd:	75 3e                	jne    804841d <__do_global_dtors_aux+0x4d>
 80483df:	eb 12                	jmp    80483f3 <__do_global_dtors_aux+0x23>
 80483e1:	a1 f4 95 04 08       	mov    0x80495f4,%eax
 80483e6:	8d 50 04             	lea    0x4(%eax),%edx
 80483e9:	89 15 f4 95 04 08    	mov    %edx,0x80495f4
 80483ef:	8b 00                	mov    (%eax),%eax
 80483f1:	ff d0                	call   *%eax
 80483f3:	a1 f4 95 04 08       	mov    0x80495f4,%eax
 80483f8:	83 38 00             	cmpl   $0x0,(%eax)
 80483fb:	75 e4                	jne    80483e1 <__do_global_dtors_aux+0x11>
 80483fd:	b8 5c 83 04 08       	mov    $0x804835c,%eax
 8048402:	85 c0                	test   %eax,%eax
 8048404:	74 0d                	je     8048413 <__do_global_dtors_aux+0x43>
 8048406:	83 c4 f4             	add    $0xfffffff4,%esp
 8048409:	68 fc 95 04 08       	push   $0x80495fc
 804840e:	e8 49 ff ff ff       	call   804835c <_init+0x50>
 8048413:	c7 05 f8 95 04 08 01 	movl   $0x1,0x80495f8
 804841a:	00 00 00 
 804841d:	89 ec                	mov    %ebp,%esp
 804841f:	5d                   	pop    %ebp
 8048420:	c3                   	ret    
 8048421:	8d 76 00             	lea    0x0(%esi),%esi

08048424 <fini_dummy>:
 8048424:	55                   	push   %ebp
 8048425:	89 e5                	mov    %esp,%ebp
 8048427:	83 ec 08             	sub    $0x8,%esp
 804842a:	89 ec                	mov    %ebp,%esp
 804842c:	5d                   	pop    %ebp
 804842d:	c3                   	ret    
 804842e:	89 f6                	mov    %esi,%esi

08048430 <frame_dummy>:
 8048430:	55                   	push   %ebp
 8048431:	89 e5                	mov    %esp,%ebp
 8048433:	83 ec 08             	sub    $0x8,%esp
 8048436:	b8 4c 83 04 08       	mov    $0x804834c,%eax
 804843b:	85 c0                	test   %eax,%eax
 804843d:	74 12                	je     8048451 <frame_dummy+0x21>
 804843f:	83 c4 f8             	add    $0xfffffff8,%esp
 8048442:	68 dc 96 04 08       	push   $0x80496dc
 8048447:	68 fc 95 04 08       	push   $0x80495fc
 804844c:	e8 fb fe ff ff       	call   804834c <_init+0x40>
 8048451:	89 ec                	mov    %ebp,%esp
 8048453:	5d                   	pop    %ebp
 8048454:	c3                   	ret    
 8048455:	8d 76 00             	lea    0x0(%esi),%esi

08048458 <init_dummy>:
 8048458:	55                   	push   %ebp
 8048459:	89 e5                	mov    %esp,%ebp
 804845b:	83 ec 08             	sub    $0x8,%esp
 804845e:	89 ec                	mov    %ebp,%esp
 8048460:	5d                   	pop    %ebp
 8048461:	c3                   	ret    
 8048462:	90                   	nop    
 8048463:	90                   	nop    
 8048464:	90                   	nop    
 8048465:	90                   	nop    
 8048466:	90                   	nop    
 8048467:	90                   	nop    
 8048468:	90                   	nop    
 8048469:	90                   	nop    
 804846a:	90                   	nop    
 804846b:	90                   	nop    
 804846c:	90                   	nop    
 804846d:	90                   	nop    
 804846e:	90                   	nop    
 804846f:	90                   	nop    

08048470 <getxs>:
 8048470:	55                   	push   %ebp
 8048471:	89 e5                	mov    %esp,%ebp
 8048473:	83 ec 0c             	sub    $0xc,%esp
 8048476:	57                   	push   %edi
 8048477:	56                   	push   %esi
 8048478:	53                   	push   %ebx
 8048479:	8b 5d 08             	mov    0x8(%ebp),%ebx
 804847c:	be 01 00 00 00       	mov    $0x1,%esi
 8048481:	31 ff                	xor    %edi,%edi
 8048483:	eb 42                	jmp    80484c7 <getxs+0x57>
 8048485:	a1 d4 96 04 08       	mov    0x80496d4,%eax
 804848a:	f6 44 50 01 10       	testb  $0x10,0x1(%eax,%edx,2)
 804848f:	74 36                	je     80484c7 <getxs+0x57>
 8048491:	8d 42 d0             	lea    0xffffffd0(%edx),%eax
 8048494:	83 f8 09             	cmp    $0x9,%eax
 8048497:	77 07                	ja     80484a0 <getxs+0x30>
 8048499:	89 c1                	mov    %eax,%ecx
 804849b:	eb 11                	jmp    80484ae <getxs+0x3e>
 804849d:	8d 76 00             	lea    0x0(%esi),%esi
 80484a0:	8d 42 bf             	lea    0xffffffbf(%edx),%eax
 80484a3:	8d 4a a9             	lea    0xffffffa9(%edx),%ecx
 80484a6:	83 f8 05             	cmp    $0x5,%eax
 80484a9:	77 03                	ja     80484ae <getxs+0x3e>
 80484ab:	8d 4a c9             	lea    0xffffffc9(%edx),%ecx
 80484ae:	85 f6                	test   %esi,%esi
 80484b0:	74 06                	je     80484b8 <getxs+0x48>
 80484b2:	89 cf                	mov    %ecx,%edi
 80484b4:	31 f6                	xor    %esi,%esi
 80484b6:	eb 0f                	jmp    80484c7 <getxs+0x57>
 80484b8:	89 f8                	mov    %edi,%eax
 80484ba:	c0 e0 04             	shl    $0x4,%al
 80484bd:	00 c8                	add    %cl,%al
 80484bf:	88 03                	mov    %al,(%ebx)
 80484c1:	43                   	inc    %ebx
 80484c2:	be 01 00 00 00       	mov    $0x1,%esi
 80484c7:	a1 d8 96 04 08       	mov    0x80496d8,%eax
 80484cc:	83 c4 f4             	add    $0xfffffff4,%esp
 80484cf:	50                   	push   %eax
 80484d0:	e8 b7 fe ff ff       	call   804838c <_init+0x80>
 80484d5:	89 c2                	mov    %eax,%edx
 80484d7:	83 c4 10             	add    $0x10,%esp
 80484da:	83 fa ff             	cmp    $0xffffffff,%edx
 80484dd:	74 05                	je     80484e4 <getxs+0x74>
 80484df:	83 fa 0a             	cmp    $0xa,%edx
 80484e2:	75 a1                	jne    8048485 <getxs+0x15>
 80484e4:	c6 03 00             	movb   $0x0,(%ebx)
 80484e7:	8b 45 08             	mov    0x8(%ebp),%eax
 80484ea:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 80484ed:	5b                   	pop    %ebx
 80484ee:	5e                   	pop    %esi
 80484ef:	5f                   	pop    %edi
 80484f0:	89 ec                	mov    %ebp,%esp
 80484f2:	5d                   	pop    %ebp
 80484f3:	c3                   	ret    

080484f4 <getbuf>:
 80484f4:	55                   	push   %ebp
 80484f5:	89 e5                	mov    %esp,%ebp
 80484f7:	83 ec 18             	sub    $0x18,%esp
 80484fa:	83 c4 f4             	add    $0xfffffff4,%esp
 80484fd:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
 8048500:	50                   	push   %eax
 8048501:	e8 6a ff ff ff       	call   8048470 <getxs>
 8048506:	b8 01 00 00 00       	mov    $0x1,%eax
 804850b:	89 ec                	mov    %ebp,%esp
 804850d:	5d                   	pop    %ebp
 804850e:	c3                   	ret    
 804850f:	90                   	nop    

08048510 <test>:
 8048510:	55                   	push   %ebp
 8048511:	89 e5                	mov    %esp,%ebp
 8048513:	83 ec 08             	sub    $0x8,%esp
 8048516:	83 c4 f4             	add    $0xfffffff4,%esp
 8048519:	68 c8 85 04 08       	push   $0x80485c8
 804851e:	e8 59 fe ff ff       	call   804837c <_init+0x70>
 8048523:	e8 cc ff ff ff       	call   80484f4 <getbuf>
 8048528:	83 c4 f8             	add    $0xfffffff8,%esp
 804852b:	50                   	push   %eax
 804852c:	68 d9 85 04 08       	push   $0x80485d9
 8048531:	e8 46 fe ff ff       	call   804837c <_init+0x70>
 8048536:	89 ec                	mov    %ebp,%esp
 8048538:	5d                   	pop    %ebp
 8048539:	c3                   	ret    
 804853a:	89 f6                	mov    %esi,%esi

0804853c <main>:
 804853c:	55                   	push   %ebp
 804853d:	89 e5                	mov    %esp,%ebp
 804853f:	83 ec 48             	sub    $0x48,%esp
 8048542:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
 8048545:	25 ff 0f 00 00       	and    $0xfff,%eax
 804854a:	83 c0 0f             	add    $0xf,%eax
 804854d:	25 f0 1f 00 00       	and    $0x1ff0,%eax
 8048552:	29 c4                	sub    %eax,%esp
 8048554:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp,1)
 804855b:	e8 b0 ff ff ff       	call   8048510 <test>
 8048560:	31 c0                	xor    %eax,%eax
 8048562:	89 ec                	mov    %ebp,%esp
 8048564:	5d                   	pop    %ebp
 8048565:	c3                   	ret    
 8048566:	90                   	nop    
 8048567:	90                   	nop    
 8048568:	90                   	nop    
 8048569:	90                   	nop    
 804856a:	90                   	nop    
 804856b:	90                   	nop    
 804856c:	90                   	nop    
 804856d:	90                   	nop    
 804856e:	90                   	nop    
 804856f:	90                   	nop    

08048570 <__do_global_ctors_aux>:
 8048570:	55                   	push   %ebp
 8048571:	89 e5                	mov    %esp,%ebp
 8048573:	83 ec 14             	sub    $0x14,%esp
 8048576:	53                   	push   %ebx
 8048577:	bb 00 96 04 08       	mov    $0x8049600,%ebx
 804857c:	83 3d 00 96 04 08 ff 	cmpl   $0xffffffff,0x8049600
 8048583:	74 0c                	je     8048591 <__do_global_ctors_aux+0x21>
 8048585:	8b 03                	mov    (%ebx),%eax
 8048587:	ff d0                	call   *%eax
 8048589:	83 c3 fc             	add    $0xfffffffc,%ebx
 804858c:	83 3b ff             	cmpl   $0xffffffff,(%ebx)
 804858f:	75 f4                	jne    8048585 <__do_global_ctors_aux+0x15>
 8048591:	5b                   	pop    %ebx
 8048592:	89 ec                	mov    %ebp,%esp
 8048594:	5d                   	pop    %ebp
 8048595:	c3                   	ret    
 8048596:	89 f6                	mov    %esi,%esi

08048598 <init_dummy>:
 8048598:	55                   	push   %ebp
 8048599:	89 e5                	mov    %esp,%ebp
 804859b:	83 ec 08             	sub    $0x8,%esp
 804859e:	89 ec                	mov    %ebp,%esp
 80485a0:	5d                   	pop    %ebp
 80485a1:	c3                   	ret    
 80485a2:	90                   	nop    
 80485a3:	90                   	nop    
Disassembly of section .fini:

080485a4 <_fini>:
 80485a4:	55                   	push   %ebp
 80485a5:	89 e5                	mov    %esp,%ebp
 80485a7:	53                   	push   %ebx
 80485a8:	e8 00 00 00 00       	call   80485ad <_etext+0x9>
 80485ad:	5b                   	pop    %ebx
 80485ae:	81 c3 63 10 00 00    	add    $0x1063,%ebx
 80485b4:	e8 17 fe ff ff       	call   80483d0 <__do_global_dtors_aux>
 80485b9:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80485bc:	c9                   	leave  
 80485bd:	c3                   	ret    
