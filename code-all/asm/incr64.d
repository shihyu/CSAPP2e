
incr64:     file format elf64-x86-64


Disassembly of section .init:

0000000000400688 <_init>:
  400688:	48 83 ec 08          	sub    $0x8,%rsp
  40068c:	e8 0b 01 00 00       	callq  40079c <call_gmon_start>
  400691:	e8 9a 01 00 00       	callq  400830 <frame_dummy>
  400696:	e8 e5 09 00 00       	callq  401080 <__do_global_ctors_aux>
  40069b:	48 83 c4 08          	add    $0x8,%rsp
  40069f:	c3                   	retq   

Disassembly of section .plt:

00000000004006a0 <printf@plt-0x10>:
  4006a0:	ff 35 4a 19 20 00    	pushq  0x20194a(%rip)        # 601ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  4006a6:	ff 25 4c 19 20 00    	jmpq   *0x20194c(%rip)        # 601ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  4006ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004006b0 <printf@plt>:
  4006b0:	ff 25 4a 19 20 00    	jmpq   *0x20194a(%rip)        # 602000 <_GLOBAL_OFFSET_TABLE_+0x18>
  4006b6:	68 00 00 00 00       	pushq  $0x0
  4006bb:	e9 e0 ff ff ff       	jmpq   4006a0 <_init+0x18>

