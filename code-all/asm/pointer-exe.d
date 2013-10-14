
pointer:     file format elf32-i386

Disassembly of section .init:

080482c0 <_init>:
 80482c0:	55                   	push   %ebp
 80482c1:	89 e5                	mov    %esp,%ebp
 80482c3:	53                   	push   %ebx
 80482c4:	e8 00 00 00 00       	call   80482c9 <_init+0x9>
 80482c9:	5b                   	pop    %ebx
 80482ca:	81 c3 ab 13 00 00    	add    $0x13ab,%ebx
 80482d0:	83 bb 20 00 00 00 00 	cmpl   $0x0,0x20(%ebx)
 80482d7:	74 05                	je     80482de <_init+0x1e>
 80482d9:	e8 22 7d fb f7       	call   0 <_init-0x80482c0>
 80482de:	89 f6                	mov    %esi,%esi
 80482e0:	e8 fb 00 00 00       	call   80483e0 <frame_dummy>
 80482e5:	e8 36 02 00 00       	call   8048520 <__do_global_ctors_aux>
 80482ea:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80482ed:	c9                   	leave  
 80482ee:	c3                   	ret    
Disassembly of section .plt:

080482f0 <.plt>:
 80482f0:	ff 35 78 96 04 08    	pushl  0x8049678
 80482f6:	ff 25 7c 96 04 08    	jmp    *0x804967c
 80482fc:	00 00                	add    %al,(%eax)
 80482fe:	00 00                	add    %al,(%eax)
 8048300:	ff 25 80 96 04 08    	jmp    *0x8049680
 8048306:	68 00 00 00 00       	push   $0x0
 804830b:	e9 e0 ff ff ff       	jmp    80482f0 <_init+0x30>
 8048310:	ff 25 84 96 04 08    	jmp    *0x8049684
 8048316:	68 08 00 00 00       	push   $0x8
 804831b:	e9 d0 ff ff ff       	jmp    80482f0 <_init+0x30>
 8048320:	ff 25 88 96 04 08    	jmp    *0x8049688
 8048326:	68 10 00 00 00       	push   $0x10
 804832b:	e9 c0 ff ff ff       	jmp    80482f0 <_init+0x30>
 8048330:	ff 25 8c 96 04 08    	jmp    *0x804968c
 8048336:	68 18 00 00 00       	push   $0x18
 804833b:	e9 b0 ff ff ff       	jmp    80482f0 <_init+0x30>
 8048340:	ff 25 90 96 04 08    	jmp    *0x8049690
 8048346:	68 20 00 00 00       	push   $0x20
 804834b:	e9 a0 ff ff ff       	jmp    80482f0 <_init+0x30>
Disassembly of section .text:

08048350 <_start>:
 8048350:	31 ed                	xor    %ebp,%ebp
 8048352:	5e                   	pop    %esi
 8048353:	89 e1                	mov    %esp,%ecx
 8048355:	83 e4 f8             	and    $0xfffffff8,%esp
 8048358:	50                   	push   %eax
 8048359:	54                   	push   %esp
 804835a:	52                   	push   %edx
 804835b:	68 54 85 04 08       	push   $0x8048554
 8048360:	68 c0 82 04 08       	push   $0x80482c0
 8048365:	51                   	push   %ecx
 8048366:	56                   	push   %esi
 8048367:	68 f8 84 04 08       	push   $0x80484f8
 804836c:	e8 bf ff ff ff       	call   8048330 <_init+0x70>
 8048371:	f4                   	hlt    
 8048372:	90                   	nop    
 8048373:	90                   	nop    

08048374 <gcc2_compiled.>:
 8048374:	90 90 90 90 90 90 90 90 90 90 90 90                 ............

