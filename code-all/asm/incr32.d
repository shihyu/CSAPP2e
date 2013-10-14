
incr32:     file format elf32-i386


Disassembly of section .init:

08048448 <_init>:
 8048448:	55                   	push   %ebp
 8048449:	89 e5                	mov    %esp,%ebp
 804844b:	53                   	push   %ebx
 804844c:	83 ec 04             	sub    $0x4,%esp
 804844f:	e8 00 00 00 00       	call   8048454 <_init+0xc>
 8048454:	5b                   	pop    %ebx
 8048455:	81 c3 a0 1b 00 00    	add    $0x1ba0,%ebx
 804845b:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 8048461:	85 d2                	test   %edx,%edx
 8048463:	74 05                	je     804846a <_init+0x22>
 8048465:	e8 2e 00 00 00       	call   8048498 <__gmon_start__@plt>
 804846a:	e8 81 01 00 00       	call   80485f0 <frame_dummy>
 804846f:	e8 0c 0a 00 00       	call   8048e80 <__do_global_ctors_aux>
 8048474:	58                   	pop    %eax
 8048475:	5b                   	pop    %ebx
 8048476:	c9                   	leave  
 8048477:	c3                   	ret    

Disassembly of section .plt:

08048478 <random@plt-0x10>:
 8048478:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 804847e:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 8048484:	00 00                	add    %al,(%eax)
	...

08048488 <random@plt>:
 8048488:	ff 25 00 a0 04 08    	jmp    *0x804a000
 804848e:	68 00 00 00 00       	push   $0x0
 8048493:	e9 e0 ff ff ff       	jmp    8048478 <_init+0x30>

08048498 <__gmon_start__@plt>:
 8048498:	ff 25 04 a0 04 08    	jmp    *0x804a004
 804849e:	68 08 00 00 00       	push   $0x8
 80484a3:	e9 d0 ff ff ff       	jmp    8048478 <_init+0x30>

080484a8 <__printf_chk@plt>:
 80484a8:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80484ae:	68 10 00 00 00       	push   $0x10
 80484b3:	e9 c0 ff ff ff       	jmp    8048478 <_init+0x30>

080484b8 <calloc@plt>:
 80484b8:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 80484be:	68 18 00 00 00       	push   $0x18
 80484c3:	e9 b0 ff ff ff       	jmp    8048478 <_init+0x30>

080484c8 <__libc_start_main@plt>:
 80484c8:	ff 25 10 a0 04 08    	jmp    *0x804a010
 80484ce:	68 20 00 00 00       	push   $0x20
 80484d3:	e9 a0 ff ff ff       	jmp    8048478 <_init+0x30>

080484d8 <free@plt>:
 80484d8:	ff 25 14 a0 04 08    	jmp    *0x804a014
 80484de:	68 28 00 00 00       	push   $0x28
 80484e3:	e9 90 ff ff ff       	jmp    8048478 <_init+0x30>

080484e8 <printf@plt>:
 80484e8:	ff 25 18 a0 04 08    	jmp    *0x804a018
 80484ee:	68 30 00 00 00       	push   $0x30
 80484f3:	e9 80 ff ff ff       	jmp    8048478 <_init+0x30>

080484f8 <fwrite@plt>:
 80484f8:	ff 25 1c a0 04 08    	jmp    *0x804a01c
 80484fe:	68 38 00 00 00       	push   $0x38
 8048503:	e9 70 ff ff ff       	jmp    8048478 <_init+0x30>

08048508 <fprintf@plt>:
 8048508:	ff 25 20 a0 04 08    	jmp    *0x804a020
 804850e:	68 40 00 00 00       	push   $0x40
 8048513:	e9 60 ff ff ff       	jmp    8048478 <_init+0x30>

08048518 <malloc@plt>:
 8048518:	ff 25 24 a0 04 08    	jmp    *0x804a024
 804851e:	68 48 00 00 00       	push   $0x48
 8048523:	e9 50 ff ff ff       	jmp    8048478 <_init+0x30>

08048528 <sleep@plt>:
 8048528:	ff 25 28 a0 04 08    	jmp    *0x804a028
 804852e:	68 50 00 00 00       	push   $0x50
 8048533:	e9 40 ff ff ff       	jmp    8048478 <_init+0x30>

08048538 <times@plt>:
 8048538:	ff 25 2c a0 04 08    	jmp    *0x804a02c
 804853e:	68 58 00 00 00       	push   $0x58
 8048543:	e9 30 ff ff ff       	jmp    8048478 <_init+0x30>

08048548 <exit@plt>:
 8048548:	ff 25 30 a0 04 08    	jmp    *0x804a030
 804854e:	68 60 00 00 00       	push   $0x60
 8048553:	e9 20 ff ff ff       	jmp    8048478 <_init+0x30>

Disassembly of section .text:

08048560 <_start>:
 8048560:	31 ed                	xor    %ebp,%ebp
 8048562:	5e                   	pop    %esi
 8048563:	89 e1                	mov    %esp,%ecx
 8048565:	83 e4 f0             	and    $0xfffffff0,%esp
 8048568:	50                   	push   %eax
 8048569:	54                   	push   %esp
 804856a:	52                   	push   %edx
 804856b:	68 10 8e 04 08       	push   $0x8048e10
 8048570:	68 20 8e 04 08       	push   $0x8048e20
 8048575:	51                   	push   %ecx
 8048576:	56                   	push   %esi
 8048577:	68 21 87 04 08       	push   $0x8048721
 804857c:	e8 47 ff ff ff       	call   80484c8 <__libc_start_main@plt>
 8048581:	f4                   	hlt    
 8048582:	90                   	nop    
 8048583:	90                   	nop    
 8048584:	90                   	nop    
 8048585:	90                   	nop    
 8048586:	90                   	nop    
 8048587:	90                   	nop    
 8048588:	90                   	nop    
 8048589:	90                   	nop    
 804858a:	90                   	nop    
 804858b:	90                   	nop    
 804858c:	90                   	nop    
 804858d:	90                   	nop    
 804858e:	90                   	nop    
 804858f:	90                   	nop    

