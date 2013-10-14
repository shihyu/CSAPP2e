
psum:     file format elf64-x86-64


Disassembly of section .init:

0000000000401640 <_init>:
  401640:	48 83 ec 08          	sub    $0x8,%rsp
  401644:	e8 b3 04 00 00       	callq  401afc <call_gmon_start>
  401649:	e8 42 05 00 00       	callq  401b90 <frame_dummy>
  40164e:	e8 6d 18 00 00       	callq  402ec0 <__do_global_ctors_aux>
  401653:	48 83 c4 08          	add    $0x8,%rsp
  401657:	c3                   	retq   

Disassembly of section .plt:

0000000000401658 <sem_wait@plt-0x10>:
  401658:	ff 35 92 29 20 00    	pushq  0x202992(%rip)        # 603ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  40165e:	ff 25 94 29 20 00    	jmpq   *0x202994(%rip)        # 603ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  401664:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401668 <sem_wait@plt>:
  401668:	ff 25 92 29 20 00    	jmpq   *0x202992(%rip)        # 604000 <_GLOBAL_OFFSET_TABLE_+0x18>
  40166e:	68 00 00 00 00       	pushq  $0x0
  401673:	e9 e0 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401678 <dup2@plt>:
  401678:	ff 25 8a 29 20 00    	jmpq   *0x20298a(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x20>
  40167e:	68 01 00 00 00       	pushq  $0x1
  401683:	e9 d0 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401688 <pause@plt>:
  401688:	ff 25 82 29 20 00    	jmpq   *0x202982(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x28>
  40168e:	68 02 00 00 00       	pushq  $0x2
  401693:	e9 c0 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401698 <close@plt>:
  401698:	ff 25 7a 29 20 00    	jmpq   *0x20297a(%rip)        # 604018 <_GLOBAL_OFFSET_TABLE_+0x30>
  40169e:	68 03 00 00 00       	pushq  $0x3
  4016a3:	e9 b0 ff ff ff       	jmpq   401658 <_init+0x18>

00000000004016a8 <wait@plt>:
  4016a8:	ff 25 72 29 20 00    	jmpq   *0x202972(%rip)        # 604020 <_GLOBAL_OFFSET_TABLE_+0x38>
  4016ae:	68 04 00 00 00       	pushq  $0x4
  4016b3:	e9 a0 ff ff ff       	jmpq   401658 <_init+0x18>

00000000004016b8 <__h_errno_location@plt>:
  4016b8:	ff 25 6a 29 20 00    	jmpq   *0x20296a(%rip)        # 604028 <_GLOBAL_OFFSET_TABLE_+0x40>
  4016be:	68 05 00 00 00       	pushq  $0x5
  4016c3:	e9 90 ff ff ff       	jmpq   401658 <_init+0x18>

00000000004016c8 <getpgrp@plt>:
  4016c8:	ff 25 62 29 20 00    	jmpq   *0x202962(%rip)        # 604030 <_GLOBAL_OFFSET_TABLE_+0x48>
  4016ce:	68 06 00 00 00       	pushq  $0x6
  4016d3:	e9 80 ff ff ff       	jmpq   401658 <_init+0x18>

00000000004016d8 <__fprintf_chk@plt>:
  4016d8:	ff 25 5a 29 20 00    	jmpq   *0x20295a(%rip)        # 604038 <_GLOBAL_OFFSET_TABLE_+0x50>
  4016de:	68 07 00 00 00       	pushq  $0x7
  4016e3:	e9 70 ff ff ff       	jmpq   401658 <_init+0x18>

00000000004016e8 <gethostbyname@plt>:
  4016e8:	ff 25 52 29 20 00    	jmpq   *0x202952(%rip)        # 604040 <_GLOBAL_OFFSET_TABLE_+0x58>
  4016ee:	68 08 00 00 00       	pushq  $0x8
  4016f3:	e9 60 ff ff ff       	jmpq   401658 <_init+0x18>

00000000004016f8 <puts@plt>:
  4016f8:	ff 25 4a 29 20 00    	jmpq   *0x20294a(%rip)        # 604048 <_GLOBAL_OFFSET_TABLE_+0x60>
  4016fe:	68 09 00 00 00       	pushq  $0x9
  401703:	e9 50 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401708 <select@plt>:
  401708:	ff 25 42 29 20 00    	jmpq   *0x202942(%rip)        # 604050 <_GLOBAL_OFFSET_TABLE_+0x68>
  40170e:	68 0a 00 00 00       	pushq  $0xa
  401713:	e9 40 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401718 <exit@plt>:
  401718:	ff 25 3a 29 20 00    	jmpq   *0x20293a(%rip)        # 604058 <_GLOBAL_OFFSET_TABLE_+0x70>
  40171e:	68 0b 00 00 00       	pushq  $0xb
  401723:	e9 30 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401728 <__printf_chk@plt>:
  401728:	ff 25 32 29 20 00    	jmpq   *0x202932(%rip)        # 604060 <_GLOBAL_OFFSET_TABLE_+0x78>
  40172e:	68 0c 00 00 00       	pushq  $0xc
  401733:	e9 20 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401738 <read@plt>:
  401738:	ff 25 2a 29 20 00    	jmpq   *0x20292a(%rip)        # 604068 <_GLOBAL_OFFSET_TABLE_+0x80>
  40173e:	68 0d 00 00 00       	pushq  $0xd
  401743:	e9 10 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401748 <malloc@plt>:
  401748:	ff 25 22 29 20 00    	jmpq   *0x202922(%rip)        # 604070 <_GLOBAL_OFFSET_TABLE_+0x88>
  40174e:	68 0e 00 00 00       	pushq  $0xe
  401753:	e9 00 ff ff ff       	jmpq   401658 <_init+0x18>

0000000000401758 <fopen@plt>:
  401758:	ff 25 1a 29 20 00    	jmpq   *0x20291a(%rip)        # 604078 <_GLOBAL_OFFSET_TABLE_+0x90>
  40175e:	68 0f 00 00 00       	pushq  $0xf
  401763:	e9 f0 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401768 <__libc_start_main@plt>:
  401768:	ff 25 12 29 20 00    	jmpq   *0x202912(%rip)        # 604080 <_GLOBAL_OFFSET_TABLE_+0x98>
  40176e:	68 10 00 00 00       	pushq  $0x10
  401773:	e9 e0 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401778 <sigfillset@plt>:
  401778:	ff 25 0a 29 20 00    	jmpq   *0x20290a(%rip)        # 604088 <_GLOBAL_OFFSET_TABLE_+0xa0>
  40177e:	68 11 00 00 00       	pushq  $0x11
  401783:	e9 d0 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401788 <sigismember@plt>:
  401788:	ff 25 02 29 20 00    	jmpq   *0x202902(%rip)        # 604090 <_GLOBAL_OFFSET_TABLE_+0xa8>
  40178e:	68 12 00 00 00       	pushq  $0x12
  401793:	e9 c0 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401798 <setsockopt@plt>:
  401798:	ff 25 fa 28 20 00    	jmpq   *0x2028fa(%rip)        # 604098 <_GLOBAL_OFFSET_TABLE_+0xb0>
  40179e:	68 13 00 00 00       	pushq  $0x13
  4017a3:	e9 b0 fe ff ff       	jmpq   401658 <_init+0x18>

00000000004017a8 <setpgid@plt>:
  4017a8:	ff 25 f2 28 20 00    	jmpq   *0x2028f2(%rip)        # 6040a0 <_GLOBAL_OFFSET_TABLE_+0xb8>
  4017ae:	68 14 00 00 00       	pushq  $0x14
  4017b3:	e9 a0 fe ff ff       	jmpq   401658 <_init+0x18>

00000000004017b8 <fgets@plt>:
  4017b8:	ff 25 ea 28 20 00    	jmpq   *0x2028ea(%rip)        # 6040a8 <_GLOBAL_OFFSET_TABLE_+0xc0>
  4017be:	68 15 00 00 00       	pushq  $0x15
  4017c3:	e9 90 fe ff ff       	jmpq   401658 <_init+0x18>

00000000004017c8 <free@plt>:
  4017c8:	ff 25 e2 28 20 00    	jmpq   *0x2028e2(%rip)        # 6040b0 <_GLOBAL_OFFSET_TABLE_+0xc8>
  4017ce:	68 16 00 00 00       	pushq  $0x16
  4017d3:	e9 80 fe ff ff       	jmpq   401658 <_init+0x18>

00000000004017d8 <ferror@plt>:
  4017d8:	ff 25 da 28 20 00    	jmpq   *0x2028da(%rip)        # 6040b8 <_GLOBAL_OFFSET_TABLE_+0xd0>
  4017de:	68 17 00 00 00       	pushq  $0x17
  4017e3:	e9 70 fe ff ff       	jmpq   401658 <_init+0x18>

00000000004017e8 <pthread_create@plt>:
  4017e8:	ff 25 d2 28 20 00    	jmpq   *0x2028d2(%rip)        # 6040c0 <_GLOBAL_OFFSET_TABLE_+0xd8>
  4017ee:	68 18 00 00 00       	pushq  $0x18
  4017f3:	e9 60 fe ff ff       	jmpq   401658 <_init+0x18>

00000000004017f8 <__xstat@plt>:
  4017f8:	ff 25 ca 28 20 00    	jmpq   *0x2028ca(%rip)        # 6040c8 <_GLOBAL_OFFSET_TABLE_+0xe0>
  4017fe:	68 19 00 00 00       	pushq  $0x19
  401803:	e9 50 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401808 <gethostbyaddr@plt>:
  401808:	ff 25 c2 28 20 00    	jmpq   *0x2028c2(%rip)        # 6040d0 <_GLOBAL_OFFSET_TABLE_+0xe8>
  40180e:	68 1a 00 00 00       	pushq  $0x1a
  401813:	e9 40 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401818 <listen@plt>:
  401818:	ff 25 ba 28 20 00    	jmpq   *0x2028ba(%rip)        # 6040d8 <_GLOBAL_OFFSET_TABLE_+0xf0>
  40181e:	68 1b 00 00 00       	pushq  $0x1b
  401823:	e9 30 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401828 <fdopen@plt>:
  401828:	ff 25 b2 28 20 00    	jmpq   *0x2028b2(%rip)        # 6040e0 <_GLOBAL_OFFSET_TABLE_+0xf8>
  40182e:	68 1c 00 00 00       	pushq  $0x1c
  401833:	e9 20 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401838 <sleep@plt>:
  401838:	ff 25 aa 28 20 00    	jmpq   *0x2028aa(%rip)        # 6040e8 <_GLOBAL_OFFSET_TABLE_+0x100>
  40183e:	68 1d 00 00 00       	pushq  $0x1d
  401843:	e9 10 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401848 <pthread_self@plt>:
  401848:	ff 25 a2 28 20 00    	jmpq   *0x2028a2(%rip)        # 6040f0 <_GLOBAL_OFFSET_TABLE_+0x108>
  40184e:	68 1e 00 00 00       	pushq  $0x1e
  401853:	e9 00 fe ff ff       	jmpq   401658 <_init+0x18>

0000000000401858 <pthread_join@plt>:
  401858:	ff 25 9a 28 20 00    	jmpq   *0x20289a(%rip)        # 6040f8 <_GLOBAL_OFFSET_TABLE_+0x110>
  40185e:	68 1f 00 00 00       	pushq  $0x1f
  401863:	e9 f0 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401868 <kill@plt>:
  401868:	ff 25 92 28 20 00    	jmpq   *0x202892(%rip)        # 604100 <_GLOBAL_OFFSET_TABLE_+0x118>
  40186e:	68 20 00 00 00       	pushq  $0x20
  401873:	e9 e0 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401878 <strerror@plt>:
  401878:	ff 25 8a 28 20 00    	jmpq   *0x20288a(%rip)        # 604108 <_GLOBAL_OFFSET_TABLE_+0x120>
  40187e:	68 21 00 00 00       	pushq  $0x21
  401883:	e9 d0 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401888 <sigprocmask@plt>:
  401888:	ff 25 82 28 20 00    	jmpq   *0x202882(%rip)        # 604110 <_GLOBAL_OFFSET_TABLE_+0x128>
  40188e:	68 22 00 00 00       	pushq  $0x22
  401893:	e9 c0 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401898 <sigaction@plt>:
  401898:	ff 25 7a 28 20 00    	jmpq   *0x20287a(%rip)        # 604118 <_GLOBAL_OFFSET_TABLE_+0x130>
  40189e:	68 23 00 00 00       	pushq  $0x23
  4018a3:	e9 b0 fd ff ff       	jmpq   401658 <_init+0x18>

00000000004018a8 <pthread_exit@plt>:
  4018a8:	ff 25 72 28 20 00    	jmpq   *0x202872(%rip)        # 604120 <_GLOBAL_OFFSET_TABLE_+0x138>
  4018ae:	68 24 00 00 00       	pushq  $0x24
  4018b3:	e9 a0 fd ff ff       	jmpq   401658 <_init+0x18>

00000000004018b8 <fputs@plt>:
  4018b8:	ff 25 6a 28 20 00    	jmpq   *0x20286a(%rip)        # 604128 <_GLOBAL_OFFSET_TABLE_+0x140>
  4018be:	68 25 00 00 00       	pushq  $0x25
  4018c3:	e9 90 fd ff ff       	jmpq   401658 <_init+0x18>

00000000004018c8 <lseek@plt>:
  4018c8:	ff 25 62 28 20 00    	jmpq   *0x202862(%rip)        # 604130 <_GLOBAL_OFFSET_TABLE_+0x148>
  4018ce:	68 26 00 00 00       	pushq  $0x26
  4018d3:	e9 80 fd ff ff       	jmpq   401658 <_init+0x18>

00000000004018d8 <strtol@plt>:
  4018d8:	ff 25 5a 28 20 00    	jmpq   *0x20285a(%rip)        # 604138 <_GLOBAL_OFFSET_TABLE_+0x150>
  4018de:	68 27 00 00 00       	pushq  $0x27
  4018e3:	e9 70 fd ff ff       	jmpq   401658 <_init+0x18>

00000000004018e8 <connect@plt>:
  4018e8:	ff 25 52 28 20 00    	jmpq   *0x202852(%rip)        # 604140 <_GLOBAL_OFFSET_TABLE_+0x158>
  4018ee:	68 28 00 00 00       	pushq  $0x28
  4018f3:	e9 60 fd ff ff       	jmpq   401658 <_init+0x18>

00000000004018f8 <execve@plt>:
  4018f8:	ff 25 4a 28 20 00    	jmpq   *0x20284a(%rip)        # 604148 <_GLOBAL_OFFSET_TABLE_+0x160>
  4018fe:	68 29 00 00 00       	pushq  $0x29
  401903:	e9 50 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401908 <memcpy@plt>:
  401908:	ff 25 42 28 20 00    	jmpq   *0x202842(%rip)        # 604150 <_GLOBAL_OFFSET_TABLE_+0x168>
  40190e:	68 2a 00 00 00       	pushq  $0x2a
  401913:	e9 40 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401918 <waitpid@plt>:
  401918:	ff 25 3a 28 20 00    	jmpq   *0x20283a(%rip)        # 604158 <_GLOBAL_OFFSET_TABLE_+0x170>
  40191e:	68 2b 00 00 00       	pushq  $0x2b
  401923:	e9 30 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401928 <socket@plt>:
  401928:	ff 25 32 28 20 00    	jmpq   *0x202832(%rip)        # 604160 <_GLOBAL_OFFSET_TABLE_+0x178>
  40192e:	68 2c 00 00 00       	pushq  $0x2c
  401933:	e9 20 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401938 <fread@plt>:
  401938:	ff 25 2a 28 20 00    	jmpq   *0x20282a(%rip)        # 604168 <_GLOBAL_OFFSET_TABLE_+0x180>
  40193e:	68 2d 00 00 00       	pushq  $0x2d
  401943:	e9 10 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401948 <__fxstat@plt>:
  401948:	ff 25 22 28 20 00    	jmpq   *0x202822(%rip)        # 604170 <_GLOBAL_OFFSET_TABLE_+0x188>
  40194e:	68 2e 00 00 00       	pushq  $0x2e
  401953:	e9 00 fd ff ff       	jmpq   401658 <_init+0x18>

0000000000401958 <alarm@plt>:
  401958:	ff 25 1a 28 20 00    	jmpq   *0x20281a(%rip)        # 604178 <_GLOBAL_OFFSET_TABLE_+0x190>
  40195e:	68 2f 00 00 00       	pushq  $0x2f
  401963:	e9 f0 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401968 <__errno_location@plt>:
  401968:	ff 25 12 28 20 00    	jmpq   *0x202812(%rip)        # 604180 <_GLOBAL_OFFSET_TABLE_+0x198>
  40196e:	68 30 00 00 00       	pushq  $0x30
  401973:	e9 e0 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401978 <sigaddset@plt>:
  401978:	ff 25 0a 28 20 00    	jmpq   *0x20280a(%rip)        # 604188 <_GLOBAL_OFFSET_TABLE_+0x1a0>
  40197e:	68 31 00 00 00       	pushq  $0x31
  401983:	e9 d0 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401988 <sem_init@plt>:
  401988:	ff 25 02 28 20 00    	jmpq   *0x202802(%rip)        # 604190 <_GLOBAL_OFFSET_TABLE_+0x1a8>
  40198e:	68 32 00 00 00       	pushq  $0x32
  401993:	e9 c0 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401998 <__stack_chk_fail@plt>:
  401998:	ff 25 fa 27 20 00    	jmpq   *0x2027fa(%rip)        # 604198 <_GLOBAL_OFFSET_TABLE_+0x1b0>
  40199e:	68 33 00 00 00       	pushq  $0x33
  4019a3:	e9 b0 fc ff ff       	jmpq   401658 <_init+0x18>

00000000004019a8 <sem_post@plt>:
  4019a8:	ff 25 f2 27 20 00    	jmpq   *0x2027f2(%rip)        # 6041a0 <_GLOBAL_OFFSET_TABLE_+0x1b8>
  4019ae:	68 34 00 00 00       	pushq  $0x34
  4019b3:	e9 a0 fc ff ff       	jmpq   401658 <_init+0x18>

00000000004019b8 <pthread_cancel@plt>:
  4019b8:	ff 25 ea 27 20 00    	jmpq   *0x2027ea(%rip)        # 6041a8 <_GLOBAL_OFFSET_TABLE_+0x1c0>
  4019be:	68 35 00 00 00       	pushq  $0x35
  4019c3:	e9 90 fc ff ff       	jmpq   401658 <_init+0x18>

00000000004019c8 <pthread_detach@plt>:
  4019c8:	ff 25 e2 27 20 00    	jmpq   *0x2027e2(%rip)        # 6041b0 <_GLOBAL_OFFSET_TABLE_+0x1c8>
  4019ce:	68 36 00 00 00       	pushq  $0x36
  4019d3:	e9 80 fc ff ff       	jmpq   401658 <_init+0x18>

00000000004019d8 <pthread_once@plt>:
  4019d8:	ff 25 da 27 20 00    	jmpq   *0x2027da(%rip)        # 6041b8 <_GLOBAL_OFFSET_TABLE_+0x1d0>
  4019de:	68 37 00 00 00       	pushq  $0x37
  4019e3:	e9 70 fc ff ff       	jmpq   401658 <_init+0x18>

00000000004019e8 <calloc@plt>:
  4019e8:	ff 25 d2 27 20 00    	jmpq   *0x2027d2(%rip)        # 6041c0 <_GLOBAL_OFFSET_TABLE_+0x1d8>
  4019ee:	68 38 00 00 00       	pushq  $0x38
  4019f3:	e9 60 fc ff ff       	jmpq   401658 <_init+0x18>

00000000004019f8 <munmap@plt>:
  4019f8:	ff 25 ca 27 20 00    	jmpq   *0x2027ca(%rip)        # 6041c8 <_GLOBAL_OFFSET_TABLE_+0x1e0>
  4019fe:	68 39 00 00 00       	pushq  $0x39
  401a03:	e9 50 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401a08 <fclose@plt>:
  401a08:	ff 25 c2 27 20 00    	jmpq   *0x2027c2(%rip)        # 6041d0 <_GLOBAL_OFFSET_TABLE_+0x1e8>
  401a0e:	68 3a 00 00 00       	pushq  $0x3a
  401a13:	e9 40 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401a18 <fork@plt>:
  401a18:	ff 25 ba 27 20 00    	jmpq   *0x2027ba(%rip)        # 6041d8 <_GLOBAL_OFFSET_TABLE_+0x1f0>
  401a1e:	68 3b 00 00 00       	pushq  $0x3b
  401a23:	e9 30 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401a28 <sigemptyset@plt>:
  401a28:	ff 25 b2 27 20 00    	jmpq   *0x2027b2(%rip)        # 6041e0 <_GLOBAL_OFFSET_TABLE_+0x1f8>
  401a2e:	68 3c 00 00 00       	pushq  $0x3c
  401a33:	e9 20 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401a38 <bind@plt>:
  401a38:	ff 25 aa 27 20 00    	jmpq   *0x2027aa(%rip)        # 6041e8 <_GLOBAL_OFFSET_TABLE_+0x200>
  401a3e:	68 3d 00 00 00       	pushq  $0x3d
  401a43:	e9 10 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401a48 <fwrite@plt>:
  401a48:	ff 25 a2 27 20 00    	jmpq   *0x2027a2(%rip)        # 6041f0 <_GLOBAL_OFFSET_TABLE_+0x208>
  401a4e:	68 3e 00 00 00       	pushq  $0x3e
  401a53:	e9 00 fc ff ff       	jmpq   401658 <_init+0x18>

0000000000401a58 <sigdelset@plt>:
  401a58:	ff 25 9a 27 20 00    	jmpq   *0x20279a(%rip)        # 6041f8 <_GLOBAL_OFFSET_TABLE_+0x210>
  401a5e:	68 3f 00 00 00       	pushq  $0x3f
  401a63:	e9 f0 fb ff ff       	jmpq   401658 <_init+0x18>

0000000000401a68 <realloc@plt>:
  401a68:	ff 25 92 27 20 00    	jmpq   *0x202792(%rip)        # 604200 <_GLOBAL_OFFSET_TABLE_+0x218>
  401a6e:	68 40 00 00 00       	pushq  $0x40
  401a73:	e9 e0 fb ff ff       	jmpq   401658 <_init+0x18>

0000000000401a78 <__memmove_chk@plt>:
  401a78:	ff 25 8a 27 20 00    	jmpq   *0x20278a(%rip)        # 604208 <_GLOBAL_OFFSET_TABLE_+0x220>
  401a7e:	68 41 00 00 00       	pushq  $0x41
  401a83:	e9 d0 fb ff ff       	jmpq   401658 <_init+0x18>

0000000000401a88 <write@plt>:
  401a88:	ff 25 82 27 20 00    	jmpq   *0x202782(%rip)        # 604210 <_GLOBAL_OFFSET_TABLE_+0x228>
  401a8e:	68 42 00 00 00       	pushq  $0x42
  401a93:	e9 c0 fb ff ff       	jmpq   401658 <_init+0x18>

0000000000401a98 <accept@plt>:
  401a98:	ff 25 7a 27 20 00    	jmpq   *0x20277a(%rip)        # 604218 <_GLOBAL_OFFSET_TABLE_+0x230>
  401a9e:	68 43 00 00 00       	pushq  $0x43
  401aa3:	e9 b0 fb ff ff       	jmpq   401658 <_init+0x18>

0000000000401aa8 <open@plt>:
  401aa8:	ff 25 72 27 20 00    	jmpq   *0x202772(%rip)        # 604220 <_GLOBAL_OFFSET_TABLE_+0x238>
  401aae:	68 44 00 00 00       	pushq  $0x44
  401ab3:	e9 a0 fb ff ff       	jmpq   401658 <_init+0x18>

0000000000401ab8 <mmap@plt>:
  401ab8:	ff 25 6a 27 20 00    	jmpq   *0x20276a(%rip)        # 604228 <_GLOBAL_OFFSET_TABLE_+0x240>
  401abe:	68 45 00 00 00       	pushq  $0x45
  401ac3:	e9 90 fb ff ff       	jmpq   401658 <_init+0x18>

Disassembly of section .text:

0000000000401ad0 <_start>:
  401ad0:	31 ed                	xor    %ebp,%ebp
  401ad2:	49 89 d1             	mov    %rdx,%r9
  401ad5:	5e                   	pop    %rsi
  401ad6:	48 89 e2             	mov    %rsp,%rdx
  401ad9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401add:	50                   	push   %rax
  401ade:	54                   	push   %rsp
  401adf:	49 c7 c0 20 2e 40 00 	mov    $0x402e20,%r8
  401ae6:	48 c7 c1 30 2e 40 00 	mov    $0x402e30,%rcx
  401aed:	48 c7 c7 00 1c 40 00 	mov    $0x401c00,%rdi
  401af4:	e8 6f fc ff ff       	callq  401768 <__libc_start_main@plt>
  401af9:	f4                   	hlt    
  401afa:	90                   	nop    
  401afb:	90                   	nop    

0000000000401afc <call_gmon_start>:
  401afc:	48 83 ec 08          	sub    $0x8,%rsp
  401b00:	48 8b 05 d9 24 20 00 	mov    0x2024d9(%rip),%rax        # 603fe0 <_DYNAMIC+0x1b0>
  401b07:	48 85 c0             	test   %rax,%rax
  401b0a:	74 02                	je     401b0e <call_gmon_start+0x12>
  401b0c:	ff d0                	callq  *%rax
  401b0e:	48 83 c4 08          	add    $0x8,%rsp
  401b12:	c3                   	retq   
  401b13:	90                   	nop    
  401b14:	90                   	nop    
  401b15:	90                   	nop    
  401b16:	90                   	nop    
  401b17:	90                   	nop    
  401b18:	90                   	nop    
  401b19:	90                   	nop    
  401b1a:	90                   	nop    
  401b1b:	90                   	nop    
  401b1c:	90                   	nop    
  401b1d:	90                   	nop    
  401b1e:	90                   	nop    
  401b1f:	90                   	nop    

0000000000401b20 <__do_global_dtors_aux>:
  401b20:	55                   	push   %rbp
  401b21:	48 89 e5             	mov    %rsp,%rbp
  401b24:	53                   	push   %rbx
  401b25:	48 83 ec 08          	sub    $0x8,%rsp
  401b29:	80 3d 18 27 20 00 00 	cmpb   $0x0,0x202718(%rip)        # 604248 <completed.6987>
  401b30:	75 4b                	jne    401b7d <__do_global_dtors_aux+0x5d>
  401b32:	b8 20 3e 60 00       	mov    $0x603e20,%eax
  401b37:	48 8b 15 12 27 20 00 	mov    0x202712(%rip),%rdx        # 604250 <dtor_idx.6989>
  401b3e:	48 2d 18 3e 60 00    	sub    $0x603e18,%rax
  401b44:	48 c1 f8 03          	sar    $0x3,%rax
  401b48:	48 8d 58 ff          	lea    -0x1(%rax),%rbx
  401b4c:	48 39 da             	cmp    %rbx,%rdx
  401b4f:	73 25                	jae    401b76 <__do_global_dtors_aux+0x56>
  401b51:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401b58:	48 8d 42 01          	lea    0x1(%rdx),%rax
  401b5c:	48 89 05 ed 26 20 00 	mov    %rax,0x2026ed(%rip)        # 604250 <dtor_idx.6989>
  401b63:	ff 14 c5 18 3e 60 00 	callq  *0x603e18(,%rax,8)
  401b6a:	48 8b 15 df 26 20 00 	mov    0x2026df(%rip),%rdx        # 604250 <dtor_idx.6989>
  401b71:	48 39 da             	cmp    %rbx,%rdx
  401b74:	72 e2                	jb     401b58 <__do_global_dtors_aux+0x38>
  401b76:	c6 05 cb 26 20 00 01 	movb   $0x1,0x2026cb(%rip)        # 604248 <completed.6987>
  401b7d:	48 83 c4 08          	add    $0x8,%rsp
  401b81:	5b                   	pop    %rbx
  401b82:	c9                   	leaveq 
  401b83:	c3                   	retq   
  401b84:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  401b8b:	00 00 00 00 00 

0000000000401b90 <frame_dummy>:
  401b90:	55                   	push   %rbp
  401b91:	48 83 3d 8f 22 20 00 	cmpq   $0x0,0x20228f(%rip)        # 603e28 <__JCR_END__>
  401b98:	00 
  401b99:	48 89 e5             	mov    %rsp,%rbp
  401b9c:	74 1a                	je     401bb8 <frame_dummy+0x28>
  401b9e:	b8 00 00 00 00       	mov    $0x0,%eax
  401ba3:	48 85 c0             	test   %rax,%rax
  401ba6:	74 10                	je     401bb8 <frame_dummy+0x28>
  401ba8:	bf 28 3e 60 00       	mov    $0x603e28,%edi
  401bad:	49 89 c3             	mov    %rax,%r11
  401bb0:	c9                   	leaveq 
  401bb1:	41 ff e3             	jmpq   *%r11
  401bb4:	0f 1f 40 00          	nopl   0x0(%rax)
  401bb8:	c9                   	leaveq 
  401bb9:	c3                   	retq   
  401bba:	90                   	nop    
  401bbb:	90                   	nop    
  401bbc:	90                   	nop    
  401bbd:	90                   	nop    
  401bbe:	90                   	nop    
  401bbf:	90                   	nop    

0000000000401bc0 <thread>:
  401bc0:	48 63 37             	movslq (%rdi),%rsi
  401bc3:	48 8b 15 96 27 20 00 	mov    0x202796(%rip),%rdx        # 604360 <nelems_per_thread>
  401bca:	48 89 f0             	mov    %rsi,%rax
  401bcd:	48 0f af c2          	imul   %rdx,%rax
  401bd1:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
  401bd5:	31 d2                	xor    %edx,%edx
  401bd7:	48 39 c8             	cmp    %rcx,%rax
  401bda:	7d 10                	jge    401bec <thread+0x2c>
  401bdc:	0f 1f 40 00          	nopl   0x0(%rax)
  401be0:	48 01 c2             	add    %rax,%rdx
  401be3:	48 83 c0 01          	add    $0x1,%rax
  401be7:	48 39 c1             	cmp    %rax,%rcx
  401bea:	7f f4                	jg     401be0 <thread+0x20>
  401bec:	48 89 14 f5 60 42 60 	mov    %rdx,0x604260(,%rsi,8)
  401bf3:	00 
  401bf4:	31 c0                	xor    %eax,%eax
  401bf6:	c3                   	retq   
  401bf7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  401bfe:	00 00 

0000000000401c00 <main>:
  401c00:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  401c05:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  401c0a:	48 89 f3             	mov    %rsi,%rbx
  401c0d:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  401c12:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  401c17:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  401c1c:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  401c21:	48 81 ec b8 01 00 00 	sub    $0x1b8,%rsp
  401c28:	83 ff 03             	cmp    $0x3,%edi
  401c2b:	75 49                	jne    401c76 <main+0x76>
  401c2d:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  401c31:	ba 0a 00 00 00       	mov    $0xa,%edx
  401c36:	31 f6                	xor    %esi,%esi
  401c38:	e8 9b fc ff ff       	callq  4018d8 <strtol@plt>
  401c3d:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  401c41:	ba 0a 00 00 00       	mov    $0xa,%edx
  401c46:	31 f6                	xor    %esi,%esi
  401c48:	48 63 e8             	movslq %eax,%rbp
  401c4b:	e8 88 fc ff ff       	callq  4018d8 <strtol@plt>
  401c50:	4c 63 e8             	movslq %eax,%r13
  401c53:	4c 89 ea             	mov    %r13,%rdx
  401c56:	4c 89 e8             	mov    %r13,%rax
  401c59:	48 c1 fa 3f          	sar    $0x3f,%rdx
  401c5d:	48 f7 fd             	idiv   %rbp
  401c60:	48 85 d2             	test   %rdx,%rdx
  401c63:	74 2c                	je     401c91 <main+0x91>
  401c65:	bf 30 2f 40 00       	mov    $0x402f30,%edi
  401c6a:	e8 89 fa ff ff       	callq  4016f8 <puts@plt>
  401c6f:	31 ff                	xor    %edi,%edi
  401c71:	e8 a2 fa ff ff       	callq  401718 <exit@plt>
  401c76:	48 8b 16             	mov    (%rsi),%rdx
  401c79:	bf 01 00 00 00       	mov    $0x1,%edi
  401c7e:	be 10 2f 40 00       	mov    $0x402f10,%esi
  401c83:	31 c0                	xor    %eax,%eax
  401c85:	e8 9e fa ff ff       	callq  401728 <__printf_chk@plt>
  401c8a:	31 ff                	xor    %edi,%edi
  401c8c:	e8 87 fa ff ff       	callq  401718 <exit@plt>
  401c91:	31 c9                	xor    %ecx,%ecx
  401c93:	48 85 ed             	test   %rbp,%rbp
  401c96:	48 89 05 c3 26 20 00 	mov    %rax,0x2026c3(%rip)        # 604360 <nelems_per_thread>
  401c9d:	7e 72                	jle    401d11 <main+0x111>
  401c9f:	4c 8d a4 24 00 01 00 	lea    0x100(%rsp),%r12
  401ca6:	00 
  401ca7:	49 89 e7             	mov    %rsp,%r15
  401caa:	49 89 e6             	mov    %rsp,%r14
  401cad:	31 db                	xor    %ebx,%ebx
  401caf:	90                   	nop    
  401cb0:	41 89 1c 24          	mov    %ebx,(%r12)
  401cb4:	4c 89 e1             	mov    %r12,%rcx
  401cb7:	31 f6                	xor    %esi,%esi
  401cb9:	4c 89 f7             	mov    %r14,%rdi
  401cbc:	ba c0 1b 40 00       	mov    $0x401bc0,%edx
  401cc1:	48 83 c3 01          	add    $0x1,%rbx
  401cc5:	e8 06 06 00 00       	callq  4022d0 <Pthread_create>
  401cca:	49 83 c4 04          	add    $0x4,%r12
  401cce:	49 83 c6 08          	add    $0x8,%r14
  401cd2:	48 39 dd             	cmp    %rbx,%rbp
  401cd5:	7f d9                	jg     401cb0 <main+0xb0>
  401cd7:	31 db                	xor    %ebx,%ebx
  401cd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401ce0:	49 8b 3c df          	mov    (%r15,%rbx,8),%rdi
  401ce4:	31 f6                	xor    %esi,%esi
  401ce6:	48 83 c3 01          	add    $0x1,%rbx
  401cea:	e8 81 05 00 00       	callq  402270 <Pthread_join>
  401cef:	48 39 dd             	cmp    %rbx,%rbp
  401cf2:	7f ec                	jg     401ce0 <main+0xe0>
  401cf4:	31 c9                	xor    %ecx,%ecx
  401cf6:	31 c0                	xor    %eax,%eax
  401cf8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401cff:	00 
  401d00:	48 03 0c c5 60 42 60 	add    0x604260(,%rax,8),%rcx
  401d07:	00 
  401d08:	48 83 c0 01          	add    $0x1,%rax
  401d0c:	48 39 c5             	cmp    %rax,%rbp
  401d0f:	7f ef                	jg     401d00 <main+0x100>
  401d11:	49 8d 55 ff          	lea    -0x1(%r13),%rdx
  401d15:	49 0f af d5          	imul   %r13,%rdx
  401d19:	48 89 d0             	mov    %rdx,%rax
  401d1c:	48 c1 e8 3f          	shr    $0x3f,%rax
  401d20:	48 01 d0             	add    %rdx,%rax
  401d23:	48 d1 f8             	sar    %rax
  401d26:	48 39 c8             	cmp    %rcx,%rax
  401d29:	74 14                	je     401d3f <main+0x13f>
  401d2b:	48 89 ca             	mov    %rcx,%rdx
  401d2e:	be 60 2f 40 00       	mov    $0x402f60,%esi
  401d33:	bf 01 00 00 00       	mov    $0x1,%edi
  401d38:	31 c0                	xor    %eax,%eax
  401d3a:	e8 e9 f9 ff ff       	callq  401728 <__printf_chk@plt>
  401d3f:	31 ff                	xor    %edi,%edi
  401d41:	e8 d2 f9 ff ff       	callq  401718 <exit@plt>
  401d46:	90                   	nop    
  401d47:	90                   	nop    
  401d48:	90                   	nop    
  401d49:	90                   	nop    
  401d4a:	90                   	nop    
  401d4b:	90                   	nop    
  401d4c:	90                   	nop    
  401d4d:	90                   	nop    
  401d4e:	90                   	nop    
  401d4f:	90                   	nop    

0000000000401d50 <rio_readinitb>:
  401d50:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401d54:	89 37                	mov    %esi,(%rdi)
  401d56:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401d5d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401d61:	c3                   	retq   
  401d62:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  401d69:	1f 84 00 00 00 00 00 

0000000000401d70 <Rio_readinitb>:
  401d70:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401d74:	89 37                	mov    %esi,(%rdi)
  401d76:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401d7d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401d81:	c3                   	retq   
  401d82:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  401d89:	1f 84 00 00 00 00 00 

0000000000401d90 <rio_readn>:
  401d90:	41 55                	push   %r13
  401d92:	31 c0                	xor    %eax,%eax
  401d94:	49 89 d5             	mov    %rdx,%r13
  401d97:	41 54                	push   %r12
  401d99:	41 89 fc             	mov    %edi,%r12d
  401d9c:	55                   	push   %rbp
  401d9d:	48 89 f5             	mov    %rsi,%rbp
  401da0:	53                   	push   %rbx
  401da1:	48 89 d3             	mov    %rdx,%rbx
  401da4:	48 83 ec 08          	sub    $0x8,%rsp
  401da8:	48 85 d2             	test   %rdx,%rdx
  401dab:	75 0b                	jne    401db8 <rio_readn+0x28>
  401dad:	eb 25                	jmp    401dd4 <rio_readn+0x44>
  401daf:	90                   	nop    
  401db0:	48 29 c3             	sub    %rax,%rbx
  401db3:	74 2b                	je     401de0 <rio_readn+0x50>
  401db5:	48 01 c5             	add    %rax,%rbp
  401db8:	48 89 da             	mov    %rbx,%rdx
  401dbb:	48 89 ee             	mov    %rbp,%rsi
  401dbe:	44 89 e7             	mov    %r12d,%edi
  401dc1:	e8 72 f9 ff ff       	callq  401738 <read@plt>
  401dc6:	48 83 f8 00          	cmp    $0x0,%rax
  401dca:	7c 22                	jl     401dee <rio_readn+0x5e>
  401dcc:	75 e2                	jne    401db0 <rio_readn+0x20>
  401dce:	4c 89 e8             	mov    %r13,%rax
  401dd1:	48 29 d8             	sub    %rbx,%rax
  401dd4:	48 83 c4 08          	add    $0x8,%rsp
  401dd8:	5b                   	pop    %rbx
  401dd9:	5d                   	pop    %rbp
  401dda:	41 5c                	pop    %r12
  401ddc:	41 5d                	pop    %r13
  401dde:	c3                   	retq   
  401ddf:	90                   	nop    
  401de0:	48 83 c4 08          	add    $0x8,%rsp
  401de4:	4c 89 e8             	mov    %r13,%rax
  401de7:	5b                   	pop    %rbx
  401de8:	5d                   	pop    %rbp
  401de9:	41 5c                	pop    %r12
  401deb:	41 5d                	pop    %r13
  401ded:	c3                   	retq   
  401dee:	e8 75 fb ff ff       	callq  401968 <__errno_location@plt>
  401df3:	83 38 04             	cmpl   $0x4,(%rax)
  401df6:	75 0a                	jne    401e02 <rio_readn+0x72>
  401df8:	31 c0                	xor    %eax,%eax
  401dfa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401e00:	eb ae                	jmp    401db0 <rio_readn+0x20>
  401e02:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401e09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401e10:	eb c2                	jmp    401dd4 <rio_readn+0x44>
  401e12:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  401e19:	1f 84 00 00 00 00 00 

0000000000401e20 <rio_read>:
  401e20:	41 56                	push   %r14
  401e22:	49 89 f6             	mov    %rsi,%r14
  401e25:	41 55                	push   %r13
  401e27:	49 89 d5             	mov    %rdx,%r13
  401e2a:	41 54                	push   %r12
  401e2c:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  401e30:	55                   	push   %rbp
  401e31:	53                   	push   %rbx
  401e32:	48 89 fb             	mov    %rdi,%rbx
  401e35:	eb 26                	jmp    401e5d <rio_read+0x3d>
  401e37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  401e3e:	00 00 
  401e40:	8b 3b                	mov    (%rbx),%edi
  401e42:	ba 00 20 00 00       	mov    $0x2000,%edx
  401e47:	4c 89 e6             	mov    %r12,%rsi
  401e4a:	e8 e9 f8 ff ff       	callq  401738 <read@plt>
  401e4f:	83 f8 00             	cmp    $0x0,%eax
  401e52:	89 43 04             	mov    %eax,0x4(%rbx)
  401e55:	7c 54                	jl     401eab <rio_read+0x8b>
  401e57:	74 47                	je     401ea0 <rio_read+0x80>
  401e59:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  401e5d:	8b 6b 04             	mov    0x4(%rbx),%ebp
  401e60:	85 ed                	test   %ebp,%ebp
  401e62:	7e dc                	jle    401e40 <rio_read+0x20>
  401e64:	4c 63 e5             	movslq %ebp,%r12
  401e67:	4d 39 e5             	cmp    %r12,%r13
  401e6a:	76 24                	jbe    401e90 <rio_read+0x70>
  401e6c:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  401e70:	4c 89 e2             	mov    %r12,%rdx
  401e73:	4c 89 f7             	mov    %r14,%rdi
  401e76:	e8 8d fa ff ff       	callq  401908 <memcpy@plt>
  401e7b:	4c 01 63 08          	add    %r12,0x8(%rbx)
  401e7f:	29 6b 04             	sub    %ebp,0x4(%rbx)
  401e82:	4c 89 e0             	mov    %r12,%rax
  401e85:	5b                   	pop    %rbx
  401e86:	5d                   	pop    %rbp
  401e87:	41 5c                	pop    %r12
  401e89:	41 5d                	pop    %r13
  401e8b:	41 5e                	pop    %r14
  401e8d:	c3                   	retq   
  401e8e:	66 90                	xchg   %ax,%ax
  401e90:	44 89 ed             	mov    %r13d,%ebp
  401e93:	4d 63 e5             	movslq %r13d,%r12
  401e96:	eb d4                	jmp    401e6c <rio_read+0x4c>
  401e98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401e9f:	00 
  401ea0:	5b                   	pop    %rbx
  401ea1:	5d                   	pop    %rbp
  401ea2:	41 5c                	pop    %r12
  401ea4:	41 5d                	pop    %r13
  401ea6:	31 c0                	xor    %eax,%eax
  401ea8:	41 5e                	pop    %r14
  401eaa:	c3                   	retq   
  401eab:	e8 b8 fa ff ff       	callq  401968 <__errno_location@plt>
  401eb0:	83 38 04             	cmpl   $0x4,(%rax)
  401eb3:	74 a8                	je     401e5d <rio_read+0x3d>
  401eb5:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401ebc:	0f 1f 40 00          	nopl   0x0(%rax)
  401ec0:	eb c3                	jmp    401e85 <rio_read+0x65>
  401ec2:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  401ec9:	1f 84 00 00 00 00 00 

0000000000401ed0 <rio_readlineb>:
  401ed0:	41 57                	push   %r15
  401ed2:	41 56                	push   %r14
  401ed4:	49 89 fe             	mov    %rdi,%r14
  401ed7:	41 55                	push   %r13
  401ed9:	49 89 d5             	mov    %rdx,%r13
  401edc:	ba 01 00 00 00       	mov    $0x1,%edx
  401ee1:	41 54                	push   %r12
  401ee3:	55                   	push   %rbp
  401ee4:	48 89 f5             	mov    %rsi,%rbp
  401ee7:	53                   	push   %rbx
  401ee8:	48 83 ec 18          	sub    $0x18,%rsp
  401eec:	49 83 fd 01          	cmp    $0x1,%r13
  401ef0:	76 71                	jbe    401f63 <rio_readlineb+0x93>
  401ef2:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  401ef8:	31 db                	xor    %ebx,%ebx
  401efa:	4c 8d 7c 24 17       	lea    0x17(%rsp),%r15
  401eff:	eb 2b                	jmp    401f2c <rio_readlineb+0x5c>
  401f01:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401f08:	0f b6 44 24 17       	movzbl 0x17(%rsp),%eax
  401f0d:	88 45 00             	mov    %al,0x0(%rbp)
  401f10:	48 83 c5 01          	add    $0x1,%rbp
  401f14:	80 7c 24 17 0a       	cmpb   $0xa,0x17(%rsp)
  401f19:	74 45                	je     401f60 <rio_readlineb+0x90>
  401f1b:	48 83 c3 01          	add    $0x1,%rbx
  401f1f:	41 83 c4 01          	add    $0x1,%r12d
  401f23:	48 8d 43 01          	lea    0x1(%rbx),%rax
  401f27:	49 39 c5             	cmp    %rax,%r13
  401f2a:	76 34                	jbe    401f60 <rio_readlineb+0x90>
  401f2c:	ba 01 00 00 00       	mov    $0x1,%edx
  401f31:	4c 89 fe             	mov    %r15,%rsi
  401f34:	4c 89 f7             	mov    %r14,%rdi
  401f37:	e8 e4 fe ff ff       	callq  401e20 <rio_read>
  401f3c:	83 f8 01             	cmp    $0x1,%eax
  401f3f:	74 c7                	je     401f08 <rio_readlineb+0x38>
  401f41:	85 c0                	test   %eax,%eax
  401f43:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401f4a:	75 1b                	jne    401f67 <rio_readlineb+0x97>
  401f4c:	49 63 d4             	movslq %r12d,%rdx
  401f4f:	41 83 ec 01          	sub    $0x1,%r12d
  401f53:	75 0e                	jne    401f63 <rio_readlineb+0x93>
  401f55:	31 d2                	xor    %edx,%edx
  401f57:	eb 0e                	jmp    401f67 <rio_readlineb+0x97>
  401f59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401f60:	49 63 d4             	movslq %r12d,%rdx
  401f63:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  401f67:	48 83 c4 18          	add    $0x18,%rsp
  401f6b:	48 89 d0             	mov    %rdx,%rax
  401f6e:	5b                   	pop    %rbx
  401f6f:	5d                   	pop    %rbp
  401f70:	41 5c                	pop    %r12
  401f72:	41 5d                	pop    %r13
  401f74:	41 5e                	pop    %r14
  401f76:	41 5f                	pop    %r15
  401f78:	c3                   	retq   
  401f79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401f80 <rio_readnb>:
  401f80:	41 55                	push   %r13
  401f82:	31 c0                	xor    %eax,%eax
  401f84:	49 89 d5             	mov    %rdx,%r13
  401f87:	41 54                	push   %r12
  401f89:	49 89 fc             	mov    %rdi,%r12
  401f8c:	55                   	push   %rbp
  401f8d:	48 89 f5             	mov    %rsi,%rbp
  401f90:	53                   	push   %rbx
  401f91:	48 89 d3             	mov    %rdx,%rbx
  401f94:	48 83 ec 08          	sub    $0x8,%rsp
  401f98:	48 85 d2             	test   %rdx,%rdx
  401f9b:	75 0b                	jne    401fa8 <rio_readnb+0x28>
  401f9d:	eb 25                	jmp    401fc4 <rio_readnb+0x44>
  401f9f:	90                   	nop    
  401fa0:	48 29 c3             	sub    %rax,%rbx
  401fa3:	74 2b                	je     401fd0 <rio_readnb+0x50>
  401fa5:	48 01 c5             	add    %rax,%rbp
  401fa8:	48 89 da             	mov    %rbx,%rdx
  401fab:	48 89 ee             	mov    %rbp,%rsi
  401fae:	4c 89 e7             	mov    %r12,%rdi
  401fb1:	e8 6a fe ff ff       	callq  401e20 <rio_read>
  401fb6:	48 83 f8 00          	cmp    $0x0,%rax
  401fba:	7c 22                	jl     401fde <rio_readnb+0x5e>
  401fbc:	75 e2                	jne    401fa0 <rio_readnb+0x20>
  401fbe:	4c 89 e8             	mov    %r13,%rax
  401fc1:	48 29 d8             	sub    %rbx,%rax
  401fc4:	48 83 c4 08          	add    $0x8,%rsp
  401fc8:	5b                   	pop    %rbx
  401fc9:	5d                   	pop    %rbp
  401fca:	41 5c                	pop    %r12
  401fcc:	41 5d                	pop    %r13
  401fce:	c3                   	retq   
  401fcf:	90                   	nop    
  401fd0:	48 83 c4 08          	add    $0x8,%rsp
  401fd4:	4c 89 e8             	mov    %r13,%rax
  401fd7:	5b                   	pop    %rbx
  401fd8:	5d                   	pop    %rbp
  401fd9:	41 5c                	pop    %r12
  401fdb:	41 5d                	pop    %r13
  401fdd:	c3                   	retq   
  401fde:	e8 85 f9 ff ff       	callq  401968 <__errno_location@plt>
  401fe3:	83 38 04             	cmpl   $0x4,(%rax)
  401fe6:	75 0a                	jne    401ff2 <rio_readnb+0x72>
  401fe8:	31 c0                	xor    %eax,%eax
  401fea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401ff0:	eb ae                	jmp    401fa0 <rio_readnb+0x20>
  401ff2:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401ff9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402000:	eb c2                	jmp    401fc4 <rio_readnb+0x44>
  402002:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  402009:	1f 84 00 00 00 00 00 

0000000000402010 <rio_writen>:
  402010:	41 55                	push   %r13
  402012:	49 89 d5             	mov    %rdx,%r13
  402015:	41 54                	push   %r12
  402017:	41 89 fc             	mov    %edi,%r12d
  40201a:	55                   	push   %rbp
  40201b:	53                   	push   %rbx
  40201c:	48 83 ec 08          	sub    $0x8,%rsp
  402020:	48 85 d2             	test   %rdx,%rdx
  402023:	74 26                	je     40204b <rio_writen+0x3b>
  402025:	48 89 f5             	mov    %rsi,%rbp
  402028:	48 89 d3             	mov    %rdx,%rbx
  40202b:	eb 06                	jmp    402033 <rio_writen+0x23>
  40202d:	0f 1f 00             	nopl   (%rax)
  402030:	48 01 c5             	add    %rax,%rbp
  402033:	48 89 da             	mov    %rbx,%rdx
  402036:	48 89 ee             	mov    %rbp,%rsi
  402039:	44 89 e7             	mov    %r12d,%edi
  40203c:	e8 47 fa ff ff       	callq  401a88 <write@plt>
  402041:	48 85 c0             	test   %rax,%rax
  402044:	7e 13                	jle    402059 <rio_writen+0x49>
  402046:	48 29 c3             	sub    %rax,%rbx
  402049:	75 e5                	jne    402030 <rio_writen+0x20>
  40204b:	4c 89 e8             	mov    %r13,%rax
  40204e:	48 83 c4 08          	add    $0x8,%rsp
  402052:	5b                   	pop    %rbx
  402053:	5d                   	pop    %rbp
  402054:	41 5c                	pop    %r12
  402056:	41 5d                	pop    %r13
  402058:	c3                   	retq   
  402059:	e8 0a f9 ff ff       	callq  401968 <__errno_location@plt>
  40205e:	83 38 04             	cmpl   $0x4,(%rax)
  402061:	75 07                	jne    40206a <rio_writen+0x5a>
  402063:	31 c0                	xor    %eax,%eax
  402065:	0f 1f 00             	nopl   (%rax)
  402068:	eb dc                	jmp    402046 <rio_writen+0x36>
  40206a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402071:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402078:	eb d4                	jmp    40204e <rio_writen+0x3e>
  40207a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000402080 <Pthread_once>:
  402080:	e9 53 f9 ff ff       	jmpq   4019d8 <pthread_once@plt>
  402085:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  40208c:	00 00 00 00 

0000000000402090 <Pthread_self>:
  402090:	e9 b3 f7 ff ff       	jmpq   401848 <pthread_self@plt>
  402095:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  40209c:	00 00 00 00 

00000000004020a0 <Pthread_exit>:
  4020a0:	48 83 ec 08          	sub    $0x8,%rsp
  4020a4:	e8 ff f7 ff ff       	callq  4018a8 <pthread_exit@plt>
  4020a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004020b0 <Free>:
  4020b0:	e9 13 f7 ff ff       	jmpq   4017c8 <free@plt>
  4020b5:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  4020bc:	00 00 00 00 

00000000004020c0 <Getpgrp>:
  4020c0:	e9 03 f6 ff ff       	jmpq   4016c8 <getpgrp@plt>
  4020c5:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  4020cc:	00 00 00 00 

00000000004020d0 <Alarm>:
  4020d0:	e9 83 f8 ff ff       	jmpq   401958 <alarm@plt>
  4020d5:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  4020dc:	00 00 00 00 

00000000004020e0 <Sleep>:
  4020e0:	e9 53 f7 ff ff       	jmpq   401838 <sleep@plt>
  4020e5:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  4020ec:	00 00 00 00 

00000000004020f0 <Pause>:
  4020f0:	e9 93 f5 ff ff       	jmpq   401688 <pause@plt>
  4020f5:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  4020fc:	00 00 00 00 

0000000000402100 <app_error>:
  402100:	48 83 ec 08          	sub    $0x8,%rsp
  402104:	48 89 f9             	mov    %rdi,%rcx
  402107:	48 8b 3d 32 21 20 00 	mov    0x202132(%rip),%rdi        # 604240 <__bss_start>
  40210e:	ba bd 2f 40 00       	mov    $0x402fbd,%edx
  402113:	be 01 00 00 00       	mov    $0x1,%esi
  402118:	31 c0                	xor    %eax,%eax
  40211a:	e8 b9 f5 ff ff       	callq  4016d8 <__fprintf_chk@plt>
  40211f:	31 ff                	xor    %edi,%edi
  402121:	e8 f2 f5 ff ff       	callq  401718 <exit@plt>
  402126:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40212d:	00 00 00 

0000000000402130 <Fgets>:
  402130:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  402135:	48 89 6c 24 f8       	mov    %rbp,-0x8(%rsp)
  40213a:	48 83 ec 18          	sub    $0x18,%rsp
  40213e:	48 89 d5             	mov    %rdx,%rbp
  402141:	e8 72 f6 ff ff       	callq  4017b8 <fgets@plt>
  402146:	48 85 c0             	test   %rax,%rax
  402149:	48 89 c3             	mov    %rax,%rbx
  40214c:	74 12                	je     402160 <Fgets+0x30>
  40214e:	48 89 d8             	mov    %rbx,%rax
  402151:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402156:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40215b:	48 83 c4 18          	add    $0x18,%rsp
  40215f:	c3                   	retq   
  402160:	48 89 ef             	mov    %rbp,%rdi
  402163:	e8 70 f6 ff ff       	callq  4017d8 <ferror@plt>
  402168:	85 c0                	test   %eax,%eax
  40216a:	74 e2                	je     40214e <Fgets+0x1e>
  40216c:	bf 73 2f 40 00       	mov    $0x402f73,%edi
  402171:	e8 8a ff ff ff       	callq  402100 <app_error>
  402176:	eb d6                	jmp    40214e <Fgets+0x1e>
  402178:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40217f:	00 

0000000000402180 <dns_error>:
  402180:	53                   	push   %rbx
  402181:	48 89 fb             	mov    %rdi,%rbx
  402184:	e8 2f f5 ff ff       	callq  4016b8 <__h_errno_location@plt>
  402189:	48 8b 3d b0 20 20 00 	mov    0x2020b0(%rip),%rdi        # 604240 <__bss_start>
  402190:	44 8b 00             	mov    (%rax),%r8d
  402193:	48 89 d9             	mov    %rbx,%rcx
  402196:	ba 7f 2f 40 00       	mov    $0x402f7f,%edx
  40219b:	be 01 00 00 00       	mov    $0x1,%esi
  4021a0:	31 c0                	xor    %eax,%eax
  4021a2:	e8 31 f5 ff ff       	callq  4016d8 <__fprintf_chk@plt>
  4021a7:	31 ff                	xor    %edi,%edi
  4021a9:	e8 6a f5 ff ff       	callq  401718 <exit@plt>
  4021ae:	66 90                	xchg   %ax,%ax

00000000004021b0 <Gethostbyaddr>:
  4021b0:	53                   	push   %rbx
  4021b1:	e8 52 f6 ff ff       	callq  401808 <gethostbyaddr@plt>
  4021b6:	48 85 c0             	test   %rax,%rax
  4021b9:	48 89 c3             	mov    %rax,%rbx
  4021bc:	74 0a                	je     4021c8 <Gethostbyaddr+0x18>
  4021be:	48 89 d8             	mov    %rbx,%rax
  4021c1:	5b                   	pop    %rbx
  4021c2:	c3                   	retq   
  4021c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4021c8:	bf 91 2f 40 00       	mov    $0x402f91,%edi
  4021cd:	e8 ae ff ff ff       	callq  402180 <dns_error>
  4021d2:	eb ea                	jmp    4021be <Gethostbyaddr+0xe>
  4021d4:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  4021db:	00 00 00 00 00 

00000000004021e0 <Gethostbyname>:
  4021e0:	53                   	push   %rbx
  4021e1:	e8 02 f5 ff ff       	callq  4016e8 <gethostbyname@plt>
  4021e6:	48 85 c0             	test   %rax,%rax
  4021e9:	48 89 c3             	mov    %rax,%rbx
  4021ec:	74 0a                	je     4021f8 <Gethostbyname+0x18>
  4021ee:	48 89 d8             	mov    %rbx,%rax
  4021f1:	5b                   	pop    %rbx
  4021f2:	c3                   	retq   
  4021f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4021f8:	bf a5 2f 40 00       	mov    $0x402fa5,%edi
  4021fd:	e8 7e ff ff ff       	callq  402180 <dns_error>
  402202:	eb ea                	jmp    4021ee <Gethostbyname+0xe>
  402204:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  40220b:	00 00 00 00 00 

0000000000402210 <posix_error>:
  402210:	53                   	push   %rbx
  402211:	48 89 f3             	mov    %rsi,%rbx
  402214:	e8 5f f6 ff ff       	callq  401878 <strerror@plt>
  402219:	48 8b 3d 20 20 20 00 	mov    0x202020(%rip),%rdi        # 604240 <__bss_start>
  402220:	49 89 c0             	mov    %rax,%r8
  402223:	48 89 d9             	mov    %rbx,%rcx
  402226:	ba b9 2f 40 00       	mov    $0x402fb9,%edx
  40222b:	be 01 00 00 00       	mov    $0x1,%esi
  402230:	31 c0                	xor    %eax,%eax
  402232:	e8 a1 f4 ff ff       	callq  4016d8 <__fprintf_chk@plt>
  402237:	31 ff                	xor    %edi,%edi
  402239:	e8 da f4 ff ff       	callq  401718 <exit@plt>
  40223e:	66 90                	xchg   %ax,%ax

0000000000402240 <Pthread_detach>:
  402240:	48 83 ec 08          	sub    $0x8,%rsp
  402244:	e8 7f f7 ff ff       	callq  4019c8 <pthread_detach@plt>
  402249:	85 c0                	test   %eax,%eax
  40224b:	75 0b                	jne    402258 <Pthread_detach+0x18>
  40224d:	48 83 c4 08          	add    $0x8,%rsp
  402251:	c3                   	retq   
  402252:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402258:	be c1 2f 40 00       	mov    $0x402fc1,%esi
  40225d:	89 c7                	mov    %eax,%edi
  40225f:	48 83 c4 08          	add    $0x8,%rsp
  402263:	e9 a8 ff ff ff       	jmpq   402210 <posix_error>
  402268:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40226f:	00 

0000000000402270 <Pthread_join>:
  402270:	48 83 ec 08          	sub    $0x8,%rsp
  402274:	e8 df f5 ff ff       	callq  401858 <pthread_join@plt>
  402279:	85 c0                	test   %eax,%eax
  40227b:	75 0b                	jne    402288 <Pthread_join+0x18>
  40227d:	48 83 c4 08          	add    $0x8,%rsp
  402281:	c3                   	retq   
  402282:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402288:	be d6 2f 40 00       	mov    $0x402fd6,%esi
  40228d:	89 c7                	mov    %eax,%edi
  40228f:	48 83 c4 08          	add    $0x8,%rsp
  402293:	e9 78 ff ff ff       	jmpq   402210 <posix_error>
  402298:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40229f:	00 

00000000004022a0 <Pthread_cancel>:
  4022a0:	48 83 ec 08          	sub    $0x8,%rsp
  4022a4:	e8 0f f7 ff ff       	callq  4019b8 <pthread_cancel@plt>
  4022a9:	85 c0                	test   %eax,%eax
  4022ab:	75 0b                	jne    4022b8 <Pthread_cancel+0x18>
  4022ad:	48 83 c4 08          	add    $0x8,%rsp
  4022b1:	c3                   	retq   
  4022b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4022b8:	be e9 2f 40 00       	mov    $0x402fe9,%esi
  4022bd:	89 c7                	mov    %eax,%edi
  4022bf:	48 83 c4 08          	add    $0x8,%rsp
  4022c3:	e9 48 ff ff ff       	jmpq   402210 <posix_error>
  4022c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4022cf:	00 

00000000004022d0 <Pthread_create>:
  4022d0:	48 83 ec 08          	sub    $0x8,%rsp
  4022d4:	e8 0f f5 ff ff       	callq  4017e8 <pthread_create@plt>
  4022d9:	85 c0                	test   %eax,%eax
  4022db:	75 0b                	jne    4022e8 <Pthread_create+0x18>
  4022dd:	48 83 c4 08          	add    $0x8,%rsp
  4022e1:	c3                   	retq   
  4022e2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4022e8:	be fe 2f 40 00       	mov    $0x402ffe,%esi
  4022ed:	89 c7                	mov    %eax,%edi
  4022ef:	48 83 c4 08          	add    $0x8,%rsp
  4022f3:	e9 18 ff ff ff       	jmpq   402210 <posix_error>
  4022f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4022ff:	00 

0000000000402300 <unix_error>:
  402300:	53                   	push   %rbx
  402301:	48 89 fb             	mov    %rdi,%rbx
  402304:	e8 5f f6 ff ff       	callq  401968 <__errno_location@plt>
  402309:	8b 38                	mov    (%rax),%edi
  40230b:	e8 68 f5 ff ff       	callq  401878 <strerror@plt>
  402310:	48 8b 3d 29 1f 20 00 	mov    0x201f29(%rip),%rdi        # 604240 <__bss_start>
  402317:	49 89 c0             	mov    %rax,%r8
  40231a:	48 89 d9             	mov    %rbx,%rcx
  40231d:	ba b9 2f 40 00       	mov    $0x402fb9,%edx
  402322:	be 01 00 00 00       	mov    $0x1,%esi
  402327:	31 c0                	xor    %eax,%eax
  402329:	e8 aa f3 ff ff       	callq  4016d8 <__fprintf_chk@plt>
  40232e:	31 ff                	xor    %edi,%edi
  402330:	e8 e3 f3 ff ff       	callq  401718 <exit@plt>
  402335:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  40233c:	00 00 00 00 

0000000000402340 <Rio_readlineb>:
  402340:	53                   	push   %rbx
  402341:	e8 8a fb ff ff       	callq  401ed0 <rio_readlineb>
  402346:	48 85 c0             	test   %rax,%rax
  402349:	48 89 c3             	mov    %rax,%rbx
  40234c:	78 0a                	js     402358 <Rio_readlineb+0x18>
  40234e:	48 89 d8             	mov    %rbx,%rax
  402351:	5b                   	pop    %rbx
  402352:	c3                   	retq   
  402353:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402358:	bf 13 30 40 00       	mov    $0x403013,%edi
  40235d:	e8 9e ff ff ff       	callq  402300 <unix_error>
  402362:	48 89 d8             	mov    %rbx,%rax
  402365:	5b                   	pop    %rbx
  402366:	c3                   	retq   
  402367:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40236e:	00 00 

0000000000402370 <Rio_readnb>:
  402370:	53                   	push   %rbx
  402371:	e8 0a fc ff ff       	callq  401f80 <rio_readnb>
  402376:	48 85 c0             	test   %rax,%rax
  402379:	48 89 c3             	mov    %rax,%rbx
  40237c:	78 0a                	js     402388 <Rio_readnb+0x18>
  40237e:	48 89 d8             	mov    %rbx,%rax
  402381:	5b                   	pop    %rbx
  402382:	c3                   	retq   
  402383:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402388:	bf 27 30 40 00       	mov    $0x403027,%edi
  40238d:	e8 6e ff ff ff       	callq  402300 <unix_error>
  402392:	48 89 d8             	mov    %rbx,%rax
  402395:	5b                   	pop    %rbx
  402396:	c3                   	retq   
  402397:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40239e:	00 00 

00000000004023a0 <Rio_writen>:
  4023a0:	53                   	push   %rbx
  4023a1:	48 89 d3             	mov    %rdx,%rbx
  4023a4:	e8 67 fc ff ff       	callq  402010 <rio_writen>
  4023a9:	48 39 d8             	cmp    %rbx,%rax
  4023ac:	74 12                	je     4023c0 <Rio_writen+0x20>
  4023ae:	5b                   	pop    %rbx
  4023af:	bf 38 30 40 00       	mov    $0x403038,%edi
  4023b4:	e9 47 ff ff ff       	jmpq   402300 <unix_error>
  4023b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4023c0:	5b                   	pop    %rbx
  4023c1:	c3                   	retq   
  4023c2:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  4023c9:	1f 84 00 00 00 00 00 

00000000004023d0 <Rio_readn>:
  4023d0:	53                   	push   %rbx
  4023d1:	e8 ba f9 ff ff       	callq  401d90 <rio_readn>
  4023d6:	48 85 c0             	test   %rax,%rax
  4023d9:	48 89 c3             	mov    %rax,%rbx
  4023dc:	78 0a                	js     4023e8 <Rio_readn+0x18>
  4023de:	48 89 d8             	mov    %rbx,%rax
  4023e1:	5b                   	pop    %rbx
  4023e2:	c3                   	retq   
  4023e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4023e8:	bf 49 30 40 00       	mov    $0x403049,%edi
  4023ed:	e8 0e ff ff ff       	callq  402300 <unix_error>
  4023f2:	48 89 d8             	mov    %rbx,%rax
  4023f5:	5b                   	pop    %rbx
  4023f6:	c3                   	retq   
  4023f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4023fe:	00 00 

0000000000402400 <V>:
  402400:	48 83 ec 08          	sub    $0x8,%rsp
  402404:	e8 9f f5 ff ff       	callq  4019a8 <sem_post@plt>
  402409:	85 c0                	test   %eax,%eax
  40240b:	78 0b                	js     402418 <V+0x18>
  40240d:	48 83 c4 08          	add    $0x8,%rsp
  402411:	c3                   	retq   
  402412:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402418:	bf 59 30 40 00       	mov    $0x403059,%edi
  40241d:	48 83 c4 08          	add    $0x8,%rsp
  402421:	e9 da fe ff ff       	jmpq   402300 <unix_error>
  402426:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40242d:	00 00 00 

0000000000402430 <P>:
  402430:	48 83 ec 08          	sub    $0x8,%rsp
  402434:	e8 2f f2 ff ff       	callq  401668 <sem_wait@plt>
  402439:	85 c0                	test   %eax,%eax
  40243b:	78 0b                	js     402448 <P+0x18>
  40243d:	48 83 c4 08          	add    $0x8,%rsp
  402441:	c3                   	retq   
  402442:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402448:	bf 61 30 40 00       	mov    $0x403061,%edi
  40244d:	48 83 c4 08          	add    $0x8,%rsp
  402451:	e9 aa fe ff ff       	jmpq   402300 <unix_error>
  402456:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40245d:	00 00 00 

0000000000402460 <Sem_init>:
  402460:	48 83 ec 08          	sub    $0x8,%rsp
  402464:	e8 1f f5 ff ff       	callq  401988 <sem_init@plt>
  402469:	85 c0                	test   %eax,%eax
  40246b:	78 0b                	js     402478 <Sem_init+0x18>
  40246d:	48 83 c4 08          	add    $0x8,%rsp
  402471:	c3                   	retq   
  402472:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402478:	bf 69 30 40 00       	mov    $0x403069,%edi
  40247d:	48 83 c4 08          	add    $0x8,%rsp
  402481:	e9 7a fe ff ff       	jmpq   402300 <unix_error>
  402486:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40248d:	00 00 00 

0000000000402490 <Connect>:
  402490:	48 83 ec 08          	sub    $0x8,%rsp
  402494:	e8 4f f4 ff ff       	callq  4018e8 <connect@plt>
  402499:	85 c0                	test   %eax,%eax
  40249b:	78 0b                	js     4024a8 <Connect+0x18>
  40249d:	48 83 c4 08          	add    $0x8,%rsp
  4024a1:	c3                   	retq   
  4024a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4024a8:	bf 78 30 40 00       	mov    $0x403078,%edi
  4024ad:	48 83 c4 08          	add    $0x8,%rsp
  4024b1:	e9 4a fe ff ff       	jmpq   402300 <unix_error>
  4024b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4024bd:	00 00 00 

00000000004024c0 <Accept>:
  4024c0:	53                   	push   %rbx
  4024c1:	e8 d2 f5 ff ff       	callq  401a98 <accept@plt>
  4024c6:	85 c0                	test   %eax,%eax
  4024c8:	89 c3                	mov    %eax,%ebx
  4024ca:	78 04                	js     4024d0 <Accept+0x10>
  4024cc:	89 d8                	mov    %ebx,%eax
  4024ce:	5b                   	pop    %rbx
  4024cf:	c3                   	retq   
  4024d0:	bf 86 30 40 00       	mov    $0x403086,%edi
  4024d5:	e8 26 fe ff ff       	callq  402300 <unix_error>
  4024da:	89 d8                	mov    %ebx,%eax
  4024dc:	5b                   	pop    %rbx
  4024dd:	c3                   	retq   
  4024de:	66 90                	xchg   %ax,%ax

00000000004024e0 <Listen>:
  4024e0:	48 83 ec 08          	sub    $0x8,%rsp
  4024e4:	e8 2f f3 ff ff       	callq  401818 <listen@plt>
  4024e9:	85 c0                	test   %eax,%eax
  4024eb:	78 0b                	js     4024f8 <Listen+0x18>
  4024ed:	48 83 c4 08          	add    $0x8,%rsp
  4024f1:	c3                   	retq   
  4024f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4024f8:	bf 93 30 40 00       	mov    $0x403093,%edi
  4024fd:	48 83 c4 08          	add    $0x8,%rsp
  402501:	e9 fa fd ff ff       	jmpq   402300 <unix_error>
  402506:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40250d:	00 00 00 

0000000000402510 <Bind>:
  402510:	48 83 ec 08          	sub    $0x8,%rsp
  402514:	e8 1f f5 ff ff       	callq  401a38 <bind@plt>
  402519:	85 c0                	test   %eax,%eax
  40251b:	78 0b                	js     402528 <Bind+0x18>
  40251d:	48 83 c4 08          	add    $0x8,%rsp
  402521:	c3                   	retq   
  402522:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402528:	bf a0 30 40 00       	mov    $0x4030a0,%edi
  40252d:	48 83 c4 08          	add    $0x8,%rsp
  402531:	e9 ca fd ff ff       	jmpq   402300 <unix_error>
  402536:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40253d:	00 00 00 

0000000000402540 <Setsockopt>:
  402540:	48 83 ec 08          	sub    $0x8,%rsp
  402544:	e8 4f f2 ff ff       	callq  401798 <setsockopt@plt>
  402549:	85 c0                	test   %eax,%eax
  40254b:	78 0b                	js     402558 <Setsockopt+0x18>
  40254d:	48 83 c4 08          	add    $0x8,%rsp
  402551:	c3                   	retq   
  402552:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402558:	bf ab 30 40 00       	mov    $0x4030ab,%edi
  40255d:	48 83 c4 08          	add    $0x8,%rsp
  402561:	e9 9a fd ff ff       	jmpq   402300 <unix_error>
  402566:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40256d:	00 00 00 

0000000000402570 <Socket>:
  402570:	53                   	push   %rbx
  402571:	e8 b2 f3 ff ff       	callq  401928 <socket@plt>
  402576:	85 c0                	test   %eax,%eax
  402578:	89 c3                	mov    %eax,%ebx
  40257a:	78 04                	js     402580 <Socket+0x10>
  40257c:	89 d8                	mov    %ebx,%eax
  40257e:	5b                   	pop    %rbx
  40257f:	c3                   	retq   
  402580:	bf bc 30 40 00       	mov    $0x4030bc,%edi
  402585:	e8 76 fd ff ff       	callq  402300 <unix_error>
  40258a:	89 d8                	mov    %ebx,%eax
  40258c:	5b                   	pop    %rbx
  40258d:	c3                   	retq   
  40258e:	66 90                	xchg   %ax,%ax

0000000000402590 <Fwrite>:
  402590:	53                   	push   %rbx
  402591:	48 89 d3             	mov    %rdx,%rbx
  402594:	e8 af f4 ff ff       	callq  401a48 <fwrite@plt>
  402599:	48 39 c3             	cmp    %rax,%rbx
  40259c:	77 02                	ja     4025a0 <Fwrite+0x10>
  40259e:	5b                   	pop    %rbx
  40259f:	c3                   	retq   
  4025a0:	5b                   	pop    %rbx
  4025a1:	bf c9 30 40 00       	mov    $0x4030c9,%edi
  4025a6:	e9 55 fd ff ff       	jmpq   402300 <unix_error>
  4025ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004025b0 <Fread>:
  4025b0:	48 89 5c 24 e8       	mov    %rbx,-0x18(%rsp)
  4025b5:	48 89 6c 24 f0       	mov    %rbp,-0x10(%rsp)
  4025ba:	48 89 d3             	mov    %rdx,%rbx
  4025bd:	4c 89 64 24 f8       	mov    %r12,-0x8(%rsp)
  4025c2:	48 83 ec 18          	sub    $0x18,%rsp
  4025c6:	49 89 cc             	mov    %rcx,%r12
  4025c9:	e8 6a f3 ff ff       	callq  401938 <fread@plt>
  4025ce:	48 39 c3             	cmp    %rax,%rbx
  4025d1:	48 89 c5             	mov    %rax,%rbp
  4025d4:	77 1a                	ja     4025f0 <Fread+0x40>
  4025d6:	48 89 e8             	mov    %rbp,%rax
  4025d9:	48 8b 1c 24          	mov    (%rsp),%rbx
  4025dd:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  4025e2:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  4025e7:	48 83 c4 18          	add    $0x18,%rsp
  4025eb:	c3                   	retq   
  4025ec:	0f 1f 40 00          	nopl   0x0(%rax)
  4025f0:	4c 89 e7             	mov    %r12,%rdi
  4025f3:	e8 e0 f1 ff ff       	callq  4017d8 <ferror@plt>
  4025f8:	85 c0                	test   %eax,%eax
  4025fa:	74 da                	je     4025d6 <Fread+0x26>
  4025fc:	bf d6 30 40 00       	mov    $0x4030d6,%edi
  402601:	e8 fa fc ff ff       	callq  402300 <unix_error>
  402606:	eb ce                	jmp    4025d6 <Fread+0x26>
  402608:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40260f:	00 

0000000000402610 <Fputs>:
  402610:	48 83 ec 08          	sub    $0x8,%rsp
  402614:	e8 9f f2 ff ff       	callq  4018b8 <fputs@plt>
  402619:	83 c0 01             	add    $0x1,%eax
  40261c:	74 0a                	je     402628 <Fputs+0x18>
  40261e:	48 83 c4 08          	add    $0x8,%rsp
  402622:	c3                   	retq   
  402623:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402628:	bf e2 30 40 00       	mov    $0x4030e2,%edi
  40262d:	48 83 c4 08          	add    $0x8,%rsp
  402631:	e9 ca fc ff ff       	jmpq   402300 <unix_error>
  402636:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40263d:	00 00 00 

0000000000402640 <Fopen>:
  402640:	53                   	push   %rbx
  402641:	e8 12 f1 ff ff       	callq  401758 <fopen@plt>
  402646:	48 85 c0             	test   %rax,%rax
  402649:	48 89 c3             	mov    %rax,%rbx
  40264c:	74 0a                	je     402658 <Fopen+0x18>
  40264e:	48 89 d8             	mov    %rbx,%rax
  402651:	5b                   	pop    %rbx
  402652:	c3                   	retq   
  402653:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402658:	bf ee 30 40 00       	mov    $0x4030ee,%edi
  40265d:	e8 9e fc ff ff       	callq  402300 <unix_error>
  402662:	eb ea                	jmp    40264e <Fopen+0xe>
  402664:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  40266b:	00 00 00 00 00 

0000000000402670 <Fdopen>:
  402670:	53                   	push   %rbx
  402671:	e8 b2 f1 ff ff       	callq  401828 <fdopen@plt>
  402676:	48 85 c0             	test   %rax,%rax
  402679:	48 89 c3             	mov    %rax,%rbx
  40267c:	74 0a                	je     402688 <Fdopen+0x18>
  40267e:	48 89 d8             	mov    %rbx,%rax
  402681:	5b                   	pop    %rbx
  402682:	c3                   	retq   
  402683:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402688:	bf fa 30 40 00       	mov    $0x4030fa,%edi
  40268d:	e8 6e fc ff ff       	callq  402300 <unix_error>
  402692:	eb ea                	jmp    40267e <Fdopen+0xe>
  402694:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  40269b:	00 00 00 00 00 

00000000004026a0 <Fclose>:
  4026a0:	48 83 ec 08          	sub    $0x8,%rsp
  4026a4:	e8 5f f3 ff ff       	callq  401a08 <fclose@plt>
  4026a9:	85 c0                	test   %eax,%eax
  4026ab:	75 0b                	jne    4026b8 <Fclose+0x18>
  4026ad:	48 83 c4 08          	add    $0x8,%rsp
  4026b1:	c3                   	retq   
  4026b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4026b8:	bf 07 31 40 00       	mov    $0x403107,%edi
  4026bd:	48 83 c4 08          	add    $0x8,%rsp
  4026c1:	e9 3a fc ff ff       	jmpq   402300 <unix_error>
  4026c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4026cd:	00 00 00 

00000000004026d0 <Calloc>:
  4026d0:	53                   	push   %rbx
  4026d1:	e8 12 f3 ff ff       	callq  4019e8 <calloc@plt>
  4026d6:	48 85 c0             	test   %rax,%rax
  4026d9:	48 89 c3             	mov    %rax,%rbx
  4026dc:	74 0a                	je     4026e8 <Calloc+0x18>
  4026de:	48 89 d8             	mov    %rbx,%rax
  4026e1:	5b                   	pop    %rbx
  4026e2:	c3                   	retq   
  4026e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4026e8:	bf 14 31 40 00       	mov    $0x403114,%edi
  4026ed:	e8 0e fc ff ff       	callq  402300 <unix_error>
  4026f2:	eb ea                	jmp    4026de <Calloc+0xe>
  4026f4:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  4026fb:	00 00 00 00 00 

0000000000402700 <Realloc>:
  402700:	53                   	push   %rbx
  402701:	e8 62 f3 ff ff       	callq  401a68 <realloc@plt>
  402706:	48 85 c0             	test   %rax,%rax
  402709:	48 89 c3             	mov    %rax,%rbx
  40270c:	74 0a                	je     402718 <Realloc+0x18>
  40270e:	48 89 d8             	mov    %rbx,%rax
  402711:	5b                   	pop    %rbx
  402712:	c3                   	retq   
  402713:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402718:	bf 21 31 40 00       	mov    $0x403121,%edi
  40271d:	e8 de fb ff ff       	callq  402300 <unix_error>
  402722:	eb ea                	jmp    40270e <Realloc+0xe>
  402724:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  40272b:	00 00 00 00 00 

0000000000402730 <Malloc>:
  402730:	53                   	push   %rbx
  402731:	e8 12 f0 ff ff       	callq  401748 <malloc@plt>
  402736:	48 85 c0             	test   %rax,%rax
  402739:	48 89 c3             	mov    %rax,%rbx
  40273c:	74 0a                	je     402748 <Malloc+0x18>
  40273e:	48 89 d8             	mov    %rbx,%rax
  402741:	5b                   	pop    %rbx
  402742:	c3                   	retq   
  402743:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402748:	bf 2f 31 40 00       	mov    $0x40312f,%edi
  40274d:	e8 ae fb ff ff       	callq  402300 <unix_error>
  402752:	eb ea                	jmp    40273e <Malloc+0xe>
  402754:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  40275b:	00 00 00 00 00 

0000000000402760 <Munmap>:
  402760:	48 83 ec 08          	sub    $0x8,%rsp
  402764:	e8 8f f2 ff ff       	callq  4019f8 <munmap@plt>
  402769:	85 c0                	test   %eax,%eax
  40276b:	78 0b                	js     402778 <Munmap+0x18>
  40276d:	48 83 c4 08          	add    $0x8,%rsp
  402771:	c3                   	retq   
  402772:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402778:	bf 3c 31 40 00       	mov    $0x40313c,%edi
  40277d:	48 83 c4 08          	add    $0x8,%rsp
  402781:	e9 7a fb ff ff       	jmpq   402300 <unix_error>
  402786:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40278d:	00 00 00 

0000000000402790 <Mmap>:
  402790:	53                   	push   %rbx
  402791:	e8 22 f3 ff ff       	callq  401ab8 <mmap@plt>
  402796:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40279a:	48 89 c3             	mov    %rax,%rbx
  40279d:	74 09                	je     4027a8 <Mmap+0x18>
  40279f:	48 89 d8             	mov    %rbx,%rax
  4027a2:	5b                   	pop    %rbx
  4027a3:	c3                   	retq   
  4027a4:	0f 1f 40 00          	nopl   0x0(%rax)
  4027a8:	bf 49 31 40 00       	mov    $0x403149,%edi
  4027ad:	e8 4e fb ff ff       	callq  402300 <unix_error>
  4027b2:	eb eb                	jmp    40279f <Mmap+0xf>
  4027b4:	66 66 66 2e 0f 1f 84 	nopw   %cs:0x0(%rax,%rax,1)
  4027bb:	00 00 00 00 00 

00000000004027c0 <Fstat>:
  4027c0:	48 83 ec 08          	sub    $0x8,%rsp
  4027c4:	48 89 f2             	mov    %rsi,%rdx
  4027c7:	89 fe                	mov    %edi,%esi
  4027c9:	bf 01 00 00 00       	mov    $0x1,%edi
  4027ce:	e8 75 f1 ff ff       	callq  401948 <__fxstat@plt>
  4027d3:	85 c0                	test   %eax,%eax
  4027d5:	78 09                	js     4027e0 <Fstat+0x20>
  4027d7:	48 83 c4 08          	add    $0x8,%rsp
  4027db:	c3                   	retq   
  4027dc:	0f 1f 40 00          	nopl   0x0(%rax)
  4027e0:	bf 54 31 40 00       	mov    $0x403154,%edi
  4027e5:	48 83 c4 08          	add    $0x8,%rsp
  4027e9:	e9 12 fb ff ff       	jmpq   402300 <unix_error>
  4027ee:	66 90                	xchg   %ax,%ax

00000000004027f0 <Stat>:
  4027f0:	48 83 ec 08          	sub    $0x8,%rsp
  4027f4:	48 89 f2             	mov    %rsi,%rdx
  4027f7:	48 89 fe             	mov    %rdi,%rsi
  4027fa:	bf 01 00 00 00       	mov    $0x1,%edi
  4027ff:	e8 f4 ef ff ff       	callq  4017f8 <__xstat@plt>
  402804:	85 c0                	test   %eax,%eax
  402806:	78 08                	js     402810 <Stat+0x20>
  402808:	48 83 c4 08          	add    $0x8,%rsp
  40280c:	c3                   	retq   
  40280d:	0f 1f 00             	nopl   (%rax)
  402810:	bf 60 31 40 00       	mov    $0x403160,%edi
  402815:	48 83 c4 08          	add    $0x8,%rsp
  402819:	e9 e2 fa ff ff       	jmpq   402300 <unix_error>
  40281e:	66 90                	xchg   %ax,%ax

0000000000402820 <Dup2>:
  402820:	53                   	push   %rbx
  402821:	e8 52 ee ff ff       	callq  401678 <dup2@plt>
  402826:	85 c0                	test   %eax,%eax
  402828:	89 c3                	mov    %eax,%ebx
  40282a:	78 04                	js     402830 <Dup2+0x10>
  40282c:	89 d8                	mov    %ebx,%eax
  40282e:	5b                   	pop    %rbx
  40282f:	c3                   	retq   
  402830:	bf 6b 31 40 00       	mov    $0x40316b,%edi
  402835:	e8 c6 fa ff ff       	callq  402300 <unix_error>
  40283a:	89 d8                	mov    %ebx,%eax
  40283c:	5b                   	pop    %rbx
  40283d:	c3                   	retq   
  40283e:	66 90                	xchg   %ax,%ax

0000000000402840 <Select>:
  402840:	53                   	push   %rbx
  402841:	e8 c2 ee ff ff       	callq  401708 <select@plt>
  402846:	85 c0                	test   %eax,%eax
  402848:	89 c3                	mov    %eax,%ebx
  40284a:	78 04                	js     402850 <Select+0x10>
  40284c:	89 d8                	mov    %ebx,%eax
  40284e:	5b                   	pop    %rbx
  40284f:	c3                   	retq   
  402850:	bf 76 31 40 00       	mov    $0x403176,%edi
  402855:	e8 a6 fa ff ff       	callq  402300 <unix_error>
  40285a:	89 d8                	mov    %ebx,%eax
  40285c:	5b                   	pop    %rbx
  40285d:	c3                   	retq   
  40285e:	66 90                	xchg   %ax,%ax

0000000000402860 <Close>:
  402860:	48 83 ec 08          	sub    $0x8,%rsp
  402864:	e8 2f ee ff ff       	callq  401698 <close@plt>
  402869:	85 c0                	test   %eax,%eax
  40286b:	78 0b                	js     402878 <Close+0x18>
  40286d:	48 83 c4 08          	add    $0x8,%rsp
  402871:	c3                   	retq   
  402872:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402878:	bf 83 31 40 00       	mov    $0x403183,%edi
  40287d:	48 83 c4 08          	add    $0x8,%rsp
  402881:	e9 7a fa ff ff       	jmpq   402300 <unix_error>
  402886:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40288d:	00 00 00 

0000000000402890 <Lseek>:
  402890:	53                   	push   %rbx
  402891:	e8 32 f0 ff ff       	callq  4018c8 <lseek@plt>
  402896:	48 85 c0             	test   %rax,%rax
  402899:	48 89 c3             	mov    %rax,%rbx
  40289c:	78 0a                	js     4028a8 <Lseek+0x18>
  40289e:	48 89 d8             	mov    %rbx,%rax
  4028a1:	5b                   	pop    %rbx
  4028a2:	c3                   	retq   
  4028a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4028a8:	bf 8f 31 40 00       	mov    $0x40318f,%edi
  4028ad:	e8 4e fa ff ff       	callq  402300 <unix_error>
  4028b2:	48 89 d8             	mov    %rbx,%rax
  4028b5:	5b                   	pop    %rbx
  4028b6:	c3                   	retq   
  4028b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4028be:	00 00 

00000000004028c0 <Write>:
  4028c0:	53                   	push   %rbx
  4028c1:	e8 c2 f1 ff ff       	callq  401a88 <write@plt>
  4028c6:	48 85 c0             	test   %rax,%rax
  4028c9:	48 89 c3             	mov    %rax,%rbx
  4028cc:	78 0a                	js     4028d8 <Write+0x18>
  4028ce:	48 89 d8             	mov    %rbx,%rax
  4028d1:	5b                   	pop    %rbx
  4028d2:	c3                   	retq   
  4028d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4028d8:	bf 9b 31 40 00       	mov    $0x40319b,%edi
  4028dd:	e8 1e fa ff ff       	callq  402300 <unix_error>
  4028e2:	48 89 d8             	mov    %rbx,%rax
  4028e5:	5b                   	pop    %rbx
  4028e6:	c3                   	retq   
  4028e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4028ee:	00 00 

00000000004028f0 <Read>:
  4028f0:	53                   	push   %rbx
  4028f1:	e8 42 ee ff ff       	callq  401738 <read@plt>
  4028f6:	48 85 c0             	test   %rax,%rax
  4028f9:	48 89 c3             	mov    %rax,%rbx
  4028fc:	78 0a                	js     402908 <Read+0x18>
  4028fe:	48 89 d8             	mov    %rbx,%rax
  402901:	5b                   	pop    %rbx
  402902:	c3                   	retq   
  402903:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402908:	bf a7 31 40 00       	mov    $0x4031a7,%edi
  40290d:	e8 ee f9 ff ff       	callq  402300 <unix_error>
  402912:	48 89 d8             	mov    %rbx,%rax
  402915:	5b                   	pop    %rbx
  402916:	c3                   	retq   
  402917:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40291e:	00 00 

0000000000402920 <Open>:
  402920:	53                   	push   %rbx
  402921:	31 c0                	xor    %eax,%eax
  402923:	e8 80 f1 ff ff       	callq  401aa8 <open@plt>
  402928:	85 c0                	test   %eax,%eax
  40292a:	89 c3                	mov    %eax,%ebx
  40292c:	78 0a                	js     402938 <Open+0x18>
  40292e:	89 d8                	mov    %ebx,%eax
  402930:	5b                   	pop    %rbx
  402931:	c3                   	retq   
  402932:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402938:	bf b2 31 40 00       	mov    $0x4031b2,%edi
  40293d:	e8 be f9 ff ff       	callq  402300 <unix_error>
  402942:	89 d8                	mov    %ebx,%eax
  402944:	5b                   	pop    %rbx
  402945:	c3                   	retq   
  402946:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40294d:	00 00 00 

0000000000402950 <Sigismember>:
  402950:	53                   	push   %rbx
  402951:	e8 32 ee ff ff       	callq  401788 <sigismember@plt>
  402956:	85 c0                	test   %eax,%eax
  402958:	89 c3                	mov    %eax,%ebx
  40295a:	78 04                	js     402960 <Sigismember+0x10>
  40295c:	89 d8                	mov    %ebx,%eax
  40295e:	5b                   	pop    %rbx
  40295f:	c3                   	retq   
  402960:	bf bd 31 40 00       	mov    $0x4031bd,%edi
  402965:	e8 96 f9 ff ff       	callq  402300 <unix_error>
  40296a:	89 d8                	mov    %ebx,%eax
  40296c:	5b                   	pop    %rbx
  40296d:	c3                   	retq   
  40296e:	66 90                	xchg   %ax,%ax

0000000000402970 <Sigdelset>:
  402970:	48 83 ec 08          	sub    $0x8,%rsp
  402974:	e8 df f0 ff ff       	callq  401a58 <sigdelset@plt>
  402979:	85 c0                	test   %eax,%eax
  40297b:	78 0b                	js     402988 <Sigdelset+0x18>
  40297d:	48 83 c4 08          	add    $0x8,%rsp
  402981:	c3                   	retq   
  402982:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402988:	bf cf 31 40 00       	mov    $0x4031cf,%edi
  40298d:	48 83 c4 08          	add    $0x8,%rsp
  402991:	e9 6a f9 ff ff       	jmpq   402300 <unix_error>
  402996:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40299d:	00 00 00 

00000000004029a0 <Sigaddset>:
  4029a0:	48 83 ec 08          	sub    $0x8,%rsp
  4029a4:	e8 cf ef ff ff       	callq  401978 <sigaddset@plt>
  4029a9:	85 c0                	test   %eax,%eax
  4029ab:	78 0b                	js     4029b8 <Sigaddset+0x18>
  4029ad:	48 83 c4 08          	add    $0x8,%rsp
  4029b1:	c3                   	retq   
  4029b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4029b8:	bf df 31 40 00       	mov    $0x4031df,%edi
  4029bd:	48 83 c4 08          	add    $0x8,%rsp
  4029c1:	e9 3a f9 ff ff       	jmpq   402300 <unix_error>
  4029c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4029cd:	00 00 00 

00000000004029d0 <Sigfillset>:
  4029d0:	48 83 ec 08          	sub    $0x8,%rsp
  4029d4:	e8 9f ed ff ff       	callq  401778 <sigfillset@plt>
  4029d9:	85 c0                	test   %eax,%eax
  4029db:	78 0b                	js     4029e8 <Sigfillset+0x18>
  4029dd:	48 83 c4 08          	add    $0x8,%rsp
  4029e1:	c3                   	retq   
  4029e2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4029e8:	bf ef 31 40 00       	mov    $0x4031ef,%edi
  4029ed:	48 83 c4 08          	add    $0x8,%rsp
  4029f1:	e9 0a f9 ff ff       	jmpq   402300 <unix_error>
  4029f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4029fd:	00 00 00 

0000000000402a00 <Sigemptyset>:
  402a00:	48 83 ec 08          	sub    $0x8,%rsp
  402a04:	e8 1f f0 ff ff       	callq  401a28 <sigemptyset@plt>
  402a09:	85 c0                	test   %eax,%eax
  402a0b:	78 0b                	js     402a18 <Sigemptyset+0x18>
  402a0d:	48 83 c4 08          	add    $0x8,%rsp
  402a11:	c3                   	retq   
  402a12:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402a18:	bf 00 32 40 00       	mov    $0x403200,%edi
  402a1d:	48 83 c4 08          	add    $0x8,%rsp
  402a21:	e9 da f8 ff ff       	jmpq   402300 <unix_error>
  402a26:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402a2d:	00 00 00 

0000000000402a30 <Sigprocmask>:
  402a30:	48 83 ec 08          	sub    $0x8,%rsp
  402a34:	e8 4f ee ff ff       	callq  401888 <sigprocmask@plt>
  402a39:	85 c0                	test   %eax,%eax
  402a3b:	78 0b                	js     402a48 <Sigprocmask+0x18>
  402a3d:	48 83 c4 08          	add    $0x8,%rsp
  402a41:	c3                   	retq   
  402a42:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402a48:	bf 12 32 40 00       	mov    $0x403212,%edi
  402a4d:	48 83 c4 08          	add    $0x8,%rsp
  402a51:	e9 aa f8 ff ff       	jmpq   402300 <unix_error>
  402a56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402a5d:	00 00 00 

0000000000402a60 <Signal>:
  402a60:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  402a65:	4c 89 64 24 f8       	mov    %r12,-0x8(%rsp)
  402a6a:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
  402a71:	48 8d 9c 24 a0 00 00 	lea    0xa0(%rsp),%rbx
  402a78:	00 
  402a79:	41 89 fc             	mov    %edi,%r12d
  402a7c:	48 89 b4 24 a0 00 00 	mov    %rsi,0xa0(%rsp)
  402a83:	00 
  402a84:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
  402a88:	e8 9b ef ff ff       	callq  401a28 <sigemptyset@plt>
  402a8d:	48 89 e2             	mov    %rsp,%rdx
  402a90:	48 89 de             	mov    %rbx,%rsi
  402a93:	44 89 e7             	mov    %r12d,%edi
  402a96:	c7 84 24 28 01 00 00 	movl   $0x10000000,0x128(%rsp)
  402a9d:	00 00 00 10 
  402aa1:	e8 f2 ed ff ff       	callq  401898 <sigaction@plt>
  402aa6:	85 c0                	test   %eax,%eax
  402aa8:	78 26                	js     402ad0 <Signal+0x70>
  402aaa:	48 8b 04 24          	mov    (%rsp),%rax
  402aae:	48 8b 9c 24 48 01 00 	mov    0x148(%rsp),%rbx
  402ab5:	00 
  402ab6:	4c 8b a4 24 50 01 00 	mov    0x150(%rsp),%r12
  402abd:	00 
  402abe:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
  402ac5:	c3                   	retq   
  402ac6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402acd:	00 00 00 
  402ad0:	bf 24 32 40 00       	mov    $0x403224,%edi
  402ad5:	e8 26 f8 ff ff       	callq  402300 <unix_error>
  402ada:	eb ce                	jmp    402aaa <Signal+0x4a>
  402adc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402ae0 <Setpgid>:
  402ae0:	48 83 ec 08          	sub    $0x8,%rsp
  402ae4:	e8 bf ec ff ff       	callq  4017a8 <setpgid@plt>
  402ae9:	85 c0                	test   %eax,%eax
  402aeb:	78 0b                	js     402af8 <Setpgid+0x18>
  402aed:	48 83 c4 08          	add    $0x8,%rsp
  402af1:	c3                   	retq   
  402af2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402af8:	bf 31 32 40 00       	mov    $0x403231,%edi
  402afd:	48 83 c4 08          	add    $0x8,%rsp
  402b01:	e9 fa f7 ff ff       	jmpq   402300 <unix_error>
  402b06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402b0d:	00 00 00 

0000000000402b10 <Kill>:
  402b10:	48 83 ec 08          	sub    $0x8,%rsp
  402b14:	e8 4f ed ff ff       	callq  401868 <kill@plt>
  402b19:	85 c0                	test   %eax,%eax
  402b1b:	78 0b                	js     402b28 <Kill+0x18>
  402b1d:	48 83 c4 08          	add    $0x8,%rsp
  402b21:	c3                   	retq   
  402b22:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402b28:	bf 3f 32 40 00       	mov    $0x40323f,%edi
  402b2d:	48 83 c4 08          	add    $0x8,%rsp
  402b31:	e9 ca f7 ff ff       	jmpq   402300 <unix_error>
  402b36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402b3d:	00 00 00 

0000000000402b40 <Waitpid>:
  402b40:	53                   	push   %rbx
  402b41:	e8 d2 ed ff ff       	callq  401918 <waitpid@plt>
  402b46:	85 c0                	test   %eax,%eax
  402b48:	89 c3                	mov    %eax,%ebx
  402b4a:	78 04                	js     402b50 <Waitpid+0x10>
  402b4c:	89 d8                	mov    %ebx,%eax
  402b4e:	5b                   	pop    %rbx
  402b4f:	c3                   	retq   
  402b50:	bf 4a 32 40 00       	mov    $0x40324a,%edi
  402b55:	e8 a6 f7 ff ff       	callq  402300 <unix_error>
  402b5a:	89 d8                	mov    %ebx,%eax
  402b5c:	5b                   	pop    %rbx
  402b5d:	c3                   	retq   
  402b5e:	66 90                	xchg   %ax,%ax

0000000000402b60 <Wait>:
  402b60:	53                   	push   %rbx
  402b61:	e8 42 eb ff ff       	callq  4016a8 <wait@plt>
  402b66:	85 c0                	test   %eax,%eax
  402b68:	89 c3                	mov    %eax,%ebx
  402b6a:	78 04                	js     402b70 <Wait+0x10>
  402b6c:	89 d8                	mov    %ebx,%eax
  402b6e:	5b                   	pop    %rbx
  402b6f:	c3                   	retq   
  402b70:	bf 58 32 40 00       	mov    $0x403258,%edi
  402b75:	e8 86 f7 ff ff       	callq  402300 <unix_error>
  402b7a:	89 d8                	mov    %ebx,%eax
  402b7c:	5b                   	pop    %rbx
  402b7d:	c3                   	retq   
  402b7e:	66 90                	xchg   %ax,%ax

0000000000402b80 <Execve>:
  402b80:	48 83 ec 08          	sub    $0x8,%rsp
  402b84:	e8 6f ed ff ff       	callq  4018f8 <execve@plt>
  402b89:	85 c0                	test   %eax,%eax
  402b8b:	78 0b                	js     402b98 <Execve+0x18>
  402b8d:	48 83 c4 08          	add    $0x8,%rsp
  402b91:	c3                   	retq   
  402b92:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402b98:	bf 63 32 40 00       	mov    $0x403263,%edi
  402b9d:	48 83 c4 08          	add    $0x8,%rsp
  402ba1:	e9 5a f7 ff ff       	jmpq   402300 <unix_error>
  402ba6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402bad:	00 00 00 

0000000000402bb0 <Fork>:
  402bb0:	53                   	push   %rbx
  402bb1:	e8 62 ee ff ff       	callq  401a18 <fork@plt>
  402bb6:	85 c0                	test   %eax,%eax
  402bb8:	89 c3                	mov    %eax,%ebx
  402bba:	78 04                	js     402bc0 <Fork+0x10>
  402bbc:	89 d8                	mov    %ebx,%eax
  402bbe:	5b                   	pop    %rbx
  402bbf:	c3                   	retq   
  402bc0:	bf 70 32 40 00       	mov    $0x403270,%edi
  402bc5:	e8 36 f7 ff ff       	callq  402300 <unix_error>
  402bca:	89 d8                	mov    %ebx,%eax
  402bcc:	5b                   	pop    %rbx
  402bcd:	c3                   	retq   
  402bce:	66 90                	xchg   %ax,%ax

0000000000402bd0 <open_listenfd>:
  402bd0:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  402bd5:	48 89 6c 24 f8       	mov    %rbp,-0x8(%rsp)
  402bda:	31 d2                	xor    %edx,%edx
  402bdc:	48 83 ec 48          	sub    $0x48,%rsp
  402be0:	89 fd                	mov    %edi,%ebp
  402be2:	be 01 00 00 00       	mov    $0x1,%esi
  402be7:	bf 02 00 00 00       	mov    $0x2,%edi
  402bec:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%rsp)
  402bf3:	00 
  402bf4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402bfb:	00 00 
  402bfd:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  402c02:	31 c0                	xor    %eax,%eax
  402c04:	e8 1f ed ff ff       	callq  401928 <socket@plt>
  402c09:	85 c0                	test   %eax,%eax
  402c0b:	89 c3                	mov    %eax,%ebx
  402c0d:	79 31                	jns    402c40 <open_listenfd+0x70>
  402c0f:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  402c14:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  402c19:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  402c20:	00 00 
  402c22:	89 d8                	mov    %ebx,%eax
  402c24:	0f 85 8e 00 00 00    	jne    402cb8 <open_listenfd+0xe8>
  402c2a:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
  402c2f:	48 8b 6c 24 40       	mov    0x40(%rsp),%rbp
  402c34:	48 83 c4 48          	add    $0x48,%rsp
  402c38:	c3                   	retq   
  402c39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402c40:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  402c45:	41 b8 04 00 00 00    	mov    $0x4,%r8d
  402c4b:	ba 02 00 00 00       	mov    $0x2,%edx
  402c50:	be 01 00 00 00       	mov    $0x1,%esi
  402c55:	89 c7                	mov    %eax,%edi
  402c57:	e8 3c eb ff ff       	callq  401798 <setsockopt@plt>
  402c5c:	85 c0                	test   %eax,%eax
  402c5e:	78 af                	js     402c0f <open_listenfd+0x3f>
  402c60:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  402c65:	ba 10 00 00 00       	mov    $0x10,%edx
  402c6a:	89 df                	mov    %ebx,%edi
  402c6c:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
  402c73:	00 00 
  402c75:	89 e8                	mov    %ebp,%eax
  402c77:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%rsp)
  402c7e:	00 
  402c7f:	66 c1 c8 08          	ror    $0x8,%ax
  402c83:	66 c7 44 24 10 02 00 	movw   $0x2,0x10(%rsp)
  402c8a:	66 89 44 24 12       	mov    %ax,0x12(%rsp)
  402c8f:	e8 a4 ed ff ff       	callq  401a38 <bind@plt>
  402c94:	85 c0                	test   %eax,%eax
  402c96:	0f 88 73 ff ff ff    	js     402c0f <open_listenfd+0x3f>
  402c9c:	be 00 04 00 00       	mov    $0x400,%esi
  402ca1:	89 df                	mov    %ebx,%edi
  402ca3:	e8 70 eb ff ff       	callq  401818 <listen@plt>
  402ca8:	85 c0                	test   %eax,%eax
  402caa:	0f 89 64 ff ff ff    	jns    402c14 <open_listenfd+0x44>
  402cb0:	e9 5a ff ff ff       	jmpq   402c0f <open_listenfd+0x3f>
  402cb5:	0f 1f 00             	nopl   (%rax)
  402cb8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402cbf:	00 
  402cc0:	e8 d3 ec ff ff       	callq  401998 <__stack_chk_fail@plt>
  402cc5:	66 66 2e 0f 1f 84 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ccc:	00 00 00 00 