08048380 <__do_global_dtors_aux>:
 8048380:	55                   	push   %ebp
 8048381:	89 e5                	mov    %esp,%ebp
 8048383:	83 ec 08             	sub    $0x8,%esp
 8048386:	83 3d 58 96 04 08 00 	cmpl   $0x0,0x8049658
 804838d:	75 3e                	jne    80483cd <__do_global_dtors_aux+0x4d>
 804838f:	eb 12                	jmp    80483a3 <__do_global_dtors_aux+0x23>
 8048391:	a1 54 96 04 08       	mov    0x8049654,%eax
 8048396:	8d 50 04             	lea    0x4(%eax),%edx
 8048399:	89 15 54 96 04 08    	mov    %edx,0x8049654
 804839f:	8b 00                	mov    (%eax),%eax
 80483a1:	ff d0                	call   *%eax
 80483a3:	a1 54 96 04 08       	mov    0x8049654,%eax
 80483a8:	83 38 00             	cmpl   $0x0,(%eax)
 80483ab:	75 e4                	jne    8048391 <__do_global_dtors_aux+0x11>
 80483ad:	b8 20 83 04 08       	mov    $0x8048320,%eax
 80483b2:	85 c0                	test   %eax,%eax
 80483b4:	74 0d                	je     80483c3 <__do_global_dtors_aux+0x43>
 80483b6:	83 c4 f4             	add    $0xfffffff4,%esp
 80483b9:	68 60 96 04 08       	push   $0x8049660
 80483be:	e8 5d ff ff ff       	call   8048320 <_init+0x60>
 80483c3:	c7 05 58 96 04 08 01 	movl   $0x1,0x8049658
 80483ca:	00 00 00 
 80483cd:	89 ec                	mov    %ebp,%esp
 80483cf:	5d                   	pop    %ebp
 80483d0:	c3                   	ret    
 80483d1:	8d 76 00             	lea    0x0(%esi),%esi

080483d4 <fini_dummy>:
 80483d4:	55                   	push   %ebp
 80483d5:	89 e5                	mov    %esp,%ebp
 80483d7:	83 ec 08             	sub    $0x8,%esp
 80483da:	89 ec                	mov    %ebp,%esp
 80483dc:	5d                   	pop    %ebp
 80483dd:	c3                   	ret    
 80483de:	89 f6                	mov    %esi,%esi

080483e0 <frame_dummy>:
 80483e0:	55                   	push   %ebp
 80483e1:	89 e5                	mov    %esp,%ebp
 80483e3:	83 ec 08             	sub    $0x8,%esp
 80483e6:	b8 00 83 04 08       	mov    $0x8048300,%eax
 80483eb:	85 c0                	test   %eax,%eax
 80483ed:	74 12                	je     8048401 <frame_dummy+0x21>
 80483ef:	83 c4 f8             	add    $0xfffffff8,%esp
 80483f2:	68 38 97 04 08       	push   $0x8049738
 80483f7:	68 60 96 04 08       	push   $0x8049660
 80483fc:	e8 ff fe ff ff       	call   8048300 <_init+0x40>
 8048401:	89 ec                	mov    %ebp,%esp
 8048403:	5d                   	pop    %ebp
 8048404:	c3                   	ret    
 8048405:	8d 76 00             	lea    0x0(%esi),%esi

08048408 <init_dummy>:
 8048408:	55                   	push   %ebp
 8048409:	89 e5                	mov    %esp,%ebp
 804840b:	83 ec 08             	sub    $0x8,%esp
 804840e:	89 ec                	mov    %ebp,%esp
 8048410:	5d                   	pop    %ebp
 8048411:	c3                   	ret    
 8048412:	90                   	nop    
 8048413:	90                   	nop    