08048590 <__do_global_dtors_aux>:
 8048590:	55                   	push   %ebp
 8048591:	89 e5                	mov    %esp,%ebp
 8048593:	53                   	push   %ebx
 8048594:	83 ec 04             	sub    $0x4,%esp
 8048597:	80 3d 64 a0 04 08 00 	cmpb   $0x0,0x804a064
 804859e:	75 40                	jne    80485e0 <__do_global_dtors_aux+0x50>
 80485a0:	8b 15 68 a0 04 08    	mov    0x804a068,%edx
 80485a6:	b8 18 9f 04 08       	mov    $0x8049f18,%eax
 80485ab:	2d 14 9f 04 08       	sub    $0x8049f14,%eax
 80485b0:	c1 f8 02             	sar    $0x2,%eax
 80485b3:	8d 58 ff             	lea    -0x1(%eax),%ebx
 80485b6:	39 da                	cmp    %ebx,%edx
 80485b8:	73 1f                	jae    80485d9 <__do_global_dtors_aux+0x49>
 80485ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80485c0:	8d 42 01             	lea    0x1(%edx),%eax
 80485c3:	a3 68 a0 04 08       	mov    %eax,0x804a068
 80485c8:	ff 14 85 14 9f 04 08 	call   *0x8049f14(,%eax,4)
 80485cf:	8b 15 68 a0 04 08    	mov    0x804a068,%edx
 80485d5:	39 da                	cmp    %ebx,%edx
 80485d7:	72 e7                	jb     80485c0 <__do_global_dtors_aux+0x30>
 80485d9:	c6 05 64 a0 04 08 01 	movb   $0x1,0x804a064
 80485e0:	83 c4 04             	add    $0x4,%esp
 80485e3:	5b                   	pop    %ebx
 80485e4:	5d                   	pop    %ebp
 80485e5:	c3                   	ret    
 80485e6:	8d 76 00             	lea    0x0(%esi),%esi
 80485e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080485f0 <frame_dummy>:
 80485f0:	55                   	push   %ebp
 80485f1:	89 e5                	mov    %esp,%ebp
 80485f3:	83 ec 08             	sub    $0x8,%esp
 80485f6:	a1 1c 9f 04 08       	mov    0x8049f1c,%eax
 80485fb:	85 c0                	test   %eax,%eax
 80485fd:	74 12                	je     8048611 <frame_dummy+0x21>
 80485ff:	b8 00 00 00 00       	mov    $0x0,%eax
 8048604:	85 c0                	test   %eax,%eax
 8048606:	74 09                	je     8048611 <frame_dummy+0x21>
 8048608:	c7 04 24 1c 9f 04 08 	movl   $0x8049f1c,(%esp)
 804860f:	ff d0                	call   *%eax
 8048611:	c9                   	leave  
 8048612:	c3                   	ret    
 8048613:	90                   	nop    

08048614 <simple>:
 8048614:	55                   	push   %ebp
 8048615:	89 e5                	mov    %esp,%ebp
 8048617:	8b 55 08             	mov    0x8(%ebp),%edx
 804861a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804861d:	03 02                	add    (%edx),%eax
 804861f:	89 02                	mov    %eax,(%edx)
 8048621:	5d                   	pop    %ebp
 8048622:	c3                   	ret    

08048623 <simple_l>:
 8048623:	55                   	push   %ebp
 8048624:	89 e5                	mov    %esp,%ebp
 8048626:	8b 55 08             	mov    0x8(%ebp),%edx
 8048629:	8b 45 0c             	mov    0xc(%ebp),%eax
 804862c:	03 02                	add    (%edx),%eax
 804862e:	89 02                	mov    %eax,(%edx)
 8048630:	5d                   	pop    %ebp
 8048631:	c3                   	ret    

08048632 <call_simple>:
 8048632:	55                   	push   %ebp
 8048633:	89 e5                	mov    %esp,%ebp
 8048635:	83 ec 18             	sub    $0x18,%esp
 8048638:	c7 45 fc 25 00 00 00 	movl   $0x25,-0x4(%ebp)
 804863f:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
 8048646:	00 
 8048647:	8d 45 fc             	lea    -0x4(%ebp),%eax
 804864a:	89 04 24             	mov    %eax,(%esp)
 804864d:	e8 c2 ff ff ff       	call   8048614 <simple>
 8048652:	03 45 fc             	add    -0x4(%ebp),%eax
 8048655:	c9                   	leave  
 8048656:	c3                   	ret    

08048657 <call_simple_l>:
 8048657:	55                   	push   %ebp
 8048658:	89 e5                	mov    %esp,%ebp
 804865a:	83 ec 08             	sub    $0x8,%esp
 804865d:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
 8048664:	00 
 8048665:	c7 04 24 40 a0 04 08 	movl   $0x804a040,(%esp)
 804866c:	e8 b2 ff ff ff       	call   8048623 <simple_l>
 8048671:	03 05 44 a0 04 08    	add    0x804a044,%eax
 8048677:	c9                   	leave  
 8048678:	c3                   	ret    

08048679 <post_incr>:
 8048679:	55                   	push   %ebp
 804867a:	89 e5                	mov    %esp,%ebp
 804867c:	8b 55 08             	mov    0x8(%ebp),%edx
 804867f:	8b 02                	mov    (%edx),%eax
 8048681:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8048684:	01 c1                	add    %eax,%ecx
 8048686:	89 0a                	mov    %ecx,(%edx)
 8048688:	5d                   	pop    %ebp
 8048689:	c3                   	ret    

0804868a <post_incr_l>:
 804868a:	55                   	push   %ebp
 804868b:	89 e5                	mov    %esp,%ebp
 804868d:	8b 55 08             	mov    0x8(%ebp),%edx
 8048690:	8b 02                	mov    (%edx),%eax
 8048692:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8048695:	01 c1                	add    %eax,%ecx
 8048697:	89 0a                	mov    %ecx,(%edx)
 8048699:	5d                   	pop    %ebp
 804869a:	c3                   	ret    

0804869b <test_simple>:
 804869b:	55                   	push   %ebp
 804869c:	89 e5                	mov    %esp,%ebp
 804869e:	53                   	push   %ebx
 804869f:	83 ec 08             	sub    $0x8,%esp
 80486a2:	bb a0 a0 04 08       	mov    $0x804a0a0,%ebx
 80486a7:	b8 00 00 00 00       	mov    $0x0,%eax
 80486ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 80486b0:	89 1c 24             	mov    %ebx,(%esp)
 80486b3:	e8 5c ff ff ff       	call   8048614 <simple>
 80486b8:	83 c3 04             	add    $0x4,%ebx
 80486bb:	81 fb a0 a8 04 08    	cmp    $0x804a8a0,%ebx
 80486c1:	75 e9                	jne    80486ac <test_simple+0x11>
 80486c3:	a3 a0 a8 04 08       	mov    %eax,0x804a8a0
 80486c8:	83 c4 08             	add    $0x8,%esp
 80486cb:	5b                   	pop    %ebx
 80486cc:	5d                   	pop    %ebp
 80486cd:	c3                   	ret    

080486ce <test_simple_l>:
 80486ce:	55                   	push   %ebp
 80486cf:	89 e5                	mov    %esp,%ebp
 80486d1:	53                   	push   %ebx
 80486d2:	83 ec 08             	sub    $0x8,%esp
 80486d5:	bb c0 a8 04 08       	mov    $0x804a8c0,%ebx
 80486da:	b8 00 00 00 00       	mov    $0x0,%eax
 80486df:	89 44 24 04          	mov    %eax,0x4(%esp)
 80486e3:	89 1c 24             	mov    %ebx,(%esp)
 80486e6:	e8 38 ff ff ff       	call   8048623 <simple_l>
 80486eb:	83 c3 04             	add    $0x4,%ebx
 80486ee:	81 fb c0 b0 04 08    	cmp    $0x804b0c0,%ebx
 80486f4:	75 e9                	jne    80486df <test_simple_l+0x11>
 80486f6:	a3 c0 b0 04 08       	mov    %eax,0x804b0c0
 80486fb:	83 c4 08             	add    $0x8,%esp
 80486fe:	5b                   	pop    %ebx
 80486ff:	5d                   	pop    %ebp
 8048700:	c3                   	ret    