0000000000402cd0 <Open_listenfd>:
  402cd0:	53                   	push   %rbx
  402cd1:	e8 fa fe ff ff       	callq  402bd0 <open_listenfd>
  402cd6:	85 c0                	test   %eax,%eax
  402cd8:	89 c3                	mov    %eax,%ebx
  402cda:	78 04                	js     402ce0 <Open_listenfd+0x10>
  402cdc:	89 d8                	mov    %ebx,%eax
  402cde:	5b                   	pop    %rbx
  402cdf:	c3                   	retq   
  402ce0:	bf 7b 32 40 00       	mov    $0x40327b,%edi
  402ce5:	e8 16 f6 ff ff       	callq  402300 <unix_error>
  402cea:	89 d8                	mov    %ebx,%eax
  402cec:	5b                   	pop    %rbx
  402ced:	c3                   	retq   
  402cee:	66 90                	xchg   %ax,%ax

0000000000402cf0 <open_clientfd>:
  402cf0:	48 89 5c 24 e8       	mov    %rbx,-0x18(%rsp)
  402cf5:	48 89 6c 24 f0       	mov    %rbp,-0x10(%rsp)
  402cfa:	31 d2                	xor    %edx,%edx
  402cfc:	4c 89 64 24 f8       	mov    %r12,-0x8(%rsp)
  402d01:	48 89 fb             	mov    %rdi,%rbx
  402d04:	48 83 ec 38          	sub    $0x38,%rsp
  402d08:	41 89 f4             	mov    %esi,%r12d
  402d0b:	bf 02 00 00 00       	mov    $0x2,%edi
  402d10:	be 01 00 00 00       	mov    $0x1,%esi
  402d15:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402d1c:	00 00 
  402d1e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402d23:	31 c0                	xor    %eax,%eax
  402d25:	e8 fe eb ff ff       	callq  401928 <socket@plt>
  402d2a:	85 c0                	test   %eax,%eax
  402d2c:	89 c5                	mov    %eax,%ebp
  402d2e:	79 30                	jns    402d60 <open_clientfd+0x70>
  402d30:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  402d35:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  402d3a:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  402d41:	00 00 
  402d43:	89 e8                	mov    %ebp,%eax
  402d45:	75 33                	jne    402d7a <open_clientfd+0x8a>
  402d47:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  402d4c:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
  402d51:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
  402d56:	48 83 c4 38          	add    $0x38,%rsp
  402d5a:	c3                   	retq   
  402d5b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402d60:	48 89 df             	mov    %rbx,%rdi
  402d63:	e8 80 e9 ff ff       	callq  4016e8 <gethostbyname@plt>
  402d68:	48 85 c0             	test   %rax,%rax
  402d6b:	75 18                	jne    402d85 <open_clientfd+0x95>
  402d6d:	bd fe ff ff ff       	mov    $0xfffffffe,%ebp
  402d72:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402d78:	eb bb                	jmp    402d35 <open_clientfd+0x45>
  402d7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402d80:	e8 13 ec ff ff       	callq  401998 <__stack_chk_fail@plt>
  402d85:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402d8c:	00 
  402d8d:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402d94:	00 00 
  402d96:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402d9b:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402d9f:	48 8b 40 18          	mov    0x18(%rax),%rax
  402da3:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402da8:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402dae:	48 8b 30             	mov    (%rax),%rsi
  402db1:	e8 c2 ec ff ff       	callq  401a78 <__memmove_chk@plt>
  402db6:	ba 10 00 00 00       	mov    $0x10,%edx
  402dbb:	48 89 e6             	mov    %rsp,%rsi
  402dbe:	89 ef                	mov    %ebp,%edi
  402dc0:	44 89 e0             	mov    %r12d,%eax
  402dc3:	66 c1 c8 08          	ror    $0x8,%ax
  402dc7:	66 89 44 24 02       	mov    %ax,0x2(%rsp)
  402dcc:	e8 17 eb ff ff       	callq  4018e8 <connect@plt>
  402dd1:	85 c0                	test   %eax,%eax
  402dd3:	0f 89 5c ff ff ff    	jns    402d35 <open_clientfd+0x45>
  402dd9:	e9 52 ff ff ff       	jmpq   402d30 <open_clientfd+0x40>
  402dde:	66 90                	xchg   %ax,%ax

