
branch:     file format elf32-i386

Disassembly of section .init:

08048274 <_init>:
 8048274:	55                   	push   %ebp
 8048275:	89 e5                	mov    %esp,%ebp
 8048277:	53                   	push   %ebx
 8048278:	e8 00 00 00 00       	call   804827d <_init+0x9>
 804827d:	5b                   	pop    %ebx
 804827e:	81 c3 fb 11 00 00    	add    $0x11fb,%ebx
 8048284:	83 bb 18 00 00 00 00 	cmpl   $0x0,0x18(%ebx)
 804828b:	74 05                	je     8048292 <_init+0x1e>
 804828d:	e8 6e 7d fb f7       	call   0 <_init-0x8048274>
 8048292:	89 f6                	mov    %esi,%esi
 8048294:	e8 e7 00 00 00       	call   8048380 <frame_dummy>
 8048299:	e8 62 01 00 00       	call   8048400 <__do_global_ctors_aux>
 804829e:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 80482a1:	c9                   	leave  
 80482a2:	c3                   	ret    
Disassembly of section .plt:

080482a4 <.plt>:
 80482a4:	ff 35 7c 94 04 08    	pushl  0x804947c
 80482aa:	ff 25 80 94 04 08    	jmp    *0x8049480
 80482b0:	00 00                	add    %al,(%eax)
 80482b2:	00 00                	add    %al,(%eax)
 80482b4:	ff 25 84 94 04 08    	jmp    *0x8049484
 80482ba:	68 00 00 00 00       	push   $0x0
 80482bf:	e9 e0 ff ff ff       	jmp    80482a4 <_init+0x30>
 80482c4:	ff 25 88 94 04 08    	jmp    *0x8049488
 80482ca:	68 08 00 00 00       	push   $0x8
 80482cf:	e9 d0 ff ff ff       	jmp    80482a4 <_init+0x30>
 80482d4:	ff 25 8c 94 04 08    	jmp    *0x804948c
 80482da:	68 10 00 00 00       	push   $0x10
 80482df:	e9 c0 ff ff ff       	jmp    80482a4 <_init+0x30>
Disassembly of section .text:

080482f0 <_start>:
 80482f0:	31 ed                	xor    %ebp,%ebp
 80482f2:	5e                   	pop    %esi
 80482f3:	89 e1                	mov    %esp,%ecx
 80482f5:	83 e4 f8             	and    $0xfffffff8,%esp
 80482f8:	50                   	push   %eax
 80482f9:	54                   	push   %esp
 80482fa:	52                   	push   %edx
 80482fb:	68 34 84 04 08       	push   $0x8048434
 8048300:	68 74 82 04 08       	push   $0x8048274
 8048305:	51                   	push   %ecx
 8048306:	56                   	push   %esi
 8048307:	68 e4 83 04 08       	push   $0x80483e4
 804830c:	e8 c3 ff ff ff       	call   80482d4 <_init+0x60>
 8048311:	f4                   	hlt    
 8048312:	90                   	nop    
 8048313:	90                   	nop    

08048314 <gcc2_compiled.>:
 8048314:	90 90 90 90 90 90 90 90 90 90 90 90                 ............

08048320 <__do_global_dtors_aux>:
 8048320:	55                   	push   %ebp
 8048321:	89 e5                	mov    %esp,%ebp
 8048323:	83 ec 08             	sub    $0x8,%esp
 8048326:	83 3d 60 94 04 08 00 	cmpl   $0x0,0x8049460
 804832d:	75 3e                	jne    804836d <__do_global_dtors_aux+0x4d>
 804832f:	eb 12                	jmp    8048343 <__do_global_dtors_aux+0x23>
 8048331:	a1 5c 94 04 08       	mov    0x804945c,%eax
 8048336:	8d 50 04             	lea    0x4(%eax),%edx
 8048339:	89 15 5c 94 04 08    	mov    %edx,0x804945c
 804833f:	8b 00                	mov    (%eax),%eax
 8048341:	ff d0                	call   *%eax
 8048343:	a1 5c 94 04 08       	mov    0x804945c,%eax
 8048348:	83 38 00             	cmpl   $0x0,(%eax)
 804834b:	75 e4                	jne    8048331 <__do_global_dtors_aux+0x11>
 804834d:	b8 c4 82 04 08       	mov    $0x80482c4,%eax
 8048352:	85 c0                	test   %eax,%eax
 8048354:	74 0d                	je     8048363 <__do_global_dtors_aux+0x43>
 8048356:	83 c4 f4             	add    $0xfffffff4,%esp
 8048359:	68 64 94 04 08       	push   $0x8049464
 804835e:	e8 61 ff ff ff       	call   80482c4 <_init+0x50>
 8048363:	c7 05 60 94 04 08 01 	movl   $0x1,0x8049460
 804836a:	00 00 00 
 804836d:	89 ec                	mov    %ebp,%esp
 804836f:	5d                   	pop    %ebp
 8048370:	c3                   	ret    
 8048371:	8d 76 00             	lea    0x0(%esi),%esi

08048374 <fini_dummy>:
 8048374:	55                   	push   %ebp
 8048375:	89 e5                	mov    %esp,%ebp
 8048377:	83 ec 08             	sub    $0x8,%esp
 804837a:	89 ec                	mov    %ebp,%esp
 804837c:	5d                   	pop    %ebp
 804837d:	c3                   	ret    
 804837e:	89 f6                	mov    %esi,%esi