08048701 <cpt>:
 8048701:	55                   	push   %ebp
 8048702:	89 e5                	mov    %esp,%ebp
 8048704:	83 ec 08             	sub    $0x8,%esp
 8048707:	8b 45 0c             	mov    0xc(%ebp),%eax
 804870a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804870e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048711:	89 04 24             	mov    %eax,(%esp)
 8048714:	e8 27 02 00 00       	call   8048940 <fcyc>
 8048719:	d8 0d fc 8e 04 08    	fmuls  0x8048efc
 804871f:	c9                   	leave  
 8048720:	c3                   	ret    

08048721 <main>:
 8048721:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048725:	83 e4 f0             	and    $0xfffffff0,%esp
 8048728:	ff 71 fc             	pushl  -0x4(%ecx)
 804872b:	55                   	push   %ebp
 804872c:	89 e5                	mov    %esp,%ebp
 804872e:	57                   	push   %edi
 804872f:	56                   	push   %esi
 8048730:	53                   	push   %ebx
 8048731:	51                   	push   %ecx
 8048732:	83 ec 18             	sub    $0x18,%esp
 8048735:	bb 00 00 00 00       	mov    $0x0,%ebx
 804873a:	bf a0 a0 04 08       	mov    $0x804a0a0,%edi
 804873f:	be c0 a8 04 08       	mov    $0x804a8c0,%esi
 8048744:	e8 3f fd ff ff       	call   8048488 <random@plt>
 8048749:	89 04 9f             	mov    %eax,(%edi,%ebx,4)
 804874c:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
 804874f:	83 c3 01             	add    $0x1,%ebx
 8048752:	81 fb 00 02 00 00    	cmp    $0x200,%ebx
 8048758:	75 ea                	jne    8048744 <main+0x23>
 804875a:	c7 44 24 04 a0 a0 04 	movl   $0x804a0a0,0x4(%esp)
 8048761:	08 
 8048762:	c7 04 24 9b 86 04 08 	movl   $0x804869b,(%esp)
 8048769:	e8 93 ff ff ff       	call   8048701 <cpt>
 804876e:	dd 5c 24 0c          	fstpl  0xc(%esp)
 8048772:	c7 44 24 08 d0 8e 04 	movl   $0x8048ed0,0x8(%esp)
 8048779:	08 
 804877a:	c7 44 24 04 d7 8e 04 	movl   $0x8048ed7,0x4(%esp)
 8048781:	08 
 8048782:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048789:	e8 1a fd ff ff       	call   80484a8 <__printf_chk@plt>
 804878e:	c7 44 24 04 a0 a0 04 	movl   $0x804a0a0,0x4(%esp)
 8048795:	08 
 8048796:	c7 04 24 ce 86 04 08 	movl   $0x80486ce,(%esp)
 804879d:	e8 5f ff ff ff       	call   8048701 <cpt>
 80487a2:	dd 5c 24 0c          	fstpl  0xc(%esp)
 80487a6:	c7 44 24 08 f0 8e 04 	movl   $0x8048ef0,0x8(%esp)
 80487ad:	08 
 80487ae:	c7 44 24 04 d7 8e 04 	movl   $0x8048ed7,0x4(%esp)
 80487b5:	08 
 80487b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 80487bd:	e8 e6 fc ff ff       	call   80484a8 <__printf_chk@plt>
 80487c2:	b8 00 00 00 00       	mov    $0x0,%eax
 80487c7:	83 c4 18             	add    $0x18,%esp
 80487ca:	59                   	pop    %ecx
 80487cb:	5b                   	pop    %ebx
 80487cc:	5e                   	pop    %esi
 80487cd:	5f                   	pop    %edi
 80487ce:	5d                   	pop    %ebp
 80487cf:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80487d2:	c3                   	ret    
 80487d3:	90                   	nop    
 80487d4:	90                   	nop    
 80487d5:	90                   	nop    
 80487d6:	90                   	nop    
 80487d7:	90                   	nop    
 80487d8:	90                   	nop    
 80487d9:	90                   	nop    
 80487da:	90                   	nop    
 80487db:	90                   	nop    
 80487dc:	90                   	nop    
 80487dd:	90                   	nop    
 80487de:	90                   	nop    
 80487df:	90                   	nop    