0000000000402de0 <Open_clientfd>:
  402de0:	53                   	push   %rbx
  402de1:	e8 0a ff ff ff       	callq  402cf0 <open_clientfd>
  402de6:	85 c0                	test   %eax,%eax
  402de8:	89 c3                	mov    %eax,%ebx
  402dea:	78 04                	js     402df0 <Open_clientfd+0x10>
  402dec:	89 d8                	mov    %ebx,%eax
  402dee:	5b                   	pop    %rbx
  402def:	c3                   	retq   
  402df0:	83 f8 ff             	cmp    $0xffffffffffffffff,%eax
  402df3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402df8:	74 16                	je     402e10 <Open_clientfd+0x30>
  402dfa:	bf a8 32 40 00       	mov    $0x4032a8,%edi
  402dff:	e8 7c f3 ff ff       	callq  402180 <dns_error>
  402e04:	89 d8                	mov    %ebx,%eax
  402e06:	5b                   	pop    %rbx
  402e07:	c3                   	retq   
  402e08:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402e0f:	00 
  402e10:	bf 8f 32 40 00       	mov    $0x40328f,%edi
  402e15:	e8 e6 f4 ff ff       	callq  402300 <unix_error>
  402e1a:	eb d0                	jmp    402dec <Open_clientfd+0xc>
  402e1c:	90                   	nop    
  402e1d:	90                   	nop    
  402e1e:	90                   	nop    
  402e1f:	90                   	nop    