08048380 <frame_dummy>:
 8048380:	55                   	push   %ebp
 8048381:	89 e5                	mov    %esp,%ebp
 8048383:	83 ec 08             	sub    $0x8,%esp
 8048386:	b8 b4 82 04 08       	mov    $0x80482b4,%eax
 804838b:	85 c0                	test   %eax,%eax
 804838d:	74 12                	je     80483a1 <frame_dummy+0x21>
 804838f:	83 c4 f8             	add    $0xfffffff8,%esp
 8048392:	68 34 95 04 08       	push   $0x8049534
 8048397:	68 64 94 04 08       	push   $0x8049464
 804839c:	e8 13 ff ff ff       	call   80482b4 <_init+0x40>
 80483a1:	89 ec                	mov    %ebp,%esp
 80483a3:	5d                   	pop    %ebp
 80483a4:	c3                   	ret    
 80483a5:	8d 76 00             	lea    0x0(%esi),%esi

080483a8 <init_dummy>:
 80483a8:	55                   	push   %ebp
 80483a9:	89 e5                	mov    %esp,%ebp
 80483ab:	83 ec 08             	sub    $0x8,%esp
 80483ae:	89 ec                	mov    %ebp,%esp
 80483b0:	5d                   	pop    %ebp
 80483b1:	c3                   	ret    
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

080483c0 <silly>:
 80483c0:	55                   	push   %ebp
 80483c1:	89 e5                	mov    %esp,%ebp
 80483c3:	8b 55 08             	mov    0x8(%ebp),%edx
 80483c6:	85 d2                	test   %edx,%edx
 80483c8:	7e 11                	jle    80483db <silly+0x1b>
 80483ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80483d0:	89 d0                	mov    %edx,%eax
 80483d2:	c1 f8 01             	sar    $0x1,%eax
 80483d5:	29 c2                	sub    %eax,%edx
 80483d7:	85 d2                	test   %edx,%edx
 80483d9:	7f f5                	jg     80483d0 <silly+0x10>
 80483db:	89 d0                	mov    %edx,%eax
 80483dd:	89 ec                	mov    %ebp,%esp
 80483df:	5d                   	pop    %ebp
 80483e0:	c3                   	ret    
 80483e1:	8d 76 00             	lea    0x0(%esi),%esi

080483e4 <main>:
 80483e4:	55                   	push   %ebp
 80483e5:	89 e5                	mov    %esp,%ebp
 80483e7:	83 ec 08             	sub    $0x8,%esp
 80483ea:	83 c4 f4             	add    $0xfffffff4,%esp
 80483ed:	6a 02                	push   $0x2
 80483ef:	e8 cc ff ff ff       	call   80483c0 <silly>
 80483f4:	89 ec                	mov    %ebp,%esp
 80483f6:	5d                   	pop    %ebp
 80483f7:	c3                   	ret    
 80483f8:	90                   	nop    
 80483f9:	90                   	nop    
 80483fa:	90                   	nop    
 80483fb:	90                   	nop    
 80483fc:	90                   	nop    
 80483fd:	90                   	nop    
 80483fe:	90                   	nop    
 80483ff:	90                   	nop    

08048400 <__do_global_ctors_aux>:
 8048400:	55                   	push   %ebp
 8048401:	89 e5                	mov    %esp,%ebp
 8048403:	83 ec 14             	sub    $0x14,%esp
 8048406:	53                   	push   %ebx
 8048407:	bb 68 94 04 08       	mov    $0x8049468,%ebx
 804840c:	83 3d 68 94 04 08 ff 	cmpl   $0xffffffff,0x8049468
 8048413:	74 0c                	je     8048421 <__do_global_ctors_aux+0x21>
 8048415:	8b 03                	mov    (%ebx),%eax
 8048417:	ff d0                	call   *%eax
 8048419:	83 c3 fc             	add    $0xfffffffc,%ebx
 804841c:	83 3b ff             	cmpl   $0xffffffff,(%ebx)
 804841f:	75 f4                	jne    8048415 <__do_global_ctors_aux+0x15>
 8048421:	5b                   	pop    %ebx
 8048422:	89 ec                	mov    %ebp,%esp
 8048424:	5d                   	pop    %ebp
 8048425:	c3                   	ret    
 8048426:	89 f6                	mov    %esi,%esi

08048428 <init_dummy>:
 8048428:	55                   	push   %ebp
 8048429:	89 e5                	mov    %esp,%ebp
 804842b:	83 ec 08             	sub    $0x8,%esp
 804842e:	89 ec                	mov    %ebp,%esp
 8048430:	5d                   	pop    %ebp
 8048431:	c3                   	ret    
 8048432:	90                   	nop    
 8048433:	90                   	nop    
Disassembly of section .fini:

08048434 <_fini>:
 8048434:	55                   	push   %ebp
 8048435:	89 e5                	mov    %esp,%ebp
 8048437:	53                   	push   %ebx
 8048438:	e8 00 00 00 00       	call   804843d <_etext+0x9>
 804843d:	5b                   	pop    %ebx
 804843e:	81 c3 3b 10 00 00    	add    $0x103b,%ebx
 8048444:	e8 d7 fe ff ff       	call   8048320 <__do_global_dtors_aux>
 8048449:	8b 5d fc             	mov    0xfffffffc(%ebp),%ebx
 804844c:	c9                   	leave  
 804844d:	c3                   	ret    