080487e0 <add_sample>:
 80487e0:	55                   	push   %ebp
 80487e1:	31 c9                	xor    %ecx,%ecx
 80487e3:	89 e5                	mov    %esp,%ebp
 80487e5:	56                   	push   %esi
 80487e6:	8b 35 54 a0 04 08    	mov    0x804a054,%esi
 80487ec:	dd 45 08             	fldl   0x8(%ebp)
 80487ef:	53                   	push   %ebx
 80487f0:	8b 1d 7c a0 04 08    	mov    0x804a07c,%ebx
 80487f6:	39 f3                	cmp    %esi,%ebx
 80487f8:	7d 3b                	jge    8048835 <add_sample+0x55>
 80487fa:	8b 15 78 a0 04 08    	mov    0x804a078,%edx
 8048800:	89 d9                	mov    %ebx,%ecx
 8048802:	dd 1c ca             	fstpl  (%edx,%ecx,8)
 8048805:	8d 43 01             	lea    0x1(%ebx),%eax
 8048808:	85 c9                	test   %ecx,%ecx
 804880a:	a3 7c a0 04 08       	mov    %eax,0x804a07c
 804880f:	7e 20                	jle    8048831 <add_sample+0x51>
 8048811:	dd 44 ca f8          	fldl   -0x8(%edx,%ecx,8)
 8048815:	dd 04 ca             	fldl   (%edx,%ecx,8)
 8048818:	d9 c9                	fxch   %st(1)
 804881a:	dd e1                	fucom  %st(1)
 804881c:	df e0                	fnstsw %ax
 804881e:	f6 c4 45             	test   $0x45,%ah
 8048821:	75 2e                	jne    8048851 <add_sample+0x71>
 8048823:	d9 c9                	fxch   %st(1)
 8048825:	dd 5c ca f8          	fstpl  -0x8(%edx,%ecx,8)
 8048829:	dd 1c ca             	fstpl  (%edx,%ecx,8)
 804882c:	49                   	dec    %ecx
 804882d:	85 c9                	test   %ecx,%ecx
 804882f:	7f e0                	jg     8048811 <add_sample+0x31>
 8048831:	5b                   	pop    %ebx
 8048832:	5e                   	pop    %esi
 8048833:	c9                   	leave  
 8048834:	c3                   	ret    
 8048835:	8b 15 78 a0 04 08    	mov    0x804a078,%edx
 804883b:	dd 44 f2 f8          	fldl   -0x8(%edx,%esi,8)
 804883f:	dd e9                	fucomp %st(1)
 8048841:	df e0                	fnstsw %ax
 8048843:	f6 c4 45             	test   $0x45,%ah
 8048846:	75 05                	jne    804884d <add_sample+0x6d>
 8048848:	8d 4e ff             	lea    -0x1(%esi),%ecx
 804884b:	eb b5                	jmp    8048802 <add_sample+0x22>
 804884d:	df c0                	ffreep %st(0)
 804884f:	eb b4                	jmp    8048805 <add_sample+0x25>
 8048851:	df c0                	ffreep %st(0)
 8048853:	df c0                	ffreep %st(0)
 8048855:	5b                   	pop    %ebx
 8048856:	5e                   	pop    %esi
 8048857:	c9                   	leave  
 8048858:	c3                   	ret    
 8048859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08048860 <has_converged>:
 8048860:	31 c9                	xor    %ecx,%ecx
 8048862:	8b 15 54 a0 04 08    	mov    0x804a054,%edx
 8048868:	39 15 7c a0 04 08    	cmp    %edx,0x804a07c
 804886e:	55                   	push   %ebp
 804886f:	89 e5                	mov    %esp,%ebp
 8048871:	7c 20                	jl     8048893 <has_converged+0x33>
 8048873:	d9 e8                	fld1   
 8048875:	a1 78 a0 04 08       	mov    0x804a078,%eax
 804887a:	dc 05 48 a0 04 08    	faddl  0x804a048
 8048880:	dd 44 d0 f8          	fldl   -0x8(%eax,%edx,8)
 8048884:	d9 c9                	fxch   %st(1)
 8048886:	dc 08                	fmull  (%eax)
 8048888:	da e9                	fucompp 
 804888a:	df e0                	fnstsw %ax
 804888c:	f6 c4 01             	test   $0x1,%ah
 804888f:	75 02                	jne    8048893 <has_converged+0x33>
 8048891:	b1 01                	mov    $0x1,%cl
 8048893:	c9                   	leave  
 8048894:	89 c8                	mov    %ecx,%eax
 8048896:	c3                   	ret    
 8048897:	89 f6                	mov    %esi,%esi
 8048899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080488a0 <clear>:
 80488a0:	55                   	push   %ebp
 80488a1:	89 e5                	mov    %esp,%ebp
 80488a3:	56                   	push   %esi
 80488a4:	53                   	push   %ebx
 80488a5:	83 ec 10             	sub    $0x10,%esp
 80488a8:	8b 35 58 a0 04 08    	mov    0x804a058,%esi
 80488ae:	a1 70 a0 04 08       	mov    0x804a070,%eax
 80488b3:	8b 1d 80 a0 04 08    	mov    0x804a080,%ebx
 80488b9:	c1 ee 02             	shr    $0x2,%esi
 80488bc:	85 c0                	test   %eax,%eax
 80488be:	74 2c                	je     80488ec <clear+0x4c>
 80488c0:	89 c2                	mov    %eax,%edx
 80488c2:	a1 5c a0 04 08       	mov    0x804a05c,%eax
 80488c7:	83 e0 fc             	and    $0xfffffffc,%eax
 80488ca:	01 d0                	add    %edx,%eax
 80488cc:	39 c2                	cmp    %eax,%edx
 80488ce:	73 0f                	jae    80488df <clear+0x3f>
 80488d0:	8d 0c b5 00 00 00 00 	lea    0x0(,%esi,4),%ecx
 80488d7:	03 1a                	add    (%edx),%ebx
 80488d9:	01 ca                	add    %ecx,%edx
 80488db:	39 c2                	cmp    %eax,%edx
 80488dd:	72 f8                	jb     80488d7 <clear+0x37>
 80488df:	89 1d 80 a0 04 08    	mov    %ebx,0x804a080
 80488e5:	83 c4 10             	add    $0x10,%esp
 80488e8:	5b                   	pop    %ebx
 80488e9:	5e                   	pop    %esi
 80488ea:	c9                   	leave  
 80488eb:	c3                   	ret    
 80488ec:	a1 5c a0 04 08       	mov    0x804a05c,%eax
 80488f1:	89 04 24             	mov    %eax,(%esp)
 80488f4:	e8 1f fc ff ff       	call   8048518 <malloc@plt>
 80488f9:	85 c0                	test   %eax,%eax
 80488fb:	a3 70 a0 04 08       	mov    %eax,0x804a070
 8048900:	75 be                	jne    80488c0 <clear+0x20>
 8048902:	a1 60 a0 04 08       	mov    0x804a060,%eax
 8048907:	c7 44 24 08 3e 00 00 	movl   $0x3e,0x8(%esp)
 804890e:	00 
 804890f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8048916:	00 
 8048917:	c7 04 24 00 8f 04 08 	movl   $0x8048f00,(%esp)
 804891e:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048922:	e8 d1 fb ff ff       	call   80484f8 <fwrite@plt>
 8048927:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804892e:	e8 15 fc ff ff       	call   8048548 <exit@plt>
 8048933:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048940 <fcyc>:
 8048940:	55                   	push   %ebp
 8048941:	89 e5                	mov    %esp,%ebp
 8048943:	56                   	push   %esi
 8048944:	53                   	push   %ebx
 8048945:	83 ec 10             	sub    $0x10,%esp
 8048948:	a1 78 a0 04 08       	mov    0x804a078,%eax
 804894d:	8b 75 08             	mov    0x8(%ebp),%esi
 8048950:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048953:	85 c0                	test   %eax,%eax
 8048955:	0f 85 05 01 00 00    	jne    8048a60 <fcyc+0x120>
 804895b:	a1 54 a0 04 08       	mov    0x804a054,%eax
 8048960:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 8048967:	00 
 8048968:	89 04 24             	mov    %eax,(%esp)
 804896b:	e8 48 fb ff ff       	call   80484b8 <calloc@plt>
 8048970:	8b 0d 6c a0 04 08    	mov    0x804a06c,%ecx
 8048976:	a3 78 a0 04 08       	mov    %eax,0x804a078
 804897b:	c7 05 7c a0 04 08 00 	movl   $0x0,0x804a07c
 8048982:	00 00 00 
 8048985:	85 c9                	test   %ecx,%ecx
 8048987:	0f 84 c8 00 00 00    	je     8048a55 <fcyc+0x115>
 804898d:	eb 34                	jmp    80489c3 <fcyc+0x83>
 804898f:	90                   	nop    
 8048990:	e8 fb 02 00 00       	call   8048c90 <start_comp_counter>
 8048995:	89 1c 24             	mov    %ebx,(%esp)
 8048998:	ff d6                	call   *%esi
 804899a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80489a0:	e8 2b 04 00 00       	call   8048dd0 <get_comp_counter>
 80489a5:	dd 1c 24             	fstpl  (%esp)
 80489a8:	e8 33 fe ff ff       	call   80487e0 <add_sample>
 80489ad:	e8 ae fe ff ff       	call   8048860 <has_converged>
 80489b2:	85 c0                	test   %eax,%eax
 80489b4:	75 40                	jne    80489f6 <fcyc+0xb6>
 80489b6:	a1 50 a0 04 08       	mov    0x804a050,%eax
 80489bb:	39 05 7c a0 04 08    	cmp    %eax,0x804a07c
 80489c1:	7d 33                	jge    80489f6 <fcyc+0xb6>
 80489c3:	8b 15 74 a0 04 08    	mov    0x804a074,%edx
 80489c9:	85 d2                	test   %edx,%edx
 80489cb:	74 c3                	je     8048990 <fcyc+0x50>
 80489cd:	e8 ce fe ff ff       	call   80488a0 <clear>
 80489d2:	e8 b9 02 00 00       	call   8048c90 <start_comp_counter>
 80489d7:	89 1c 24             	mov    %ebx,(%esp)
 80489da:	ff d6                	call   *%esi
 80489dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80489e0:	e8 eb 03 00 00       	call   8048dd0 <get_comp_counter>
 80489e5:	dd 1c 24             	fstpl  (%esp)
 80489e8:	e8 f3 fd ff ff       	call   80487e0 <add_sample>
 80489ed:	e8 6e fe ff ff       	call   8048860 <has_converged>
 80489f2:	85 c0                	test   %eax,%eax
 80489f4:	74 c0                	je     80489b6 <fcyc+0x76>
 80489f6:	a1 78 a0 04 08       	mov    0x804a078,%eax
 80489fb:	dd 00                	fldl   (%eax)
 80489fd:	89 04 24             	mov    %eax,(%esp)
 8048a00:	dd 5d f0             	fstpl  -0x10(%ebp)
 8048a03:	e8 d0 fa ff ff       	call   80484d8 <free@plt>
 8048a08:	dd 45 f0             	fldl   -0x10(%ebp)
 8048a0b:	c7 05 78 a0 04 08 00 	movl   $0x0,0x804a078
 8048a12:	00 00 00 
 8048a15:	83 c4 10             	add    $0x10,%esp
 8048a18:	5b                   	pop    %ebx
 8048a19:	5e                   	pop    %esi
 8048a1a:	c9                   	leave  
 8048a1b:	c3                   	ret    
 8048a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048a20:	e8 7b fe ff ff       	call   80488a0 <clear>
 8048a25:	e8 06 01 00 00       	call   8048b30 <start_counter>
 8048a2a:	89 1c 24             	mov    %ebx,(%esp)
 8048a2d:	8d 76 00             	lea    0x0(%esi),%esi
 8048a30:	ff d6                	call   *%esi
 8048a32:	e8 19 01 00 00       	call   8048b50 <get_counter>
 8048a37:	dd 1c 24             	fstpl  (%esp)
 8048a3a:	e8 a1 fd ff ff       	call   80487e0 <add_sample>
 8048a3f:	e8 1c fe ff ff       	call   8048860 <has_converged>
 8048a44:	85 c0                	test   %eax,%eax
 8048a46:	75 ae                	jne    80489f6 <fcyc+0xb6>
 8048a48:	a1 50 a0 04 08       	mov    0x804a050,%eax
 8048a4d:	39 05 7c a0 04 08    	cmp    %eax,0x804a07c
 8048a53:	7d a1                	jge    80489f6 <fcyc+0xb6>
 8048a55:	a1 74 a0 04 08       	mov    0x804a074,%eax
 8048a5a:	85 c0                	test   %eax,%eax
 8048a5c:	74 c7                	je     8048a25 <fcyc+0xe5>
 8048a5e:	eb c0                	jmp    8048a20 <fcyc+0xe0>
 8048a60:	89 04 24             	mov    %eax,(%esp)
 8048a63:	e8 70 fa ff ff       	call   80484d8 <free@plt>
 8048a68:	e9 ee fe ff ff       	jmp    804895b <fcyc+0x1b>
 8048a6d:	8d 76 00             	lea    0x0(%esi),%esi