08048414 <fun>:
 8048414:	55                   	push   %ebp
 8048415:	89 e5                	mov    %esp,%ebp
 8048417:	83 ec 1c             	sub    $0x1c,%esp
 804841a:	57                   	push   %edi
 804841b:	56                   	push   %esi
 804841c:	53                   	push   %ebx
 804841d:	c7 45 f8 01 00 00 00 	movl   $0x1,0xfffffff8(%ebp)
 8048424:	8d 75 f8             	lea    0xfffffff8(%ebp),%esi
 8048427:	c6 46 04 61          	movb   $0x61,0x4(%esi)
 804842b:	83 c4 f4             	add    $0xfffffff4,%esp
 804842e:	6a 04                	push   $0x4
 8048430:	e8 db fe ff ff       	call   8048310 <_init+0x50>
 8048435:	89 c7                	mov    %eax,%edi
 8048437:	8b 45 08             	mov    0x8(%ebp),%eax
 804843a:	89 45 f0             	mov    %eax,0xfffffff0(%ebp)
 804843d:	8d 5d f0             	lea    0xfffffff0(%ebp),%ebx
 8048440:	c7 43 04 5c 96 04 08 	movl   $0x804965c,0x4(%ebx)
 8048447:	8a 46 04             	mov    0x4(%esi),%al
 804844a:	fe c0                	inc    %al
 804844c:	88 07                	mov    %al,(%edi)
 804844e:	8b 55 f0             	mov    0xfffffff0(%ebp),%edx
 8048451:	8b 02                	mov    (%edx),%eax
 8048453:	50                   	push   %eax
 8048454:	52                   	push   %edx
 8048455:	53                   	push   %ebx
 8048456:	68 a0 85 04 08       	push   $0x80485a0
 804845b:	e8 e0 fe ff ff       	call   8048340 <_init+0x80>
 8048460:	8b 53 04             	mov    0x4(%ebx),%edx
 8048463:	83 c4 20             	add    $0x20,%esp
 8048466:	8b 02                	mov    (%edx),%eax
 8048468:	50                   	push   %eax
 8048469:	52                   	push   %edx
 804846a:	8d 45 f4             	lea    0xfffffff4(%ebp),%eax
 804846d:	50                   	push   %eax
 804846e:	68 e0 85 04 08       	push   $0x80485e0
 8048473:	e8 c8 fe ff ff       	call   8048340 <_init+0x80>
 8048478:	83 c4 fc             	add    $0xfffffffc,%esp
 804847b:	0f be 46 04          	movsbl 0x4(%esi),%eax
 804847f:	50                   	push   %eax
 8048480:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 8048483:	50                   	push   %eax
 8048484:	68 08 86 04 08       	push   $0x8048608
 8048489:	e8 b2 fe ff ff       	call   8048340 <_init+0x80>
 804848e:	83 c4 20             	add    $0x20,%esp
 8048491:	83 c4 fc             	add    $0xfffffffc,%esp
 8048494:	0f be 07             	movsbl (%edi),%eax
 8048497:	50                   	push   %eax
 8048498:	57                   	push   %edi
 8048499:	68 24 86 04 08       	push   $0x8048624
 804849e:	e8 9d fe ff ff       	call   8048340 <_init+0x80>
 80484a3:	83 c4 f8             	add    $0xfffffff8,%esp
 80484a6:	68 14 84 04 08       	push   $0x8048414
 80484ab:	68 41 86 04 08       	push   $0x8048641
 80484b0:	e8 8b fe ff ff       	call   8048340 <_init+0x80>
 80484b5:	8b 45 08             	mov    0x8(%ebp),%eax
 80484b8:	83 c4 20             	add    $0x20,%esp
 80484bb:	ff 08                	decl   (%eax)
 80484bd:	83 38 00             	cmpl   $0x0,(%eax)
 80484c0:	7e 09                	jle    80484cb <fun+0xb7>
 80484c2:	83 c4 f4             	add    $0xfffffff4,%esp
 80484c5:	50                   	push   %eax
 80484c6:	e8 49 ff ff ff       	call   8048414 <fun>
 80484cb:	8d 65 d8             	lea    0xffffffd8(%ebp),%esp
 80484ce:	5b                   	pop    %ebx
 80484cf:	5e                   	pop    %esi
 80484d0:	5f                   	pop    %edi
 80484d1:	89 ec                	mov    %ebp,%esp
 80484d3:	5d                   	pop    %ebp
 80484d4:	c3                   	ret    
 80484d5:	8d 76 00             	lea    0x0(%esi),%esi

