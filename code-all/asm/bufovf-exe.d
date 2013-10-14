
bufovf:     file format elf32-i386

Disassembly of section .init:

0804835c <_init>:
 804835c:	55                   	push   %ebp
 804835d:	89 e5                	mov    %esp,%ebp
 804835f:	53                   	push   %ebx
 8048360:	e8 00 00 00 00       	call   8048365 <_init+0x9>
 8048365:	5b                   	pop    %ebx
 8048366:	81 c3 ab 12 00 00    	add    $0x12ab,%ebx
 804836c:	83 bb 28 00 00 00 00 	cmpl   $0x0,0x28(%ebx)
 8048373:	74 05                	je     804837a <_init+0x1e>
 8048375:	e8 86 7c fb f7       	call   0 <_init-0x804835c>
 804837a:	89 f6                	mov    %esi,%esi
 804837c:	e8 1f 01 00 00       	call   80484a0 <frame_dummy>
 8048381:	e8 0a 02 00 00       	call   8048590 <__do_global_ctors_aux>
 8048386:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 8048389:	c9                   	leave  
 804838a:	c3                   	ret    
Disassembly of section .plt:

0804838c <.plt>:
 804838c:	ff 35 14 96 04 08    	pushl  0x8049614
 8048392:	ff 25 18 96 04 08    	jmp    *0x8049618
 8048398:	00 00                	add    %al,(%eax)
 804839a:	00 00                	add    %al,(%eax)
 804839c:	ff 25 1c 96 04 08    	jmp    *0x804961c
 80483a2:	68 00 00 00 00       	push   $0x0
 80483a7:	e9 e0 ff ff ff       	jmp    804838c <_init+0x30>
 80483ac:	ff 25 20 96 04 08    	jmp    *0x8049620
 80483b2:	68 08 00 00 00       	push   $0x8
 80483b7:	e9 d0 ff ff ff       	jmp    804838c <_init+0x30>
 80483bc:	ff 25 24 96 04 08    	jmp    *0x8049624
 80483c2:	68 10 00 00 00       	push   $0x10
 80483c7:	e9 c0 ff ff ff       	jmp    804838c <_init+0x30>
 80483cc:	ff 25 28 96 04 08    	jmp    *0x8049628
 80483d2:	68 18 00 00 00       	push   $0x18
 80483d7:	e9 b0 ff ff ff       	jmp    804838c <_init+0x30>
 80483dc:	ff 25 2c 96 04 08    	jmp    *0x804962c
 80483e2:	68 20 00 00 00       	push   $0x20
 80483e7:	e9 a0 ff ff ff       	jmp    804838c <_init+0x30>
 80483ec:	ff 25 30 96 04 08    	jmp    *0x8049630
 80483f2:	68 28 00 00 00       	push   $0x28
 80483f7:	e9 90 ff ff ff       	jmp    804838c <_init+0x30>
 80483fc:	ff 25 34 96 04 08    	jmp    *0x8049634
 8048402:	68 30 00 00 00       	push   $0x30
 8048407:	e9 80 ff ff ff       	jmp    804838c <_init+0x30>
Disassembly of section .text:

08048410 <_start>:
 8048410:	31 ed                	xor    %ebp,%ebp
 8048412:	5e                   	pop    %esi
 8048413:	89 e1                	mov    %esp,%ecx
 8048415:	83 e4 f8             	and    $0xfffffff8,%esp
 8048418:	50                   	push   %eax
 8048419:	54                   	push   %esp
 804841a:	52                   	push   %edx
 804841b:	68 c4 85 04 08       	push   $0x80485c4
 8048420:	68 5c 83 04 08       	push   $0x804835c
 8048425:	51                   	push   %ecx
 8048426:	56                   	push   %esi
 8048427:	68 64 85 04 08       	push   $0x8048564
 804842c:	e8 bb ff ff ff       	call   80483ec <_init+0x90>
 8048431:	f4                   	hlt    
 8048432:	90                   	nop    
 8048433:	90                   	nop    

08048434 <gcc2_compiled.>:
 8048434:	90 90 90 90 90 90 90 90 90 90 90 90                 ............

08048440 <__do_global_dtors_aux>:
 8048440:	55                   	push   %ebp
 8048441:	89 e5                	mov    %esp,%ebp
 8048443:	83 ec 08             	sub    $0x8,%esp
 8048446:	83 3d f8 95 04 08 00 	cmpl   $0x0,0x80495f8
 804844d:	75 3e                	jne    804848d <__do_global_dtors_aux+0x4d>
 804844f:	eb 12                	jmp    8048463 <__do_global_dtors_aux+0x23>
 8048451:	a1 f4 95 04 08       	mov    0x80495f4,%eax
 8048456:	8d 50 04             	lea    0x4(%eax),%edx
 8048459:	89 15 f4 95 04 08    	mov    %edx,0x80495f4
 804845f:	8b 00                	mov    (%eax),%eax
 8048461:	ff d0                	call   *%eax
 8048463:	a1 f4 95 04 08       	mov    0x80495f4,%eax
 8048468:	83 38 00             	cmpl   $0x0,(%eax)
 804846b:	75 e4                	jne    8048451 <__do_global_dtors_aux+0x11>
 804846d:	b8 dc 83 04 08       	mov    $0x80483dc,%eax
 8048472:	85 c0                	test   %eax,%eax
 8048474:	74 0d                	je     8048483 <__do_global_dtors_aux+0x43>
 8048476:	83 c4 f4             	add    $0xfffffff4,%esp
 8048479:	68 fc 95 04 08       	push   $0x80495fc
 804847e:	e8 59 ff ff ff       	call   80483dc <_init+0x80>
 8048483:	c7 05 f8 95 04 08 01 	movl   $0x1,0x80495f8
 804848a:	00 00 00 
 804848d:	89 ec                	mov    %ebp,%esp
 804848f:	5d                   	pop    %ebp
 8048490:	c3                   	ret    
 8048491:	8d 76 00             	lea    0x0(%esi),%esi