08048a70 <set_fcyc_clear_cache>:
 8048a70:	55                   	push   %ebp
 8048a71:	89 e5                	mov    %esp,%ebp
 8048a73:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a76:	a3 74 a0 04 08       	mov    %eax,0x804a074
 8048a7b:	c9                   	leave  
 8048a7c:	c3                   	ret    
 8048a7d:	8d 76 00             	lea    0x0(%esi),%esi

08048a80 <set_fcyc_cache_sizee>:
 8048a80:	55                   	push   %ebp
 8048a81:	89 e5                	mov    %esp,%ebp
 8048a83:	83 ec 08             	sub    $0x8,%esp
 8048a86:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a89:	3b 05 5c a0 04 08    	cmp    0x804a05c,%eax
 8048a8f:	74 0e                	je     8048a9f <set_fcyc_cache_sizee+0x1f>
 8048a91:	a3 5c a0 04 08       	mov    %eax,0x804a05c
 8048a96:	a1 70 a0 04 08       	mov    0x804a070,%eax
 8048a9b:	85 c0                	test   %eax,%eax
 8048a9d:	75 02                	jne    8048aa1 <set_fcyc_cache_sizee+0x21>
 8048a9f:	c9                   	leave  
 8048aa0:	c3                   	ret    
 8048aa1:	89 04 24             	mov    %eax,(%esp)
 8048aa4:	e8 2f fa ff ff       	call   80484d8 <free@plt>
 8048aa9:	c7 05 70 a0 04 08 00 	movl   $0x0,0x804a070
 8048ab0:	00 00 00 
 8048ab3:	c9                   	leave  
 8048ab4:	c3                   	ret    
 8048ab5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048ac0 <set_fcyc_cache_block>:
 8048ac0:	55                   	push   %ebp
 8048ac1:	89 e5                	mov    %esp,%ebp
 8048ac3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ac6:	a3 58 a0 04 08       	mov    %eax,0x804a058
 8048acb:	c9                   	leave  
 8048acc:	c3                   	ret    
 8048acd:	8d 76 00             	lea    0x0(%esi),%esi

08048ad0 <set_fcyc_compensate>:
 8048ad0:	55                   	push   %ebp
 8048ad1:	89 e5                	mov    %esp,%ebp
 8048ad3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ad6:	a3 6c a0 04 08       	mov    %eax,0x804a06c
 8048adb:	c9                   	leave  
 8048adc:	c3                   	ret    
 8048add:	8d 76 00             	lea    0x0(%esi),%esi

08048ae0 <set_fcyc_k>:
 8048ae0:	55                   	push   %ebp
 8048ae1:	89 e5                	mov    %esp,%ebp
 8048ae3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ae6:	a3 54 a0 04 08       	mov    %eax,0x804a054
 8048aeb:	c9                   	leave  
 8048aec:	c3                   	ret    
 8048aed:	8d 76 00             	lea    0x0(%esi),%esi

08048af0 <set_fcyc_maxsamples>:
 8048af0:	55                   	push   %ebp
 8048af1:	89 e5                	mov    %esp,%ebp
 8048af3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048af6:	a3 50 a0 04 08       	mov    %eax,0x804a050
 8048afb:	c9                   	leave  
 8048afc:	c3                   	ret    
 8048afd:	8d 76 00             	lea    0x0(%esi),%esi

08048b00 <set_fcyc_epsilon>:
 8048b00:	55                   	push   %ebp
 8048b01:	89 e5                	mov    %esp,%ebp
 8048b03:	dd 45 08             	fldl   0x8(%ebp)
 8048b06:	dd 1d 48 a0 04 08    	fstpl  0x804a048
 8048b0c:	c9                   	leave  
 8048b0d:	c3                   	ret    
 8048b0e:	90                   	nop    
 8048b0f:	90                   	nop    