080484d8 <test>:
 80484d8:	55                   	push   %ebp
 80484d9:	89 e5                	mov    %esp,%ebp
 80484db:	83 ec 18             	sub    $0x18,%esp
 80484de:	c7 45 fc 02 00 00 00 	movl   $0x2,0xfffffffc(%ebp)
 80484e5:	83 c4 f4             	add    $0xfffffff4,%esp
 80484e8:	8d 45 fc             	lea    0xfffffffc(%ebp),%eax
 80484eb:	50                   	push   %eax
 80484ec:	e8 23 ff ff ff       	call   8048414 <fun>
 80484f1:	8b 45 fc             	mov    0xfffffffc(%ebp),%eax
 80484f4:	89 ec                	mov    %ebp,%esp
 80484f6:	5d                   	pop    %ebp
 80484f7:	c3                   	ret    

080484f8 <main>:
 80484f8:	55                   	push   %ebp
 80484f9:	89 e5                	mov    %esp,%ebp
 80484fb:	83 ec 48             	sub    $0x48,%esp
 80484fe:	8d 45 c0             	lea    0xffffffc0(%ebp),%eax
 8048501:	25 ff 0f 00 00       	and    $0xfff,%eax
 8048506:	83 c0 0f             	add    $0xf,%eax
 8048509:	25 f0 1f 00 00       	and    $0x1ff0,%eax
 804850e:	29 c4                	sub    %eax,%esp
 8048510:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp,1)
 8048517:	e8 bc ff ff ff       	call   80484d8 <test>
 804851c:	89 ec                	mov    %ebp,%esp
 804851e:	5d                   	pop    %ebp
 804851f:	c3                   	ret    

08048520 <__do_global_ctors_aux>:
 8048520:	55                   	push   %ebp
 8048521:	89 e5                	mov    %esp,%ebp
 8048523:	83 ec 14             	sub    $0x14,%esp
 8048526:	53                   	push   %ebx
 8048527:	bb 64 96 04 08       	mov    $0x8049664,%ebx
 804852c:	83 3d 64 96 04 08 ff 	cmpl   $0xffffffff,0x8049664
 8048533:	74 0c                	je     8048541 <__do_global_ctors_aux+0x21>
 8048535:	8b 03                	mov    (%ebx),%eax
 8048537:	ff d0                	call   *%eax
 8048539:	83 c3 fc             	add    $0xfffffffc,%ebx
 804853c:	83 3b ff             	cmpl   $0xffffffff,(%ebx)
 804853f:	75 f4                	jne    8048535 <__do_global_ctors_aux+0x15>
 8048541:	5b                   	pop    %ebx
 8048542:	89 ec                	mov    %ebp,%esp
 8048544:	5d                   	pop    %ebp
 8048545:	c3                   	ret    
 8048546:	89 f6                	mov    %esi,%esi

08048548 <init_dummy>:
 8048548:	55                   	push   %ebp
 8048549:	89 e5                	mov    %esp,%ebp
 804854b:	83 ec 08             	sub    $0x8,%esp
 804854e:	89 ec                	mov    %ebp,%esp
 8048550:	5d                   	pop    %ebp
 8048551:	c3                   	ret    
 8048552:	90                   	nop    
 8048553:	90                   	nop    
Disassembly of section .fini:

08048554 <_fini>:
 8048554:	55                   	push   %ebp
 8048555:	89 e5                	mov    %esp,%ebp
 8048557:	53                   	push   %ebx
 8048558:	e8 00 00 00 00       	call   804855d <_etext+0x9>
 804855d:	5b                   	pop    %ebx
 804855e:	81 c3 17 11 00 00    	add    $0x1117,%ebx
 8048564:	e8 17 fe ff ff       	call   8048380 <__do_global_dtors_aux>
 8048569:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804856c:	c9                   	leave  
 804856d:	c3                   	ret    