08048494 <fini_dummy>:
 8048494:	55                   	push   %ebp
 8048495:	89 e5                	mov    %esp,%ebp
 8048497:	83 ec 08             	sub    $0x8,%esp
 804849a:	89 ec                	mov    %ebp,%esp
 804849c:	5d                   	pop    %ebp
 804849d:	c3                   	ret    
 804849e:	89 f6                	mov    %esi,%esi

080484a0 <frame_dummy>:
 80484a0:	55                   	push   %ebp
 80484a1:	89 e5                	mov    %esp,%ebp
 80484a3:	83 ec 08             	sub    $0x8,%esp
 80484a6:	b8 9c 83 04 08       	mov    $0x804839c,%eax
 80484ab:	85 c0                	test   %eax,%eax
 80484ad:	74 12                	je     80484c1 <frame_dummy+0x21>
 80484af:	83 c4 f8             	add    $0xfffffff8,%esp
 80484b2:	68 dc 96 04 08       	push   $0x80496dc
 80484b7:	68 fc 95 04 08       	push   $0x80495fc
 80484bc:	e8 db fe ff ff       	call   804839c <_init+0x40>
 80484c1:	89 ec                	mov    %ebp,%esp
 80484c3:	5d                   	pop    %ebp
 80484c4:	c3                   	ret    
 80484c5:	8d 76 00             	lea    0x0(%esi),%esi

080484c8 <init_dummy>:
 80484c8:	55                   	push   %ebp
 80484c9:	89 e5                	mov    %esp,%ebp
 80484cb:	83 ec 08             	sub    $0x8,%esp
 80484ce:	89 ec                	mov    %ebp,%esp
 80484d0:	5d                   	pop    %ebp
 80484d1:	c3                   	ret    
 80484d2:	90                   	nop    
 80484d3:	90                   	nop    
 80484d4:	90                   	nop    
 80484d5:	90                   	nop    
 80484d6:	90                   	nop    
 80484d7:	90                   	nop    
 80484d8:	90                   	nop    
 80484d9:	90                   	nop    
 80484da:	90                   	nop    
 80484db:	90                   	nop    
 80484dc:	90                   	nop    
 80484dd:	90                   	nop    
 80484de:	90                   	nop    
 80484df:	90                   	nop    

080484e0 <strlen>:
 80484e0:	55                   	push   %ebp
 80484e1:	89 e5                	mov    %esp,%ebp
 80484e3:	8b 55 08             	mov    0x8(%ebp),%edx
 80484e6:	31 c9                	xor    %ecx,%ecx
 80484e8:	eb 07                	jmp    80484f1 <strlen+0x11>
 80484ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80484f0:	41                   	inc    %ecx
 80484f1:	8a 02                	mov    (%edx),%al
 80484f3:	42                   	inc    %edx
 80484f4:	84 c0                	test   %al,%al
 80484f6:	75 f8                	jne    80484f0 <strlen+0x10>
 80484f8:	89 c8                	mov    %ecx,%eax
 80484fa:	89 ec                	mov    %ebp,%esp
 80484fc:	5d                   	pop    %ebp
 80484fd:	c3                   	ret    
 80484fe:	89 f6                	mov    %esi,%esi

08048500 <strcpy>:
 8048500:	55                   	push   %ebp
 8048501:	89 e5                	mov    %esp,%ebp
 8048503:	53                   	push   %ebx
 8048504:	8b 55 08             	mov    0x8(%ebp),%edx
 8048507:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804850a:	89 d3                	mov    %edx,%ebx
 804850c:	8d 74 26 00          	lea    0x0(%esi,1),%esi
 8048510:	8a 01                	mov    (%ecx),%al
 8048512:	41                   	inc    %ecx
 8048513:	88 02                	mov    %al,(%edx)
 8048515:	42                   	inc    %edx
 8048516:	84 c0                	test   %al,%al
 8048518:	75 f6                	jne    8048510 <strcpy+0x10>
 804851a:	89 d8                	mov    %ebx,%eax
 804851c:	5b                   	pop    %ebx
 804851d:	89 ec                	mov    %ebp,%esp
 804851f:	5d                   	pop    %ebp
 8048520:	c3                   	ret    
 8048521:	8d 76 00             	lea    0x0(%esi),%esi