00000000004006c0 <exit@plt>:
  4006c0:	ff 25 42 19 20 00    	jmpq   *0x201942(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x20>
  4006c6:	68 01 00 00 00       	pushq  $0x1
  4006cb:	e9 d0 ff ff ff       	jmpq   4006a0 <_init+0x18>

00000000004006d0 <__printf_chk@plt>:
  4006d0:	ff 25 3a 19 20 00    	jmpq   *0x20193a(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x28>
  4006d6:	68 02 00 00 00       	pushq  $0x2
  4006db:	e9 c0 ff ff ff       	jmpq   4006a0 <_init+0x18>

00000000004006e0 <malloc@plt>:
  4006e0:	ff 25 32 19 20 00    	jmpq   *0x201932(%rip)        # 602018 <_GLOBAL_OFFSET_TABLE_+0x30>
  4006e6:	68 03 00 00 00       	pushq  $0x3
  4006eb:	e9 b0 ff ff ff       	jmpq   4006a0 <_init+0x18>

00000000004006f0 <__libc_start_main@plt>:
  4006f0:	ff 25 2a 19 20 00    	jmpq   *0x20192a(%rip)        # 602020 <_GLOBAL_OFFSET_TABLE_+0x38>
  4006f6:	68 04 00 00 00       	pushq  $0x4
  4006fb:	e9 a0 ff ff ff       	jmpq   4006a0 <_init+0x18>

0000000000400700 <times@plt>:
  400700:	ff 25 22 19 20 00    	jmpq   *0x201922(%rip)        # 602028 <_GLOBAL_OFFSET_TABLE_+0x40>
  400706:	68 05 00 00 00       	pushq  $0x5
  40070b:	e9 90 ff ff ff       	jmpq   4006a0 <_init+0x18>

0000000000400710 <free@plt>:
  400710:	ff 25 1a 19 20 00    	jmpq   *0x20191a(%rip)        # 602030 <_GLOBAL_OFFSET_TABLE_+0x48>
  400716:	68 06 00 00 00       	pushq  $0x6
  40071b:	e9 80 ff ff ff       	jmpq   4006a0 <_init+0x18>

0000000000400720 <sleep@plt>:
  400720:	ff 25 12 19 20 00    	jmpq   *0x201912(%rip)        # 602038 <_GLOBAL_OFFSET_TABLE_+0x50>
  400726:	68 07 00 00 00       	pushq  $0x7
  40072b:	e9 70 ff ff ff       	jmpq   4006a0 <_init+0x18>

0000000000400730 <calloc@plt>:
  400730:	ff 25 0a 19 20 00    	jmpq   *0x20190a(%rip)        # 602040 <_GLOBAL_OFFSET_TABLE_+0x58>
  400736:	68 08 00 00 00       	pushq  $0x8
  40073b:	e9 60 ff ff ff       	jmpq   4006a0 <_init+0x18>

0000000000400740 <random@plt>:
  400740:	ff 25 02 19 20 00    	jmpq   *0x201902(%rip)        # 602048 <_GLOBAL_OFFSET_TABLE_+0x60>
  400746:	68 09 00 00 00       	pushq  $0x9
  40074b:	e9 50 ff ff ff       	jmpq   4006a0 <_init+0x18>

0000000000400750 <fwrite@plt>:
  400750:	ff 25 fa 18 20 00    	jmpq   *0x2018fa(%rip)        # 602050 <_GLOBAL_OFFSET_TABLE_+0x68>
  400756:	68 0a 00 00 00       	pushq  $0xa
  40075b:	e9 40 ff ff ff       	jmpq   4006a0 <_init+0x18>

0000000000400760 <fprintf@plt>:
  400760:	ff 25 f2 18 20 00    	jmpq   *0x2018f2(%rip)        # 602058 <_GLOBAL_OFFSET_TABLE_+0x70>
  400766:	68 0b 00 00 00       	pushq  $0xb
  40076b:	e9 30 ff ff ff       	jmpq   4006a0 <_init+0x18>

Disassembly of section .text:

0000000000400770 <_start>:
  400770:	31 ed                	xor    %ebp,%ebp
  400772:	49 89 d1             	mov    %rdx,%r9
  400775:	5e                   	pop    %rsi
  400776:	48 89 e2             	mov    %rsp,%rdx
  400779:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40077d:	50                   	push   %rax
  40077e:	54                   	push   %rsp
  40077f:	49 c7 c0 e0 0f 40 00 	mov    $0x400fe0,%r8
  400786:	48 c7 c1 f0 0f 40 00 	mov    $0x400ff0,%rcx
  40078d:	48 c7 c7 25 09 40 00 	mov    $0x400925,%rdi
  400794:	e8 57 ff ff ff       	callq  4006f0 <__libc_start_main@plt>
  400799:	f4                   	hlt    
  40079a:	90                   	nop    
  40079b:	90                   	nop    

000000000040079c <call_gmon_start>:
  40079c:	48 83 ec 08          	sub    $0x8,%rsp
  4007a0:	48 8b 05 39 18 20 00 	mov    0x201839(%rip),%rax        # 601fe0 <_DYNAMIC+0x1a0>
  4007a7:	48 85 c0             	test   %rax,%rax
  4007aa:	74 02                	je     4007ae <call_gmon_start+0x12>
  4007ac:	ff d0                	callq  *%rax
  4007ae:	48 83 c4 08          	add    $0x8,%rsp
  4007b2:	c3                   	retq   
  4007b3:	90                   	nop    
  4007b4:	90                   	nop    
  4007b5:	90                   	nop    
  4007b6:	90                   	nop    
  4007b7:	90                   	nop    
  4007b8:	90                   	nop    
  4007b9:	90                   	nop    
  4007ba:	90                   	nop    
  4007bb:	90                   	nop    
  4007bc:	90                   	nop    
  4007bd:	90                   	nop    
  4007be:	90                   	nop    
  4007bf:	90                   	nop    

00000000004007c0 <__do_global_dtors_aux>:
  4007c0:	55                   	push   %rbp
  4007c1:	48 89 e5             	mov    %rsp,%rbp
  4007c4:	53                   	push   %rbx
  4007c5:	48 83 ec 08          	sub    $0x8,%rsp
  4007c9:	80 3d d8 18 20 00 00 	cmpb   $0x0,0x2018d8(%rip)        # 6020a8 <completed.6987>
  4007d0:	75 4b                	jne    40081d <__do_global_dtors_aux+0x5d>
  4007d2:	b8 30 1e 60 00       	mov    $0x601e30,%eax
  4007d7:	48 8b 15 d2 18 20 00 	mov    0x2018d2(%rip),%rdx        # 6020b0 <dtor_idx.6989>
  4007de:	48 2d 28 1e 60 00    	sub    $0x601e28,%rax
  4007e4:	48 c1 f8 03          	sar    $0x3,%rax
  4007e8:	48 8d 58 ff          	lea    -0x1(%rax),%rbx
  4007ec:	48 39 da             	cmp    %rbx,%rdx
  4007ef:	73 25                	jae    400816 <__do_global_dtors_aux+0x56>
  4007f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4007f8:	48 8d 42 01          	lea    0x1(%rdx),%rax
  4007fc:	48 89 05 ad 18 20 00 	mov    %rax,0x2018ad(%rip)        # 6020b0 <dtor_idx.6989>
  400803:	ff 14 c5 28 1e 60 00 	callq  *0x601e28(,%rax,8)
  40080a:	48 8b 15 9f 18 20 00 	mov    0x20189f(%rip),%rdx        # 6020b0 <dtor_idx.6989>
  400811:	48 39 da             	cmp    %rbx,%rdx
  400814:	72 e2                	jb     4007f8 <__do_global_dtors_aux+0x38>
  400816:	c6 05 8b 18 20 00 01 	movb   $0x1,0x20188b(%rip)        # 6020a8 <completed.6987>
  40081d:	48 83 c4 08          	add    $0x8,%rsp
  400821:	5b                   	pop    %rbx
  400822:	c9                   	leaveq 
  400823:	c3                   	retq   
  400824:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  40082b:	00 00 00 00 00 

0000000000400830 <frame_dummy>:
  400830:	55                   	push   %rbp
  400831:	48 83 3d ff 15 20 00 	cmpq   $0x0,0x2015ff(%rip)        # 601e38 <__JCR_END__>
  400838:	00 
  400839:	48 89 e5             	mov    %rsp,%rbp
  40083c:	74 1a                	je     400858 <frame_dummy+0x28>
  40083e:	b8 00 00 00 00       	mov    $0x0,%eax
  400843:	48 85 c0             	test   %rax,%rax
  400846:	74 10                	je     400858 <frame_dummy+0x28>
  400848:	bf 38 1e 60 00       	mov    $0x601e38,%edi
  40084d:	49 89 c3             	mov    %rax,%r11
  400850:	c9                   	leaveq 
  400851:	41 ff e3             	jmpq   *%r11
  400854:	0f 1f 40 00          	nopl   0x0(%rax)
  400858:	c9                   	leaveq 
  400859:	c3                   	retq   
  40085a:	90                   	nop    
  40085b:	90                   	nop    

000000000040085c <simple>:
  40085c:	89 f0                	mov    %esi,%eax
  40085e:	03 07                	add    (%rdi),%eax
  400860:	89 07                	mov    %eax,(%rdi)
  400862:	c3                   	retq   

0000000000400863 <simple_l>:
  400863:	48 89 f0             	mov    %rsi,%rax
  400866:	48 03 07             	add    (%rdi),%rax
  400869:	48 89 07             	mov    %rax,(%rdi)
  40086c:	c3                   	retq   

000000000040086d <call_simple>:
  40086d:	48 83 ec 10          	sub    $0x10,%rsp
  400871:	c7 44 24 0c 25 00 00 	movl   $0x25,0xc(%rsp)
  400878:	00 
  400879:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  40087e:	be 0c 00 00 00       	mov    $0xc,%esi
  400883:	e8 d4 ff ff ff       	callq  40085c <simple>
  400888:	03 44 24 0c          	add    0xc(%rsp),%eax
  40088c:	48 83 c4 10          	add    $0x10,%rsp
  400890:	c3                   	retq   

0000000000400891 <call_simple_l>:
  400891:	be 0c 00 00 00       	mov    $0xc,%esi
  400896:	bf 70 20 60 00       	mov    $0x602070,%edi
  40089b:	e8 c3 ff ff ff       	callq  400863 <simple_l>
  4008a0:	48 03 05 d1 17 20 00 	add    0x2017d1(%rip),%rax        # 602078 <gval2>
  4008a7:	c3                   	retq   

00000000004008a8 <post_incr>:
  4008a8:	8b 07                	mov    (%rdi),%eax
  4008aa:	01 c6                	add    %eax,%esi
  4008ac:	89 37                	mov    %esi,(%rdi)
  4008ae:	c3                   	retq   

00000000004008af <post_incr_l>:
  4008af:	48 8b 07             	mov    (%rdi),%rax
  4008b2:	48 01 c6             	add    %rax,%rsi
  4008b5:	48 89 37             	mov    %rsi,(%rdi)
  4008b8:	c3                   	retq   

00000000004008b9 <test_simple>:
  4008b9:	53                   	push   %rbx
  4008ba:	bb 00 21 60 00       	mov    $0x602100,%ebx
  4008bf:	be 00 00 00 00       	mov    $0x0,%esi
  4008c4:	48 89 df             	mov    %rbx,%rdi
  4008c7:	e8 90 ff ff ff       	callq  40085c <simple>
  4008cc:	89 c6                	mov    %eax,%esi
  4008ce:	48 83 c3 04          	add    $0x4,%rbx
  4008d2:	48 81 fb 00 29 60 00 	cmp    $0x602900,%rbx
  4008d9:	75 e9                	jne    4008c4 <test_simple+0xb>
  4008db:	89 05 1f 20 20 00    	mov    %eax,0x20201f(%rip)        # 602900 <store>
  4008e1:	5b                   	pop    %rbx
  4008e2:	c3                   	retq   

00000000004008e3 <test_simple_l>:
  4008e3:	53                   	push   %rbx
  4008e4:	bb 20 29 60 00       	mov    $0x602920,%ebx
  4008e9:	be 00 00 00 00       	mov    $0x0,%esi
  4008ee:	48 89 df             	mov    %rbx,%rdi
  4008f1:	e8 6d ff ff ff       	callq  400863 <simple_l>
  4008f6:	48 89 c6             	mov    %rax,%rsi
  4008f9:	48 83 c3 08          	add    $0x8,%rbx
  4008fd:	48 81 fb 20 39 60 00 	cmp    $0x603920,%rbx
  400904:	75 e8                	jne    4008ee <test_simple_l+0xb>
  400906:	48 89 05 13 30 20 00 	mov    %rax,0x203013(%rip)        # 603920 <store_l>
  40090d:	5b                   	pop    %rbx
  40090e:	c3                   	retq   

000000000040090f <cpt>:
  40090f:	48 83 ec 08          	sub    $0x8,%rsp
  400913:	e8 f8 01 00 00       	callq  400b10 <fcyc>
  400918:	f2 0f 59 05 d8 07 00 	mulsd  0x7d8(%rip),%xmm0        # 4010f8 <_IO_stdin_used+0x30>
  40091f:	00 
  400920:	48 83 c4 08          	add    $0x8,%rsp
  400924:	c3                   	retq   

0000000000400925 <main>:
  400925:	41 54                	push   %r12
  400927:	55                   	push   %rbp
  400928:	53                   	push   %rbx
  400929:	bb 00 00 00 00       	mov    $0x0,%ebx
  40092e:	41 bc 00 21 60 00    	mov    $0x602100,%r12d
  400934:	bd 20 29 60 00       	mov    $0x602920,%ebp
  400939:	e8 02 fe ff ff       	callq  400740 <random@plt>
  40093e:	41 89 04 1c          	mov    %eax,(%r12,%rbx,1)
  400942:	48 98                	cltq   
  400944:	48 89 44 5d 00       	mov    %rax,0x0(%rbp,%rbx,2)
  400949:	48 83 c3 04          	add    $0x4,%rbx
  40094d:	48 81 fb 00 08 00 00 	cmp    $0x800,%rbx
  400954:	75 e3                	jne    400939 <main+0x14>
  400956:	be 00 21 60 00       	mov    $0x602100,%esi
  40095b:	bf b9 08 40 00       	mov    $0x4008b9,%edi
  400960:	e8 aa ff ff ff       	callq  40090f <cpt>
  400965:	ba cc 10 40 00       	mov    $0x4010cc,%edx
  40096a:	be d3 10 40 00       	mov    $0x4010d3,%esi
  40096f:	bf 01 00 00 00       	mov    $0x1,%edi
  400974:	b8 01 00 00 00       	mov    $0x1,%eax
  400979:	e8 52 fd ff ff       	callq  4006d0 <__printf_chk@plt>
  40097e:	be 00 21 60 00       	mov    $0x602100,%esi
  400983:	bf e3 08 40 00       	mov    $0x4008e3,%edi
  400988:	e8 82 ff ff ff       	callq  40090f <cpt>
  40098d:	ba ec 10 40 00       	mov    $0x4010ec,%edx
  400992:	be d3 10 40 00       	mov    $0x4010d3,%esi
  400997:	bf 01 00 00 00       	mov    $0x1,%edi
  40099c:	b8 01 00 00 00       	mov    $0x1,%eax
  4009a1:	e8 2a fd ff ff       	callq  4006d0 <__printf_chk@plt>
  4009a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4009ab:	5b                   	pop    %rbx
  4009ac:	5d                   	pop    %rbp
  4009ad:	41 5c                	pop    %r12
  4009af:	c3                   	retq   

00000000004009b0 <add_sample>:
  4009b0:	8b 3d 22 17 20 00    	mov    0x201722(%rip),%edi        # 6020d8 <samplecount>
  4009b6:	8b 35 d0 16 20 00    	mov    0x2016d0(%rip),%esi        # 60208c <kbest>
  4009bc:	31 c9                	xor    %ecx,%ecx
  4009be:	f2 0f 10 c8          	movsd  %xmm0,%xmm1
  4009c2:	39 f7                	cmp    %esi,%edi
  4009c4:	7d 4c                	jge    400a12 <add_sample+0x62>
  4009c6:	48 8b 15 03 17 20 00 	mov    0x201703(%rip),%rdx        # 6020d0 <values>
  4009cd:	89 f9                	mov    %edi,%ecx
  4009cf:	48 63 c7             	movslq %edi,%rax
  4009d2:	f2 0f 11 0c c2       	movsd  %xmm1,(%rdx,%rax,8)
  4009d7:	8d 47 01             	lea    0x1(%rdi),%eax
  4009da:	85 c9                	test   %ecx,%ecx
  4009dc:	89 05 f6 16 20 00    	mov    %eax,0x2016f6(%rip)        # 6020d8 <samplecount>
  4009e2:	7e 2c                	jle    400a10 <add_sample+0x60>
  4009e4:	48 63 c1             	movslq %ecx,%rax
  4009e7:	66 0f 12 4c c2 f8    	movlpd -0x8(%rdx,%rax,8),%xmm1
  4009ed:	66 0f 12 04 c2       	movlpd (%rdx,%rax,8),%xmm0
  4009f2:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
  4009f6:	76 18                	jbe    400a10 <add_sample+0x60>
  4009f8:	ff c9                	dec    %ecx
  4009fa:	f2 0f 11 44 c2 f8    	movsd  %xmm0,-0x8(%rdx,%rax,8)
  400a00:	85 c9                	test   %ecx,%ecx
  400a02:	f2 0f 11 0c c2       	movsd  %xmm1,(%rdx,%rax,8)
  400a07:	7f db                	jg     4009e4 <add_sample+0x34>
  400a09:	66 66 66 90          	xchg   %ax,%ax
  400a0d:	66 66 90             	xchg   %ax,%ax
  400a10:	f3 c3                	repz retq 
  400a12:	48 8b 15 b7 16 20 00 	mov    0x2016b7(%rip),%rdx        # 6020d0 <values>
  400a19:	48 63 c6             	movslq %esi,%rax
  400a1c:	66 0f 12 44 c2 f8    	movlpd -0x8(%rdx,%rax,8),%xmm0
  400a22:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  400a26:	76 af                	jbe    4009d7 <add_sample+0x27>
  400a28:	8d 4e ff             	lea    -0x1(%rsi),%ecx
  400a2b:	48 63 c1             	movslq %ecx,%rax
  400a2e:	eb a2                	jmp    4009d2 <add_sample+0x22>

0000000000400a30 <has_converged>:
  400a30:	31 c9                	xor    %ecx,%ecx
  400a32:	8b 05 54 16 20 00    	mov    0x201654(%rip),%eax        # 60208c <kbest>
  400a38:	39 05 9a 16 20 00    	cmp    %eax,0x20169a(%rip)        # 6020d8 <samplecount>
  400a3e:	7c 2b                	jl     400a6b <has_converged+0x3b>
  400a40:	66 0f 12 05 b8 06 00 	movlpd 0x6b8(%rip),%xmm0        # 401100 <_IO_stdin_used+0x38>
  400a47:	00 
  400a48:	48 8b 15 81 16 20 00 	mov    0x201681(%rip),%rdx        # 6020d0 <values>
  400a4f:	48 98                	cltq   
  400a51:	f2 0f 58 05 27 16 20 	addsd  0x201627(%rip),%xmm0        # 602080 <epsilon>
  400a58:	00 
  400a59:	f2 0f 59 02          	mulsd  (%rdx),%xmm0
  400a5d:	66 0f 2e 44 c2 f8    	ucomisd -0x8(%rdx,%rax,8),%xmm0
  400a63:	b8 01 00 00 00       	mov    $0x1,%eax
  400a68:	0f 43 c8             	cmovae %eax,%ecx
  400a6b:	89 c8                	mov    %ecx,%eax
  400a6d:	c3                   	retq   
  400a6e:	66 90                	xchg   %ax,%ax

0000000000400a70 <clear>:
  400a70:	55                   	push   %rbp
  400a71:	53                   	push   %rbx
  400a72:	48 83 ec 08          	sub    $0x8,%rsp
  400a76:	48 63 05 13 16 20 00 	movslq 0x201613(%rip),%rax        # 602090 <cache_block>
  400a7d:	8b 1d 59 16 20 00    	mov    0x201659(%rip),%ebx        # 6020dc <sink>
  400a83:	48 89 c5             	mov    %rax,%rbp
  400a86:	48 8b 05 33 16 20 00 	mov    0x201633(%rip),%rax        # 6020c0 <cache_buf>
  400a8d:	48 c1 ed 02          	shr    $0x2,%rbp
  400a91:	48 85 c0             	test   %rax,%rax
  400a94:	74 35                	je     400acb <clear+0x5b>
  400a96:	48 89 c2             	mov    %rax,%rdx
  400a99:	48 63 05 f4 15 20 00 	movslq 0x2015f4(%rip),%rax        # 602094 <cache_bytes>
  400aa0:	48 83 e0 fc          	and    $0xfffffffffffffffc,%rax
  400aa4:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
  400aa8:	48 39 ca             	cmp    %rcx,%rdx
  400aab:	73 11                	jae    400abe <clear+0x4e>
  400aad:	48 63 c5             	movslq %ebp,%rax
  400ab0:	48 c1 e0 02          	shl    $0x2,%rax
  400ab4:	03 1a                	add    (%rdx),%ebx
  400ab6:	48 01 c2             	add    %rax,%rdx
  400ab9:	48 39 ca             	cmp    %rcx,%rdx
  400abc:	72 f6                	jb     400ab4 <clear+0x44>
  400abe:	89 1d 18 16 20 00    	mov    %ebx,0x201618(%rip)        # 6020dc <sink>
  400ac4:	48 83 c4 08          	add    $0x8,%rsp
  400ac8:	5b                   	pop    %rbx
  400ac9:	5d                   	pop    %rbp
  400aca:	c3                   	retq   
  400acb:	48 63 3d c2 15 20 00 	movslq 0x2015c2(%rip),%rdi        # 602094 <cache_bytes>
  400ad2:	e8 09 fc ff ff       	callq  4006e0 <malloc@plt>
  400ad7:	48 85 c0             	test   %rax,%rax
  400ada:	48 89 05 df 15 20 00 	mov    %rax,0x2015df(%rip)        # 6020c0 <cache_buf>
  400ae1:	75 b3                	jne    400a96 <clear+0x26>
  400ae3:	48 8b 0d b6 15 20 00 	mov    0x2015b6(%rip),%rcx        # 6020a0 <stderr@@GLIBC_2.2.5>
  400aea:	bf 08 11 40 00       	mov    $0x401108,%edi
  400aef:	ba 3e 00 00 00       	mov    $0x3e,%edx
  400af4:	be 01 00 00 00       	mov    $0x1,%esi
  400af9:	e8 52 fc ff ff       	callq  400750 <fwrite@plt>
  400afe:	bf 01 00 00 00       	mov    $0x1,%edi
  400b03:	e8 b8 fb ff ff       	callq  4006c0 <exit@plt>
  400b08:	66 66 66 90          	xchg   %ax,%ax
  400b0c:	66 66 66 90          	xchg   %ax,%ax

0000000000400b10 <fcyc>:
  400b10:	55                   	push   %rbp
  400b11:	48 89 fd             	mov    %rdi,%rbp
  400b14:	53                   	push   %rbx
  400b15:	48 89 f3             	mov    %rsi,%rbx
  400b18:	48 83 ec 08          	sub    $0x8,%rsp
  400b1c:	48 8b 3d ad 15 20 00 	mov    0x2015ad(%rip),%rdi        # 6020d0 <values>
  400b23:	48 85 ff             	test   %rdi,%rdi
  400b26:	0f 85 ee 00 00 00    	jne    400c1a <fcyc+0x10a>
  400b2c:	48 63 3d 59 15 20 00 	movslq 0x201559(%rip),%rdi        # 60208c <kbest>
  400b33:	be 08 00 00 00       	mov    $0x8,%esi
  400b38:	e8 f3 fb ff ff       	callq  400730 <calloc@plt>
  400b3d:	8b 0d 75 15 20 00    	mov    0x201575(%rip),%ecx        # 6020b8 <compensate>
  400b43:	48 89 05 86 15 20 00 	mov    %rax,0x201586(%rip)        # 6020d0 <values>
  400b4a:	c7 05 84 15 20 00 00 	movl   $0x0,0x201584(%rip)        # 6020d8 <samplecount>
  400b51:	00 00 00 
  400b54:	85 c9                	test   %ecx,%ecx
  400b56:	0f 84 85 00 00 00    	je     400be1 <fcyc+0xd1>
  400b5c:	eb 33                	jmp    400b91 <fcyc+0x81>
  400b5e:	66 90                	xchg   %ax,%ax
  400b60:	31 c0                	xor    %eax,%eax
  400b62:	e8 e9 02 00 00       	callq  400e50 <start_comp_counter>
  400b67:	48 89 df             	mov    %rbx,%rdi
  400b6a:	ff d5                	callq  *%rbp
  400b6c:	31 c0                	xor    %eax,%eax
  400b6e:	e8 1d 04 00 00       	callq  400f90 <get_comp_counter>
  400b73:	e8 38 fe ff ff       	callq  4009b0 <add_sample>
  400b78:	31 c0                	xor    %eax,%eax
  400b7a:	e8 b1 fe ff ff       	callq  400a30 <has_converged>
  400b7f:	85 c0                	test   %eax,%eax
  400b81:	75 6d                	jne    400bf0 <fcyc+0xe0>
  400b83:	8b 05 ff 14 20 00    	mov    0x2014ff(%rip),%eax        # 602088 <maxsamples>
  400b89:	39 05 49 15 20 00    	cmp    %eax,0x201549(%rip)        # 6020d8 <samplecount>
  400b8f:	7d 5f                	jge    400bf0 <fcyc+0xe0>
  400b91:	8b 15 31 15 20 00    	mov    0x201531(%rip),%edx        # 6020c8 <clear_cache>
  400b97:	85 d2                	test   %edx,%edx
  400b99:	74 c5                	je     400b60 <fcyc+0x50>
  400b9b:	31 c0                	xor    %eax,%eax
  400b9d:	e8 ce fe ff ff       	callq  400a70 <clear>
  400ba2:	eb bc                	jmp    400b60 <fcyc+0x50>
  400ba4:	31 c0                	xor    %eax,%eax
  400ba6:	e8 c5 fe ff ff       	callq  400a70 <clear>
  400bab:	66 66 90             	xchg   %ax,%ax
  400bae:	66 90                	xchg   %ax,%ax
  400bb0:	31 c0                	xor    %eax,%eax
  400bb2:	e8 29 01 00 00       	callq  400ce0 <start_counter>
  400bb7:	48 89 df             	mov    %rbx,%rdi
  400bba:	ff d5                	callq  *%rbp
  400bbc:	31 c0                	xor    %eax,%eax
  400bbe:	e8 2d 01 00 00       	callq  400cf0 <get_counter>
  400bc3:	e8 e8 fd ff ff       	callq  4009b0 <add_sample>
  400bc8:	31 c0                	xor    %eax,%eax
  400bca:	e8 61 fe ff ff       	callq  400a30 <has_converged>
  400bcf:	85 c0                	test   %eax,%eax
  400bd1:	75 1d                	jne    400bf0 <fcyc+0xe0>
  400bd3:	8b 05 af 14 20 00    	mov    0x2014af(%rip),%eax        # 602088 <maxsamples>
  400bd9:	39 05 f9 14 20 00    	cmp    %eax,0x2014f9(%rip)        # 6020d8 <samplecount>
  400bdf:	7d 0f                	jge    400bf0 <fcyc+0xe0>
  400be1:	8b 05 e1 14 20 00    	mov    0x2014e1(%rip),%eax        # 6020c8 <clear_cache>
  400be7:	85 c0                	test   %eax,%eax
  400be9:	74 c5                	je     400bb0 <fcyc+0xa0>
  400beb:	eb b7                	jmp    400ba4 <fcyc+0x94>
  400bed:	66 66 90             	xchg   %ax,%ax
  400bf0:	48 8b 3d d9 14 20 00 	mov    0x2014d9(%rip),%rdi        # 6020d0 <values>
  400bf7:	48 8b 1f             	mov    (%rdi),%rbx
  400bfa:	e8 11 fb ff ff       	callq  400710 <free@plt>
  400bff:	48 c7 05 c6 14 20 00 	movq   $0x0,0x2014c6(%rip)        # 6020d0 <values>
  400c06:	00 00 00 00 
  400c0a:	48 89 1c 24          	mov    %rbx,(%rsp)
  400c0e:	66 0f 12 04 24       	movlpd (%rsp),%xmm0
  400c13:	48 83 c4 08          	add    $0x8,%rsp
  400c17:	5b                   	pop    %rbx
  400c18:	5d                   	pop    %rbp
  400c19:	c3                   	retq   
  400c1a:	e8 f1 fa ff ff       	callq  400710 <free@plt>
  400c1f:	e9 08 ff ff ff       	jmpq   400b2c <fcyc+0x1c>
  400c24:	66 66 66 90          	xchg   %ax,%ax
  400c28:	66 66 66 90          	xchg   %ax,%ax
  400c2c:	66 66 66 90          	xchg   %ax,%ax

0000000000400c30 <set_fcyc_clear_cache>:
  400c30:	89 3d 92 14 20 00    	mov    %edi,0x201492(%rip)        # 6020c8 <clear_cache>
  400c36:	c3                   	retq   
  400c37:	66 66 90             	xchg   %ax,%ax
  400c3a:	66 66 90             	xchg   %ax,%ax
  400c3d:	66 66 90             	xchg   %ax,%ax

0000000000400c40 <set_fcyc_cache_sizee>:
  400c40:	48 83 ec 08          	sub    $0x8,%rsp
  400c44:	3b 3d 4a 14 20 00    	cmp    0x20144a(%rip),%edi        # 602094 <cache_bytes>
  400c4a:	74 12                	je     400c5e <set_fcyc_cache_sizee+0x1e>
  400c4c:	89 3d 42 14 20 00    	mov    %edi,0x201442(%rip)        # 602094 <cache_bytes>
  400c52:	48 8b 3d 67 14 20 00 	mov    0x201467(%rip),%rdi        # 6020c0 <cache_buf>
  400c59:	48 85 ff             	test   %rdi,%rdi
  400c5c:	75 05                	jne    400c63 <set_fcyc_cache_sizee+0x23>
  400c5e:	48 83 c4 08          	add    $0x8,%rsp
  400c62:	c3                   	retq   
  400c63:	e8 a8 fa ff ff       	callq  400710 <free@plt>
  400c68:	48 c7 05 4d 14 20 00 	movq   $0x0,0x20144d(%rip)        # 6020c0 <cache_buf>
  400c6f:	00 00 00 00 
  400c73:	48 83 c4 08          	add    $0x8,%rsp
  400c77:	c3                   	retq   
  400c78:	66 66 66 90          	xchg   %ax,%ax
  400c7c:	66 66 66 90          	xchg   %ax,%ax

0000000000400c80 <set_fcyc_cache_block>:
  400c80:	89 3d 0a 14 20 00    	mov    %edi,0x20140a(%rip)        # 602090 <cache_block>
  400c86:	c3                   	retq   
  400c87:	66 66 90             	xchg   %ax,%ax
  400c8a:	66 66 90             	xchg   %ax,%ax
  400c8d:	66 66 90             	xchg   %ax,%ax

0000000000400c90 <set_fcyc_compensate>:
  400c90:	89 3d 22 14 20 00    	mov    %edi,0x201422(%rip)        # 6020b8 <compensate>
  400c96:	c3                   	retq   
  400c97:	66 66 90             	xchg   %ax,%ax
  400c9a:	66 66 90             	xchg   %ax,%ax
  400c9d:	66 66 90             	xchg   %ax,%ax

0000000000400ca0 <set_fcyc_k>:
  400ca0:	89 3d e6 13 20 00    	mov    %edi,0x2013e6(%rip)        # 60208c <kbest>
  400ca6:	c3                   	retq   
  400ca7:	66 66 90             	xchg   %ax,%ax
  400caa:	66 66 90             	xchg   %ax,%ax
  400cad:	66 66 90             	xchg   %ax,%ax

0000000000400cb0 <set_fcyc_maxsamples>:
  400cb0:	89 3d d2 13 20 00    	mov    %edi,0x2013d2(%rip)        # 602088 <maxsamples>
  400cb6:	c3                   	retq   
  400cb7:	66 66 90             	xchg   %ax,%ax
  400cba:	66 66 90             	xchg   %ax,%ax
  400cbd:	66 66 90             	xchg   %ax,%ax

0000000000400cc0 <set_fcyc_epsilon>:
  400cc0:	f2 0f 11 05 b8 13 20 	movsd  %xmm0,0x2013b8(%rip)        # 602080 <epsilon>
  400cc7:	00 
  400cc8:	c3                   	retq   
  400cc9:	90                   	nop    
  400cca:	90                   	nop    
  400ccb:	90                   	nop    
  400ccc:	90                   	nop    
  400ccd:	90                   	nop    
  400cce:	90                   	nop    
  400ccf:	90                   	nop    

0000000000400cd0 <access_counter>:
  400cd0:	0f 31                	rdtsc  
  400cd2:	89 d1                	mov    %edx,%ecx
  400cd4:	41 89 c0             	mov    %eax,%r8d
  400cd7:	89 0f                	mov    %ecx,(%rdi)
  400cd9:	44 89 06             	mov    %r8d,(%rsi)
  400cdc:	c3                   	retq   
  400cdd:	66 66 90             	xchg   %ax,%ax

0000000000400ce0 <start_counter>:
  400ce0:	be f4 20 60 00       	mov    $0x6020f4,%esi
  400ce5:	bf f0 20 60 00       	mov    $0x6020f0,%edi
  400cea:	e9 e1 ff ff ff       	jmpq   400cd0 <access_counter>
  400cef:	90                   	nop    

0000000000400cf0 <get_counter>:
  400cf0:	48 83 ec 28          	sub    $0x28,%rsp
  400cf4:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
  400cf9:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
  400cfe:	e8 cd ff ff ff       	callq  400cd0 <access_counter>
  400d03:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  400d07:	31 d2                	xor    %edx,%edx
  400d09:	89 c1                	mov    %eax,%ecx
  400d0b:	2b 0d e3 13 20 00    	sub    0x2013e3(%rip),%ecx        # 6020f4 <cyc_lo>
  400d11:	39 c1                	cmp    %eax,%ecx
  400d13:	8b 44 24 18          	mov    0x18(%rsp),%eax
  400d17:	89 c9                	mov    %ecx,%ecx
  400d19:	0f 97 c2             	seta   %dl
  400d1c:	2b 05 ce 13 20 00    	sub    0x2013ce(%rip),%eax        # 6020f0 <cyc_hi>
  400d22:	f2 48 0f 2a c1       	cvtsi2sd %rcx,%xmm0
  400d27:	29 d0                	sub    %edx,%eax
  400d29:	f2 48 0f 2a c8       	cvtsi2sd %rax,%xmm1
  400d2e:	f2 0f 59 0d 72 04 00 	mulsd  0x472(%rip),%xmm1        # 4011a8 <_IO_stdin_used+0xe0>
  400d35:	00 
  400d36:	f2 0f 59 0d 72 04 00 	mulsd  0x472(%rip),%xmm1        # 4011b0 <_IO_stdin_used+0xe8>
  400d3d:	00 
  400d3e:	f2 0f 58 c8          	addsd  %xmm0,%xmm1
  400d42:	66 0f 57 c0          	xorpd  %xmm0,%xmm0
  400d46:	66 0f 2e c1          	ucomisd %xmm1,%xmm0
  400d4a:	77 09                	ja     400d55 <get_counter+0x65>
  400d4c:	f2 0f 10 c1          	movsd  %xmm1,%xmm0
  400d50:	48 83 c4 28          	add    $0x28,%rsp
  400d54:	c3                   	retq   
  400d55:	48 8b 3d 44 13 20 00 	mov    0x201344(%rip),%rdi        # 6020a0 <stderr@@GLIBC_2.2.5>
  400d5c:	f2 0f 10 c1          	movsd  %xmm1,%xmm0
  400d60:	be 48 11 40 00       	mov    $0x401148,%esi
  400d65:	b8 01 00 00 00       	mov    $0x1,%eax
  400d6a:	f2 0f 11 0c 24       	movsd  %xmm1,(%rsp)
  400d6f:	e8 ec f9 ff ff       	callq  400760 <fprintf@plt>
  400d74:	66 0f 12 0c 24       	movlpd (%rsp),%xmm1
  400d79:	48 83 c4 28          	add    $0x28,%rsp
  400d7d:	f2 0f 10 c1          	movsd  %xmm1,%xmm0
  400d81:	c3                   	retq   
  400d82:	66 66 66 90          	xchg   %ax,%ax
  400d86:	66 66 66 90          	xchg   %ax,%ax
  400d8a:	66 66 90             	xchg   %ax,%ax
  400d8d:	66 66 90             	xchg   %ax,%ax

0000000000400d90 <ovhd>:
  400d90:	53                   	push   %rbx
  400d91:	bb 01 00 00 00       	mov    $0x1,%ebx
  400d96:	48 83 ec 10          	sub    $0x10,%rsp
  400d9a:	31 c0                	xor    %eax,%eax
  400d9c:	e8 3f ff ff ff       	callq  400ce0 <start_counter>
  400da1:	31 c0                	xor    %eax,%eax
  400da3:	e8 48 ff ff ff       	callq  400cf0 <get_counter>
  400da8:	ff cb                	dec    %ebx
  400daa:	f2 0f 11 44 24 08    	movsd  %xmm0,0x8(%rsp)
  400db0:	79 e8                	jns    400d9a <ovhd+0xa>
  400db2:	48 83 c4 10          	add    $0x10,%rsp
  400db6:	5b                   	pop    %rbx
  400db7:	c3                   	retq   
  400db8:	66 66 66 90          	xchg   %ax,%ax
  400dbc:	66 66 66 90          	xchg   %ax,%ax

0000000000400dc0 <mhz_full>:
  400dc0:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  400dc5:	4c 89 64 24 f8       	mov    %r12,-0x8(%rsp)
  400dca:	89 f3                	mov    %esi,%ebx
  400dcc:	48 83 ec 18          	sub    $0x18,%rsp
  400dd0:	31 c0                	xor    %eax,%eax
  400dd2:	41 89 fc             	mov    %edi,%r12d
  400dd5:	e8 06 ff ff ff       	callq  400ce0 <start_counter>
  400dda:	89 df                	mov    %ebx,%edi
  400ddc:	e8 3f f9 ff ff       	callq  400720 <sleep@plt>
  400de1:	31 c0                	xor    %eax,%eax
  400de3:	e8 08 ff ff ff       	callq  400cf0 <get_counter>
  400de8:	f2 0f 2a cb          	cvtsi2sd %ebx,%xmm1
  400dec:	45 85 e4             	test   %r12d,%r12d
  400def:	f2 0f 59 0d c1 03 00 	mulsd  0x3c1(%rip),%xmm1        # 4011b8 <_IO_stdin_used+0xf0>
  400df6:	00 
  400df7:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  400dfb:	f2 0f 11 04 24       	movsd  %xmm0,(%rsp)
  400e00:	75 14                	jne    400e16 <mhz_full+0x56>
  400e02:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  400e07:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  400e0c:	66 0f 12 04 24       	movlpd (%rsp),%xmm0
  400e11:	48 83 c4 18          	add    $0x18,%rsp
  400e15:	c3                   	retq   
  400e16:	bf 80 11 40 00       	mov    $0x401180,%edi
  400e1b:	b8 01 00 00 00       	mov    $0x1,%eax
  400e20:	e8 8b f8 ff ff       	callq  4006b0 <printf@plt>
  400e25:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  400e2a:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  400e2f:	66 0f 12 04 24       	movlpd (%rsp),%xmm0
  400e34:	48 83 c4 18          	add    $0x18,%rsp
  400e38:	c3                   	retq   
  400e39:	66 66 66 90          	xchg   %ax,%ax
  400e3d:	66 66 90             	xchg   %ax,%ax

0000000000400e40 <mhz>:
  400e40:	be 02 00 00 00       	mov    $0x2,%esi
  400e45:	e9 76 ff ff ff       	jmpq   400dc0 <mhz_full>
  400e4a:	66 66 90             	xchg   %ax,%ax
  400e4d:	66 66 90             	xchg   %ax,%ax

0000000000400e50 <start_comp_counter>:
  400e50:	41 54                	push   %r12
  400e52:	55                   	push   %rbp
  400e53:	53                   	push   %rbx
  400e54:	48 83 ec 70          	sub    $0x70,%rsp
  400e58:	66 0f 12 05 80 12 20 	movlpd 0x201280(%rip),%xmm0        # 6020e0 <cyc_per_tick>
  400e5f:	00 
  400e60:	66 0f 2e 05 58 03 00 	ucomisd 0x358(%rip),%xmm0        # 4011c0 <_IO_stdin_used+0xf8>
  400e67:	00 
  400e68:	74 26                	je     400e90 <start_comp_counter+0x40>
  400e6a:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  400e6f:	e8 8c f8 ff ff       	callq  400700 <times@plt>
  400e74:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  400e79:	48 89 05 68 12 20 00 	mov    %rax,0x201268(%rip)        # 6020e8 <start_tick>
  400e80:	31 c0                	xor    %eax,%eax
  400e82:	e8 59 fe ff ff       	callq  400ce0 <start_counter>
  400e87:	48 83 c4 70          	add    $0x70,%rsp
  400e8b:	5b                   	pop    %rbx
  400e8c:	5d                   	pop    %rbp
  400e8d:	41 5c                	pop    %r12
  400e8f:	c3                   	retq   
  400e90:	7a d8                	jp     400e6a <start_comp_counter+0x1a>
  400e92:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  400e97:	bd 63 00 00 00       	mov    $0x63,%ebp
  400e9c:	4c 89 e7             	mov    %r12,%rdi
  400e9f:	e8 5c f8 ff ff       	callq  400700 <times@plt>
  400ea4:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
  400ea9:	31 c0                	xor    %eax,%eax
  400eab:	e8 30 fe ff ff       	callq  400ce0 <start_counter>
  400eb0:	31 c0                	xor    %eax,%eax
  400eb2:	e8 39 fe ff ff       	callq  400cf0 <get_counter>
  400eb7:	f2 0f 11 44 24 28    	movsd  %xmm0,0x28(%rsp)
  400ebd:	eb 09                	jmp    400ec8 <start_comp_counter+0x78>
  400ebf:	90                   	nop    
  400ec0:	85 ed                	test   %ebp,%ebp
  400ec2:	0f 88 a8 00 00 00    	js     400f70 <start_comp_counter+0x120>
  400ec8:	31 c0                	xor    %eax,%eax
  400eca:	e8 21 fe ff ff       	callq  400cf0 <get_counter>
  400ecf:	f2 0f 11 44 24 20    	movsd  %xmm0,0x20(%rsp)
  400ed5:	f2 0f 5c 44 24 28    	subsd  0x28(%rsp),%xmm0
  400edb:	66 0f 2e 05 e5 02 00 	ucomisd 0x2e5(%rip),%xmm0        # 4011c8 <_IO_stdin_used+0x100>
  400ee2:	00 
  400ee3:	f2 0f 11 44 24 18    	movsd  %xmm0,0x18(%rsp)
  400ee9:	72 d5                	jb     400ec0 <start_comp_counter+0x70>
  400eeb:	4c 89 e7             	mov    %r12,%rdi
  400eee:	e8 0d f8 ff ff       	callq  400700 <times@plt>
  400ef3:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
  400ef8:	48 39 da             	cmp    %rbx,%rdx
  400efb:	7e 5a                	jle    400f57 <start_comp_counter+0x107>
  400efd:	48 89 d0             	mov    %rdx,%rax
  400f00:	66 0f 12 4c 24 18    	movlpd 0x18(%rsp),%xmm1
  400f06:	48 29 d8             	sub    %rbx,%rax
  400f09:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  400f0e:	f2 0f 5e c8          	divsd  %xmm0,%xmm1
  400f12:	f2 0f 10 c1          	movsd  %xmm1,%xmm0
  400f16:	66 0f 12 0d c2 11 20 	movlpd 0x2011c2(%rip),%xmm1        # 6020e0 <cyc_per_tick>
  400f1d:	00 
  400f1e:	66 0f 2e 0d 9a 02 00 	ucomisd 0x29a(%rip),%xmm1        # 4011c0 <_IO_stdin_used+0xf8>
  400f25:	00 
  400f26:	7a 02                	jp     400f2a <start_comp_counter+0xda>
  400f28:	74 06                	je     400f30 <start_comp_counter+0xe0>
  400f2a:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
  400f2e:	76 22                	jbe    400f52 <start_comp_counter+0x102>
  400f30:	66 0f 2e 05 98 02 00 	ucomisd 0x298(%rip),%xmm0        # 4011d0 <_IO_stdin_used+0x108>
  400f37:	00 
  400f38:	f2 0f 11 44 24 08    	movsd  %xmm0,0x8(%rsp)
  400f3e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  400f43:	48 0f 46 05 95 11 20 	cmovbe 0x201195(%rip),%rax        # 6020e0 <cyc_per_tick>
  400f4a:	00 
  400f4b:	48 89 05 8e 11 20 00 	mov    %rax,0x20118e(%rip)        # 6020e0 <cyc_per_tick>
  400f52:	ff cd                	dec    %ebp
  400f54:	48 89 d3             	mov    %rdx,%rbx
  400f57:	66 0f 12 44 24 20    	movlpd 0x20(%rsp),%xmm0
  400f5d:	85 ed                	test   %ebp,%ebp
  400f5f:	f2 0f 11 44 24 28    	movsd  %xmm0,0x28(%rsp)
  400f65:	0f 89 5d ff ff ff    	jns    400ec8 <start_comp_counter+0x78>
  400f6b:	66 66 90             	xchg   %ax,%ax
  400f6e:	66 90                	xchg   %ax,%ax
  400f70:	66 0f 12 05 68 11 20 	movlpd 0x201168(%rip),%xmm0        # 6020e0 <cyc_per_tick>
  400f77:	00 
  400f78:	bf d8 11 40 00       	mov    $0x4011d8,%edi
  400f7d:	b8 01 00 00 00       	mov    $0x1,%eax
  400f82:	e8 29 f7 ff ff       	callq  4006b0 <printf@plt>
  400f87:	e9 de fe ff ff       	jmpq   400e6a <start_comp_counter+0x1a>
  400f8c:	66 66 66 90          	xchg   %ax,%ax

0000000000400f90 <get_comp_counter>:
  400f90:	48 83 ec 38          	sub    $0x38,%rsp
  400f94:	31 c0                	xor    %eax,%eax
  400f96:	e8 55 fd ff ff       	callq  400cf0 <get_counter>
  400f9b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  400fa0:	f2 0f 11 44 24 08    	movsd  %xmm0,0x8(%rsp)
  400fa6:	e8 55 f7 ff ff       	callq  400700 <times@plt>
  400fab:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  400fb0:	48 2b 05 31 11 20 00 	sub    0x201131(%rip),%rax        # 6020e8 <start_tick>
  400fb7:	66 0f 12 4c 24 08    	movlpd 0x8(%rsp),%xmm1
  400fbd:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
  400fc2:	f2 0f 59 05 16 11 20 	mulsd  0x201116(%rip),%xmm0        # 6020e0 <cyc_per_tick>
  400fc9:	00 
  400fca:	48 83 c4 38          	add    $0x38,%rsp
  400fce:	f2 0f 5c c8          	subsd  %xmm0,%xmm1
  400fd2:	f2 0f 10 c1          	movsd  %xmm1,%xmm0
  400fd6:	c3                   	retq   
  400fd7:	90                   	nop    
  400fd8:	90                   	nop    
  400fd9:	90                   	nop    
  400fda:	90                   	nop    
  400fdb:	90                   	nop    
  400fdc:	90                   	nop    
  400fdd:	90                   	nop    
  400fde:	90                   	nop    
  400fdf:	90                   	nop    

0000000000400fe0 <__libc_csu_fini>:
  400fe0:	f3 c3                	repz retq 
  400fe2:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  400fe9:	1f 84 00 00 00 00 00 

0000000000400ff0 <__libc_csu_init>:
  400ff0:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  400ff5:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  400ffa:	48 8d 2d 13 0e 20 00 	lea    0x200e13(%rip),%rbp        # 601e14 <__init_array_end>
  401001:	4c 8d 3d 0c 0e 20 00 	lea    0x200e0c(%rip),%r15        # 601e14 <__init_array_end>
  401008:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40100d:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  401012:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  401017:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  40101c:	48 83 ec 38          	sub    $0x38,%rsp
  401020:	4c 29 fd             	sub    %r15,%rbp
  401023:	41 89 fe             	mov    %edi,%r14d
  401026:	49 89 f5             	mov    %rsi,%r13
  401029:	48 c1 fd 03          	sar    $0x3,%rbp
  40102d:	49 89 d4             	mov    %rdx,%r12
  401030:	e8 53 f6 ff ff       	callq  400688 <_init>
  401035:	48 85 ed             	test   %rbp,%rbp
  401038:	74 1c                	je     401056 <__libc_csu_init+0x66>
  40103a:	31 db                	xor    %ebx,%ebx
  40103c:	0f 1f 40 00          	nopl   0x0(%rax)
  401040:	4c 89 e2             	mov    %r12,%rdx
  401043:	4c 89 ee             	mov    %r13,%rsi
  401046:	44 89 f7             	mov    %r14d,%edi
  401049:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  40104d:	48 83 c3 01          	add    $0x1,%rbx
  401051:	48 39 eb             	cmp    %rbp,%rbx
  401054:	72 ea                	jb     401040 <__libc_csu_init+0x50>
  401056:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40105b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  401060:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  401065:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40106a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  40106f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  401074:	48 83 c4 38          	add    $0x38,%rsp
  401078:	c3                   	retq   
  401079:	90                   	nop    
  40107a:	90                   	nop    
  40107b:	90                   	nop    
  40107c:	90                   	nop    
  40107d:	90                   	nop    
  40107e:	90                   	nop    
  40107f:	90                   	nop    

0000000000401080 <__do_global_ctors_aux>:
  401080:	55                   	push   %rbp
  401081:	48 89 e5             	mov    %rsp,%rbp
  401084:	53                   	push   %rbx
  401085:	48 83 ec 08          	sub    $0x8,%rsp
  401089:	48 8b 05 88 0d 20 00 	mov    0x200d88(%rip),%rax        # 601e18 <__CTOR_LIST__>
  401090:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  401094:	74 19                	je     4010af <__do_global_ctors_aux+0x2f>
  401096:	bb 18 1e 60 00       	mov    $0x601e18,%ebx
  40109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4010a0:	48 83 eb 08          	sub    $0x8,%rbx
  4010a4:	ff d0                	callq  *%rax
  4010a6:	48 8b 03             	mov    (%rbx),%rax
  4010a9:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4010ad:	75 f1                	jne    4010a0 <__do_global_ctors_aux+0x20>
  4010af:	48 83 c4 08          	add    $0x8,%rsp
  4010b3:	5b                   	pop    %rbx
  4010b4:	c9                   	leaveq 
  4010b5:	c3                   	retq   
  4010b6:	90                   	nop    
  4010b7:	90                   	nop    

Disassembly of section .fini:

00000000004010b8 <_fini>:
  4010b8:	48 83 ec 08          	sub    $0x8,%rsp
  4010bc:	e8 ff f6 ff ff       	callq  4007c0 <__do_global_dtors_aux>
  4010c1:	48 83 c4 08          	add    $0x8,%rsp
  4010c5:	c3                   	retq   