08048b10 <access_counter>:
 8048b10:	55                   	push   %ebp
 8048b11:	89 e5                	mov    %esp,%ebp
 8048b13:	53                   	push   %ebx
 8048b14:	0f 31                	rdtsc  
 8048b16:	89 d1                	mov    %edx,%ecx
 8048b18:	89 c3                	mov    %eax,%ebx
 8048b1a:	8b 45 08             	mov    0x8(%ebp),%eax
 8048b1d:	89 08                	mov    %ecx,(%eax)
 8048b1f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048b22:	89 18                	mov    %ebx,(%eax)
 8048b24:	5b                   	pop    %ebx
 8048b25:	c9                   	leave  
 8048b26:	c3                   	ret    
 8048b27:	89 f6                	mov    %esi,%esi
 8048b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048b30 <start_counter>:
 8048b30:	55                   	push   %ebp
 8048b31:	89 e5                	mov    %esp,%ebp
 8048b33:	83 ec 08             	sub    $0x8,%esp
 8048b36:	c7 44 24 04 98 a0 04 	movl   $0x804a098,0x4(%esp)
 8048b3d:	08 
 8048b3e:	c7 04 24 94 a0 04 08 	movl   $0x804a094,(%esp)
 8048b45:	e8 c6 ff ff ff       	call   8048b10 <access_counter>
 8048b4a:	c9                   	leave  
 8048b4b:	c3                   	ret    
 8048b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048b50 <get_counter>:
 8048b50:	55                   	push   %ebp
 8048b51:	89 e5                	mov    %esp,%ebp
 8048b53:	83 ec 38             	sub    $0x38,%esp
 8048b56:	8d 45 f4             	lea    -0xc(%ebp),%eax
 8048b59:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048b5d:	8d 45 f0             	lea    -0x10(%ebp),%eax
 8048b60:	89 04 24             	mov    %eax,(%esp)
 8048b63:	e8 a8 ff ff ff       	call   8048b10 <access_counter>
 8048b68:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048b6b:	31 d2                	xor    %edx,%edx
 8048b6d:	89 c1                	mov    %eax,%ecx
 8048b6f:	2b 0d 98 a0 04 08    	sub    0x804a098,%ecx
 8048b75:	39 c1                	cmp    %eax,%ecx
 8048b77:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048b7a:	0f 97 c2             	seta   %dl
 8048b7d:	2b 05 94 a0 04 08    	sub    0x804a094,%eax
 8048b83:	29 d0                	sub    %edx,%eax
 8048b85:	31 d2                	xor    %edx,%edx
 8048b87:	52                   	push   %edx
 8048b88:	31 d2                	xor    %edx,%edx
 8048b8a:	50                   	push   %eax
 8048b8b:	df 2c 24             	fildll (%esp)
 8048b8e:	83 c4 08             	add    $0x8,%esp
 8048b91:	52                   	push   %edx
 8048b92:	d8 0d 9c 8f 04 08    	fmuls  0x8048f9c
 8048b98:	51                   	push   %ecx
 8048b99:	df 2c 24             	fildll (%esp)
 8048b9c:	d9 c9                	fxch   %st(1)
 8048b9e:	83 c4 08             	add    $0x8,%esp
 8048ba1:	d8 0d a0 8f 04 08    	fmuls  0x8048fa0
 8048ba7:	de c1                	faddp  %st,%st(1)
 8048ba9:	d9 ee                	fldz   
 8048bab:	dd e9                	fucomp %st(1)
 8048bad:	df e0                	fnstsw %ax
 8048baf:	f6 c4 45             	test   $0x45,%ah
 8048bb2:	74 02                	je     8048bb6 <get_counter+0x66>
 8048bb4:	c9                   	leave  
 8048bb5:	c3                   	ret    
 8048bb6:	dd 54 24 08          	fstl   0x8(%esp)
 8048bba:	c7 44 24 04 40 8f 04 	movl   $0x8048f40,0x4(%esp)
 8048bc1:	08 
 8048bc2:	a1 60 a0 04 08       	mov    0x804a060,%eax
 8048bc7:	89 04 24             	mov    %eax,(%esp)
 8048bca:	dd 5d d8             	fstpl  -0x28(%ebp)
 8048bcd:	e8 36 f9 ff ff       	call   8048508 <fprintf@plt>
 8048bd2:	dd 45 d8             	fldl   -0x28(%ebp)
 8048bd5:	c9                   	leave  
 8048bd6:	c3                   	ret    
 8048bd7:	89 f6                	mov    %esi,%esi
 8048bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048be0 <ovhd>:
 8048be0:	55                   	push   %ebp
 8048be1:	89 e5                	mov    %esp,%ebp
 8048be3:	53                   	push   %ebx
 8048be4:	bb 01 00 00 00       	mov    $0x1,%ebx
 8048be9:	83 ec 04             	sub    $0x4,%esp
 8048bec:	eb 04                	jmp    8048bf2 <ovhd+0x12>
 8048bee:	89 f6                	mov    %esi,%esi
 8048bf0:	df c0                	ffreep %st(0)
 8048bf2:	e8 39 ff ff ff       	call   8048b30 <start_counter>
 8048bf7:	e8 54 ff ff ff       	call   8048b50 <get_counter>
 8048bfc:	4b                   	dec    %ebx
 8048bfd:	79 f1                	jns    8048bf0 <ovhd+0x10>
 8048bff:	83 c4 04             	add    $0x4,%esp
 8048c02:	5b                   	pop    %ebx
 8048c03:	c9                   	leave  
 8048c04:	c3                   	ret    
 8048c05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048c10 <mhz_full>:
 8048c10:	55                   	push   %ebp
 8048c11:	89 e5                	mov    %esp,%ebp
 8048c13:	53                   	push   %ebx
 8048c14:	83 ec 24             	sub    $0x24,%esp
 8048c17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048c1a:	e8 11 ff ff ff       	call   8048b30 <start_counter>
 8048c1f:	89 1c 24             	mov    %ebx,(%esp)
 8048c22:	e8 01 f9 ff ff       	call   8048528 <sleep@plt>
 8048c27:	e8 24 ff ff ff       	call   8048b50 <get_counter>
 8048c2c:	53                   	push   %ebx
 8048c2d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c30:	db 04 24             	fildl  (%esp)
 8048c33:	83 c4 04             	add    $0x4,%esp
 8048c36:	85 c0                	test   %eax,%eax
 8048c38:	d8 0d a4 8f 04 08    	fmuls  0x8048fa4
 8048c3e:	de f9                	fdivrp %st,%st(1)
 8048c40:	75 06                	jne    8048c48 <mhz_full+0x38>
 8048c42:	83 c4 24             	add    $0x24,%esp
 8048c45:	5b                   	pop    %ebx
 8048c46:	c9                   	leave  
 8048c47:	c3                   	ret    
 8048c48:	dd 54 24 04          	fstl   0x4(%esp)
 8048c4c:	c7 04 24 78 8f 04 08 	movl   $0x8048f78,(%esp)
 8048c53:	dd 5d e8             	fstpl  -0x18(%ebp)
 8048c56:	e8 8d f8 ff ff       	call   80484e8 <printf@plt>
 8048c5b:	dd 45 e8             	fldl   -0x18(%ebp)
 8048c5e:	83 c4 24             	add    $0x24,%esp
 8048c61:	5b                   	pop    %ebx
 8048c62:	c9                   	leave  
 8048c63:	c3                   	ret    
 8048c64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048c6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