0000000000402e20 <__libc_csu_fini>:
  402e20:	f3 c3                	repz retq 
  402e22:	66 66 66 66 66 2e 0f 	nopw   %cs:0x0(%rax,%rax,1)
  402e29:	1f 84 00 00 00 00 00 

0000000000402e30 <__libc_csu_init>:
  402e30:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402e35:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  402e3a:	48 8d 2d c3 0f 20 00 	lea    0x200fc3(%rip),%rbp        # 603e04 <__init_array_end>
  402e41:	4c 8d 3d bc 0f 20 00 	lea    0x200fbc(%rip),%r15        # 603e04 <__init_array_end>
  402e48:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  402e4d:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  402e52:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402e57:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  402e5c:	48 83 ec 38          	sub    $0x38,%rsp
  402e60:	4c 29 fd             	sub    %r15,%rbp
  402e63:	41 89 fe             	mov    %edi,%r14d
  402e66:	49 89 f5             	mov    %rsi,%r13
  402e69:	48 c1 fd 03          	sar    $0x3,%rbp
  402e6d:	49 89 d4             	mov    %rdx,%r12
  402e70:	e8 cb e7 ff ff       	callq  401640 <_init>
  402e75:	48 85 ed             	test   %rbp,%rbp
  402e78:	74 1c                	je     402e96 <__libc_csu_init+0x66>
  402e7a:	31 db                	xor    %ebx,%ebx
  402e7c:	0f 1f 40 00          	nopl   0x0(%rax)
  402e80:	4c 89 e2             	mov    %r12,%rdx
  402e83:	4c 89 ee             	mov    %r13,%rsi
  402e86:	44 89 f7             	mov    %r14d,%edi
  402e89:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  402e8d:	48 83 c3 01          	add    $0x1,%rbx
  402e91:	48 39 eb             	cmp    %rbp,%rbx
  402e94:	72 ea                	jb     402e80 <__libc_csu_init+0x50>
  402e96:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  402e9b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402ea0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  402ea5:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  402eaa:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  402eaf:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  402eb4:	48 83 c4 38          	add    $0x38,%rsp
  402eb8:	c3                   	retq   
  402eb9:	90                   	nop    
  402eba:	90                   	nop    
  402ebb:	90                   	nop    
  402ebc:	90                   	nop    
  402ebd:	90                   	nop    
  402ebe:	90                   	nop    
  402ebf:	90                   	nop    

