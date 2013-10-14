	movlpd  (%rax), %xmm0
	xorps	%xmm2, %xmm2
	movaps  %xmm0, %xmm1

	

	flds	16(%rsp)
	fstpl	8(%rsp)

	
	movss		16(%rsp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movsd		%xmm0, 8(%rsp)
	