08048c70 <mhz>:
 8048c70:	55                   	push   %ebp
 8048c71:	89 e5                	mov    %esp,%ebp
 8048c73:	83 ec 08             	sub    $0x8,%esp
 8048c76:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c79:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 8048c80:	00 
 8048c81:	89 04 24             	mov    %eax,(%esp)
 8048c84:	e8 87 ff ff ff       	call   8048c10 <mhz_full>
 8048c89:	c9                   	leave  
 8048c8a:	c3                   	ret    
 8048c8b:	90                   	nop    
 8048c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048c90 <start_comp_counter>:
 8048c90:	55                   	push   %ebp
 8048c91:	d9 ee                	fldz   
 8048c93:	89 e5                	mov    %esp,%ebp
 8048c95:	57                   	push   %edi
 8048c96:	56                   	push   %esi
 8048c97:	53                   	push   %ebx
 8048c98:	83 ec 5c             	sub    $0x5c,%esp
 8048c9b:	dd 05 88 a0 04 08    	fldl   0x804a088
 8048ca1:	da e9                	fucompp 
 8048ca3:	df e0                	fnstsw %ax
 8048ca5:	80 e4 45             	and    $0x45,%ah
 8048ca8:	80 f4 40             	xor    $0x40,%ah
 8048cab:	74 23                	je     8048cd0 <start_comp_counter+0x40>
 8048cad:	8d 45 d8             	lea    -0x28(%ebp),%eax
 8048cb0:	89 04 24             	mov    %eax,(%esp)
 8048cb3:	e8 80 f8 ff ff       	call   8048538 <times@plt>
 8048cb8:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048cbb:	a3 90 a0 04 08       	mov    %eax,0x804a090
 8048cc0:	e8 6b fe ff ff       	call   8048b30 <start_counter>
 8048cc5:	83 c4 5c             	add    $0x5c,%esp
 8048cc8:	5b                   	pop    %ebx
 8048cc9:	5e                   	pop    %esi
 8048cca:	5f                   	pop    %edi
 8048ccb:	c9                   	leave  
 8048ccc:	c3                   	ret    
 8048ccd:	8d 76 00             	lea    0x0(%esi),%esi
 8048cd0:	8d 7d c8             	lea    -0x38(%ebp),%edi
 8048cd3:	be 63 00 00 00       	mov    $0x63,%esi
 8048cd8:	89 3c 24             	mov    %edi,(%esp)
 8048cdb:	e8 58 f8 ff ff       	call   8048538 <times@plt>
 8048ce0:	8b 5d c8             	mov    -0x38(%ebp),%ebx
 8048ce3:	e8 48 fe ff ff       	call   8048b30 <start_counter>
 8048ce8:	e8 63 fe ff ff       	call   8048b50 <get_counter>
 8048ced:	dd 5d c0             	fstpl  -0x40(%ebp)
 8048cf0:	eb 04                	jmp    8048cf6 <start_comp_counter+0x66>
 8048cf2:	85 f6                	test   %esi,%esi
 8048cf4:	78 7a                	js     8048d70 <start_comp_counter+0xe0>
 8048cf6:	e8 55 fe ff ff       	call   8048b50 <get_counter>
 8048cfb:	dd 55 b8             	fstl   -0x48(%ebp)
 8048cfe:	dc 65 c0             	fsubl  -0x40(%ebp)
 8048d01:	dd 5d b0             	fstpl  -0x50(%ebp)
 8048d04:	d9 05 a8 8f 04 08    	flds   0x8048fa8
 8048d0a:	dd 45 b0             	fldl   -0x50(%ebp)
 8048d0d:	da e9                	fucompp 
 8048d0f:	df e0                	fnstsw %ax
 8048d11:	f6 c4 01             	test   $0x1,%ah
 8048d14:	75 dc                	jne    8048cf2 <start_comp_counter+0x62>
 8048d16:	89 3c 24             	mov    %edi,(%esp)
 8048d19:	e8 1a f8 ff ff       	call   8048538 <times@plt>
 8048d1e:	8b 55 c8             	mov    -0x38(%ebp),%edx
 8048d21:	39 da                	cmp    %ebx,%edx
 8048d23:	7e 3b                	jle    8048d60 <start_comp_counter+0xd0>
 8048d25:	89 d0                	mov    %edx,%eax
 8048d27:	29 d8                	sub    %ebx,%eax
 8048d29:	50                   	push   %eax
 8048d2a:	db 04 24             	fildl  (%esp)
 8048d2d:	83 c4 04             	add    $0x4,%esp
 8048d30:	dd 45 b0             	fldl   -0x50(%ebp)
 8048d33:	dd 05 88 a0 04 08    	fldl   0x804a088
 8048d39:	d9 c9                	fxch   %st(1)
 8048d3b:	de f2                	fdivp  %st,%st(2)
 8048d3d:	d9 ee                	fldz   
 8048d3f:	d9 c9                	fxch   %st(1)
 8048d41:	dd e1                	fucom  %st(1)
 8048d43:	df e0                	fnstsw %ax
 8048d45:	dd d9                	fstp   %st(1)
 8048d47:	80 e4 45             	and    $0x45,%ah
 8048d4a:	80 fc 40             	cmp    $0x40,%ah
 8048d4d:	74 57                	je     8048da6 <start_comp_counter+0x116>
 8048d4f:	dd e9                	fucomp %st(1)
 8048d51:	df e0                	fnstsw %ax
 8048d53:	f6 c4 45             	test   $0x45,%ah
 8048d56:	74 50                	je     8048da8 <start_comp_counter+0x118>
 8048d58:	df c0                	ffreep %st(0)
 8048d5a:	4e                   	dec    %esi
 8048d5b:	89 d3                	mov    %edx,%ebx
 8048d5d:	8d 76 00             	lea    0x0(%esi),%esi
 8048d60:	dd 45 b8             	fldl   -0x48(%ebp)
 8048d63:	85 f6                	test   %esi,%esi
 8048d65:	dd 5d c0             	fstpl  -0x40(%ebp)
 8048d68:	79 8c                	jns    8048cf6 <start_comp_counter+0x66>
 8048d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048d70:	dd 05 88 a0 04 08    	fldl   0x804a088
 8048d76:	c7 04 24 b0 8f 04 08 	movl   $0x8048fb0,(%esp)
 8048d7d:	dd 5c 24 04          	fstpl  0x4(%esp)
 8048d81:	e8 62 f7 ff ff       	call   80484e8 <printf@plt>
 8048d86:	8d 45 d8             	lea    -0x28(%ebp),%eax
 8048d89:	89 04 24             	mov    %eax,(%esp)
 8048d8c:	e8 a7 f7 ff ff       	call   8048538 <times@plt>
 8048d91:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048d94:	a3 90 a0 04 08       	mov    %eax,0x804a090
 8048d99:	e8 92 fd ff ff       	call   8048b30 <start_counter>
 8048d9e:	83 c4 5c             	add    $0x5c,%esp
 8048da1:	5b                   	pop    %ebx
 8048da2:	5e                   	pop    %esi
 8048da3:	5f                   	pop    %edi
 8048da4:	c9                   	leave  
 8048da5:	c3                   	ret    
 8048da6:	df c0                	ffreep %st(0)
 8048da8:	d9 05 ac 8f 04 08    	flds   0x8048fac
 8048dae:	d9 c9                	fxch   %st(1)
 8048db0:	dd e1                	fucom  %st(1)
 8048db2:	df e0                	fnstsw %ax
 8048db4:	dd d9                	fstp   %st(1)
 8048db6:	f6 c4 45             	test   $0x45,%ah
 8048db9:	75 9d                	jne    8048d58 <start_comp_counter+0xc8>
 8048dbb:	dd 1d 88 a0 04 08    	fstpl  0x804a088
 8048dc1:	4e                   	dec    %esi
 8048dc2:	89 d3                	mov    %edx,%ebx
 8048dc4:	eb 9a                	jmp    8048d60 <start_comp_counter+0xd0>
 8048dc6:	8d 76 00             	lea    0x0(%esi),%esi
 8048dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048dd0 <get_comp_counter>:
 8048dd0:	55                   	push   %ebp
 8048dd1:	89 e5                	mov    %esp,%ebp
 8048dd3:	83 ec 38             	sub    $0x38,%esp
 8048dd6:	e8 75 fd ff ff       	call   8048b50 <get_counter>
 8048ddb:	8d 45 e8             	lea    -0x18(%ebp),%eax
 8048dde:	dd 5d e0             	fstpl  -0x20(%ebp)
 8048de1:	89 04 24             	mov    %eax,(%esp)
 8048de4:	e8 4f f7 ff ff       	call   8048538 <times@plt>
 8048de9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048dec:	2b 05 90 a0 04 08    	sub    0x804a090,%eax
 8048df2:	50                   	push   %eax
 8048df3:	db 04 24             	fildl  (%esp)
 8048df6:	83 c4 04             	add    $0x4,%esp
 8048df9:	dc 0d 88 a0 04 08    	fmull  0x804a088
 8048dff:	dc 6d e0             	fsubrl -0x20(%ebp)
 8048e02:	dd 55 e0             	fstl   -0x20(%ebp)
 8048e05:	c9                   	leave  
 8048e06:	c3                   	ret    
 8048e07:	90                   	nop    
 8048e08:	90                   	nop    
 8048e09:	90                   	nop    
 8048e0a:	90                   	nop    
 8048e0b:	90                   	nop    
 8048e0c:	90                   	nop    
 8048e0d:	90                   	nop    
 8048e0e:	90                   	nop    
 8048e0f:	90                   	nop    