0000000000402ec0 <__do_global_ctors_aux>:
  402ec0:	55                   	push   %rbp
  402ec1:	48 89 e5             	mov    %rsp,%rbp
  402ec4:	53                   	push   %rbx
  402ec5:	48 83 ec 08          	sub    $0x8,%rsp
  402ec9:	48 8b 05 38 0f 20 00 	mov    0x200f38(%rip),%rax        # 603e08 <__CTOR_LIST__>
  402ed0:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  402ed4:	74 19                	je     402eef <__do_global_ctors_aux+0x2f>
  402ed6:	bb 08 3e 60 00       	mov    $0x603e08,%ebx
  402edb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402ee0:	48 83 eb 08          	sub    $0x8,%rbx
  402ee4:	ff d0                	callq  *%rax
  402ee6:	48 8b 03             	mov    (%rbx),%rax
  402ee9:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  402eed:	75 f1                	jne    402ee0 <__do_global_ctors_aux+0x20>
  402eef:	48 83 c4 08          	add    $0x8,%rsp
  402ef3:	5b                   	pop    %rbx
  402ef4:	c9                   	leaveq 
  402ef5:	c3                   	retq   
  402ef6:	90                   	nop    
  402ef7:	90                   	nop    

Disassembly of section .fini:

0000000000402ef8 <_fini>:
  402ef8:	48 83 ec 08          	sub    $0x8,%rsp
  402efc:	e8 1f ec ff ff       	callq  401b20 <__do_global_dtors_aux>
  402f01:	48 83 c4 08          	add    $0x8,%rsp
  402f05:	c3                   	retq   