08048524 <getline>:
 8048524:	55                   	push   %ebp
 8048525:	89 e5                	mov    %esp,%ebp
 8048527:	83 ec 10             	sub    $0x10,%esp
 804852a:	56                   	push   %esi
 804852b:	53                   	push   %ebx
 804852c:	83 c4 f4             	add    $0xfffffff4,%esp
 804852f:	8d 5d f8             	lea    0xfffffff8(%ebp),%ebx
 8048532:	53                   	push   %ebx
 8048533:	e8 74 fe ff ff       	call   80483ac <_init+0x50>
 8048538:	83 c4 f4             	add    $0xfffffff4,%esp
 804853b:	83 c4 f4             	add    $0xfffffff4,%esp
 804853e:	53                   	push   %ebx
 804853f:	e8 9c ff ff ff       	call   80484e0 <strlen>
 8048544:	50                   	push   %eax
 8048545:	e8 82 fe ff ff       	call   80483cc <_init+0x70>
 804854a:	89 c6                	mov    %eax,%esi
 804854c:	83 c4 30             	add    $0x30,%esp
 804854f:	83 c4 f8             	add    $0xfffffff8,%esp
 8048552:	53                   	push   %ebx
 8048553:	56                   	push   %esi
 8048554:	e8 a7 ff ff ff       	call   8048500 <strcpy>
 8048559:	89 f0                	mov    %esi,%eax
 804855b:	8d 65 e8             	lea    0xffffffe8(%ebp),%esp
 804855e:	5b                   	pop    %ebx
 804855f:	5e                   	pop    %esi
 8048560:	89 ec                	mov    %ebp,%esp
 8048562:	5d                   	pop    %ebp
 8048563:	c3                   	ret    

08048564 <main>:
 8048564:	55                   	push   %ebp
 8048565:	89 e5                	mov    %esp,%ebp
 8048567:	83 ec 08             	sub    $0x8,%esp
 804856a:	83 c4 f4             	add    $0xfffffff4,%esp
 804856d:	68 e8 85 04 08       	push   $0x80485e8
 8048572:	e8 85 fe ff ff       	call   80483fc <_init+0xa0>
 8048577:	83 c4 f4             	add    $0xfffffff4,%esp
 804857a:	e8 a5 ff ff ff       	call   8048524 <getline>
 804857f:	50                   	push   %eax
 8048580:	e8 37 fe ff ff       	call   80483bc <_init+0x60>
 8048585:	31 c0                	xor    %eax,%eax
 8048587:	89 ec                	mov    %ebp,%esp
 8048589:	5d                   	pop    %ebp
 804858a:	c3                   	ret    
 804858b:	90                   	nop    
 804858c:	90                   	nop    
 804858d:	90                   	nop    
 804858e:	90                   	nop    
 804858f:	90                   	nop    

08048590 <__do_global_ctors_aux>:
 8048590:	55                   	push   %ebp
 8048591:	89 e5                	mov    %esp,%ebp
 8048593:	83 ec 14             	sub    $0x14,%esp
 8048596:	53                   	push   %ebx
 8048597:	bb 00 96 04 08       	mov    $0x8049600,%ebx
 804859c:	83 3d 00 96 04 08 ff 	cmpl   $0xffffffff,0x8049600
 80485a3:	74 0c                	je     80485b1 <__do_global_ctors_aux+0x21>
 80485a5:	8b 03                	mov    (%ebx),%eax
 80485a7:	ff d0                	call   *%eax
 80485a9:	83 c3 fc             	add    $0xfffffffc,%ebx
 80485ac:	83 3b ff             	cmpl   $0xffffffff,(%ebx)
 80485af:	75 f4                	jne    80485a5 <__do_global_ctors_aux+0x15>
 80485b1:	5b                   	pop    %ebx
 80485b2:	89 ec                	mov    %ebp,%esp
 80485b4:	5d                   	pop    %ebp
 80485b5:	c3                   	ret    
 80485b6:	89 f6                	mov    %esi,%esi

080485b8 <init_dummy>:
 80485b8:	55                   	push   %ebp
 80485b9:	89 e5                	mov    %esp,%ebp
 80485bb:	83 ec 08             	sub    $0x8,%esp
 80485be:	89 ec                	mov    %ebp,%esp
 80485c0:	5d                   	pop    %ebp
 80485c1:	c3                   	ret    
 80485c2:	90                   	nop    
 80485c3:	90                   	nop    
Disassembly of section .fini:

080485c4 <_fini>:
 80485c4:	55                   	push   %ebp
 80485c5:	89 e5                	mov    %esp,%ebp
 80485c7:	53                   	push   %ebx
 80485c8:	e8 00 00 00 00       	call   80485cd <_etext+0x9>
 80485cd:	5b                   	pop    %ebx
 80485ce:	81 c3 43 10 00 00    	add    $0x1043,%ebx
 80485d4:	e8 67 fe ff ff       	call   8048440 <__do_global_dtors_aux>
 80485d9:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80485dc:	c9                   	leave  
 80485dd:	c3                   	ret    