08048e10 <__libc_csu_fini>:
 8048e10:	55                   	push   %ebp
 8048e11:	89 e5                	mov    %esp,%ebp
 8048e13:	5d                   	pop    %ebp
 8048e14:	c3                   	ret    
 8048e15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048e20 <__libc_csu_init>:
 8048e20:	55                   	push   %ebp
 8048e21:	89 e5                	mov    %esp,%ebp
 8048e23:	57                   	push   %edi
 8048e24:	56                   	push   %esi
 8048e25:	53                   	push   %ebx
 8048e26:	e8 4f 00 00 00       	call   8048e7a <__i686.get_pc_thunk.bx>
 8048e2b:	81 c3 c9 11 00 00    	add    $0x11c9,%ebx
 8048e31:	83 ec 0c             	sub    $0xc,%esp
 8048e34:	e8 0f f6 ff ff       	call   8048448 <_init>
 8048e39:	8d bb 18 ff ff ff    	lea    -0xe8(%ebx),%edi
 8048e3f:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
 8048e45:	29 c7                	sub    %eax,%edi
 8048e47:	c1 ff 02             	sar    $0x2,%edi
 8048e4a:	85 ff                	test   %edi,%edi
 8048e4c:	74 24                	je     8048e72 <__libc_csu_init+0x52>
 8048e4e:	31 f6                	xor    %esi,%esi
 8048e50:	8b 45 10             	mov    0x10(%ebp),%eax
 8048e53:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048e57:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048e5a:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048e5e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048e61:	89 04 24             	mov    %eax,(%esp)
 8048e64:	ff 94 b3 18 ff ff ff 	call   *-0xe8(%ebx,%esi,4)
 8048e6b:	83 c6 01             	add    $0x1,%esi
 8048e6e:	39 fe                	cmp    %edi,%esi
 8048e70:	72 de                	jb     8048e50 <__libc_csu_init+0x30>
 8048e72:	83 c4 0c             	add    $0xc,%esp
 8048e75:	5b                   	pop    %ebx
 8048e76:	5e                   	pop    %esi
 8048e77:	5f                   	pop    %edi
 8048e78:	5d                   	pop    %ebp
 8048e79:	c3                   	ret    

08048e7a <__i686.get_pc_thunk.bx>:
 8048e7a:	8b 1c 24             	mov    (%esp),%ebx
 8048e7d:	c3                   	ret    
 8048e7e:	90                   	nop    
 8048e7f:	90                   	nop    

08048e80 <__do_global_ctors_aux>:
 8048e80:	55                   	push   %ebp
 8048e81:	89 e5                	mov    %esp,%ebp
 8048e83:	53                   	push   %ebx
 8048e84:	83 ec 04             	sub    $0x4,%esp
 8048e87:	a1 0c 9f 04 08       	mov    0x8049f0c,%eax
 8048e8c:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048e8f:	74 13                	je     8048ea4 <__do_global_ctors_aux+0x24>
 8048e91:	bb 0c 9f 04 08       	mov    $0x8049f0c,%ebx
 8048e96:	66 90                	xchg   %ax,%ax
 8048e98:	83 eb 04             	sub    $0x4,%ebx
 8048e9b:	ff d0                	call   *%eax
 8048e9d:	8b 03                	mov    (%ebx),%eax
 8048e9f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048ea2:	75 f4                	jne    8048e98 <__do_global_ctors_aux+0x18>
 8048ea4:	83 c4 04             	add    $0x4,%esp
 8048ea7:	5b                   	pop    %ebx
 8048ea8:	5d                   	pop    %ebp
 8048ea9:	c3                   	ret    
 8048eaa:	90                   	nop    
 8048eab:	90                   	nop    

Disassembly of section .fini:

08048eac <_fini>:
 8048eac:	55                   	push   %ebp
 8048ead:	89 e5                	mov    %esp,%ebp
 8048eaf:	53                   	push   %ebx
 8048eb0:	83 ec 04             	sub    $0x4,%esp
 8048eb3:	e8 00 00 00 00       	call   8048eb8 <_fini+0xc>
 8048eb8:	5b                   	pop    %ebx
 8048eb9:	81 c3 3c 11 00 00    	add    $0x113c,%ebx
 8048ebf:	e8 cc f6 ff ff       	call   8048590 <__do_global_dtors_aux>
 8048ec4:	59                   	pop    %ecx
 8048ec5:	5b                   	pop    %ebx
 8048ec6:	c9                   	leave  
 8048ec7:	c3                   	ret    
