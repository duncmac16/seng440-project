	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$0, _head_test(%rip)
	je	LBB0_6
## %bb.1:
	movl	$0, -68(%rbp)
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$77, -68(%rbp)
	jge	LBB0_5
## %bb.3:                               ##   in Loop: Header=BB0_2 Depth=1
	jmp	LBB0_4
LBB0_4:                                 ##   in Loop: Header=BB0_2 Depth=1
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	jmp	LBB0_2
LBB0_5:
	movl	$0, -4(%rbp)
	jmp	LBB0_30
LBB0_6:
	cmpl	$0, _test(%rip)
	je	LBB0_16
## %bb.7:
	movw	$-4352, -70(%rbp)       ## imm = 0xEF00
	movswl	-70(%rbp), %eax
	sarl	$8, %eax
	movb	%al, %cl
	movb	%cl, -71(%rbp)
	movswl	-70(%rbp), %eax
	andl	$255, %eax
	movb	%al, %cl
	movb	%cl, -72(%rbp)
	movb	-71(%rbp), %cl
	movsbl	%cl, %edi
	movsbl	-72(%rbp), %esi
	callq	_compress_sample
	movb	%al, -73(%rbp)
	movsbl	-73(%rbp), %edi
	callq	_expand_word
	leaq	L_.str(%rip), %rdi
	movw	%ax, -76(%rbp)
	movzwl	-70(%rbp), %esi
	movsbl	-73(%rbp), %edx
	movzwl	-76(%rbp), %ecx
	movb	$0, %al
	callq	_printf
	movl	$0, -80(%rbp)
	movl	%eax, -84(%rbp)         ## 4-byte Spill
LBB0_8:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$8, -80(%rbp)
	jge	LBB0_11
## %bb.9:                               ##   in Loop: Header=BB0_8 Depth=1
	movl	$1, %eax
	movl	$16, %ecx
	movswl	-70(%rbp), %edx
	sarl	$1, %edx
	movw	%dx, %si
	movw	%si, -70(%rbp)
	subl	-80(%rbp), %ecx
                                        ## kill: def %cl killed %ecx
	shll	%cl, %eax
	xorl	$-1, %eax
	movswl	-70(%rbp), %edx
	andl	%eax, %edx
	movw	%dx, %si
	movw	%si, -70(%rbp)
	movswl	-70(%rbp), %eax
	sarl	$8, %eax
	movb	%al, %cl
	movb	%cl, -71(%rbp)
	movswl	-70(%rbp), %eax
	andl	$255, %eax
	movb	%al, %cl
	movb	%cl, -72(%rbp)
	movb	-71(%rbp), %cl
	movsbl	%cl, %edi
	movsbl	-72(%rbp), %esi
	callq	_compress_sample
	movb	%al, -73(%rbp)
	movsbl	-73(%rbp), %edi
	callq	_expand_word
	leaq	L_.str.1(%rip), %rdi
	movw	%ax, -76(%rbp)
	movl	-80(%rbp), %edx
	addl	$1, %edx
	movzwl	-70(%rbp), %esi
	movzbl	-73(%rbp), %ecx
	movzwl	-76(%rbp), %r8d
	movl	%esi, -88(%rbp)         ## 4-byte Spill
	movl	%edx, %esi
	movl	-88(%rbp), %edx         ## 4-byte Reload
	movb	$0, %al
	callq	_printf
	movl	%eax, -92(%rbp)         ## 4-byte Spill
## %bb.10:                              ##   in Loop: Header=BB0_8 Depth=1
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80(%rbp)
	jmp	LBB0_8
LBB0_11:
	movw	$-7424, -70(%rbp)       ## imm = 0xE300
	movswl	-70(%rbp), %eax
	sarl	$8, %eax
	movb	%al, %cl
	movb	%cl, -71(%rbp)
	movswl	-70(%rbp), %eax
	andl	$255, %eax
	movb	%al, %cl
	movb	%cl, -72(%rbp)
	movb	-71(%rbp), %cl
	movsbl	%cl, %edi
	movsbl	-72(%rbp), %esi
	callq	_compress_sample
	movb	%al, -73(%rbp)
	movsbl	-73(%rbp), %edi
	callq	_expand_word
	leaq	L_.str(%rip), %rdi
	movw	%ax, -76(%rbp)
	movzwl	-70(%rbp), %esi
	movsbl	-73(%rbp), %edx
	movzwl	-76(%rbp), %ecx
	movb	$0, %al
	callq	_printf
	movl	$0, -80(%rbp)
	movl	%eax, -96(%rbp)         ## 4-byte Spill
LBB0_12:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$8, -80(%rbp)
	jge	LBB0_15
## %bb.13:                              ##   in Loop: Header=BB0_12 Depth=1
	movl	$1, %eax
	movl	$16, %ecx
	movswl	-70(%rbp), %edx
	sarl	$1, %edx
	movw	%dx, %si
	movw	%si, -70(%rbp)
	subl	-80(%rbp), %ecx
                                        ## kill: def %cl killed %ecx
	shll	%cl, %eax
	xorl	$-1, %eax
	movswl	-70(%rbp), %edx
	andl	%eax, %edx
	movw	%dx, %si
	movw	%si, -70(%rbp)
	movswl	-70(%rbp), %eax
	sarl	$8, %eax
	movb	%al, %cl
	movb	%cl, -71(%rbp)
	movswl	-70(%rbp), %eax
	andl	$255, %eax
	movb	%al, %cl
	movb	%cl, -72(%rbp)
	movb	-71(%rbp), %cl
	movsbl	%cl, %edi
	movsbl	-72(%rbp), %esi
	callq	_compress_sample
	movb	%al, -73(%rbp)
	movsbl	-73(%rbp), %edi
	callq	_expand_word
	leaq	L_.str.1(%rip), %rdi
	movw	%ax, -76(%rbp)
	movl	-80(%rbp), %edx
	addl	$1, %edx
	movzwl	-70(%rbp), %esi
	movzbl	-73(%rbp), %ecx
	movzwl	-76(%rbp), %r8d
	movl	%esi, -100(%rbp)        ## 4-byte Spill
	movl	%edx, %esi
	movl	-100(%rbp), %edx        ## 4-byte Reload
	movb	$0, %al
	callq	_printf
	movl	%eax, -104(%rbp)        ## 4-byte Spill
## %bb.14:                              ##   in Loop: Header=BB0_12 Depth=1
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80(%rbp)
	jmp	LBB0_12
LBB0_15:
	leaq	L_.str.2(%rip), %rdi
	leaq	L_.str.3(%rip), %rsi
	movb	$0, %al
	callq	_printf
	movw	$0, -70(%rbp)
	movswl	-70(%rbp), %ecx
	sarl	$8, %ecx
	movb	%cl, %dl
	movb	%dl, -71(%rbp)
	movswl	-70(%rbp), %ecx
	andl	$255, %ecx
	movb	%cl, %dl
	movb	%dl, -72(%rbp)
	movb	-71(%rbp), %dl
	movsbl	%dl, %edi
	movsbl	-72(%rbp), %esi
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	callq	_compress_sample
	movb	%al, -73(%rbp)
	movsbl	-73(%rbp), %edi
	callq	_expand_word
	leaq	L_.str(%rip), %rdi
	movw	%ax, -76(%rbp)
	movzwl	-70(%rbp), %esi
	movzbl	-73(%rbp), %edx
	movzwl	-76(%rbp), %ecx
	movb	$0, %al
	callq	_printf
	movl	$0, -4(%rbp)
	movl	%eax, -112(%rbp)        ## 4-byte Spill
	jmp	LBB0_30
LBB0_16:
	leaq	L_.str.4(%rip), %rsi
	movl	$2, %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rcx
	movq	8(%rcx), %rdi
	callq	_strncmp
	cmpl	$0, %eax
	jne	LBB0_18
## %bb.17:
	jmp	LBB0_21
LBB0_18:
	leaq	L_.str.5(%rip), %rsi
	movl	$2, %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rcx
	movq	8(%rcx), %rdi
	callq	_strncmp
	cmpl	$0, %eax
	jne	LBB0_20
## %bb.19:
	leaq	L_.str.2(%rip), %rdi
	leaq	L_.str.6(%rip), %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -116(%rbp)        ## 4-byte Spill
LBB0_20:
	jmp	LBB0_21
LBB0_21:
	leaq	L_.str.4(%rip), %rsi
	movl	$2, %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rcx
	movq	8(%rcx), %rdi
	callq	_strncmp
	cmpl	$0, %eax
	jne	LBB0_24
## %bb.22:
	cmpl	$4, -8(%rbp)
	jle	LBB0_24
## %bb.23:
	jmp	LBB0_29
LBB0_24:
	leaq	L_.str.5(%rip), %rsi
	movl	$2, %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rcx
	movq	8(%rcx), %rdi
	callq	_strncmp
	cmpl	$0, %eax
	jne	LBB0_27
## %bb.25:
	cmpl	$4, -8(%rbp)
	jle	LBB0_27
## %bb.26:
	jmp	LBB0_28
LBB0_27:
	leaq	L_.str.2(%rip), %rdi
	leaq	L_.str.7(%rip), %rsi
	movb	$0, %al
	callq	_printf
	movl	%eax, -120(%rbp)        ## 4-byte Spill
LBB0_28:
	jmp	LBB0_29
LBB0_29:
	movl	$0, -4(%rbp)
LBB0_30:
	movl	-4(%rbp), %eax
	addq	$128, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_compress_sample        ## -- Begin function compress_sample
	.p2align	4, 0x90
_compress_sample:                       ## @compress_sample
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movb	%sil, %al
	movb	%dil, %cl
	movb	%cl, -1(%rbp)
	movb	%al, -2(%rbp)
	movsbl	-1(%rbp), %esi
	shll	$8, %esi
	movsbl	-2(%rbp), %edi
	andl	$255, %edi
	orl	%edi, %esi
	movw	%si, %dx
	movw	%dx, -4(%rbp)
	movb	$0, -5(%rbp)
	movb	$-128, -6(%rbp)
	movb	$0, -7(%rbp)
	movw	$0, -10(%rbp)
	movb	$0, -11(%rbp)
	movswl	-4(%rbp), %esi
	cmpl	$0, %esi
	jge	LBB1_2
## %bb.1:
	movswl	-4(%rbp), %eax
	imull	$-1, %eax, %eax
	movw	%ax, %cx
	movw	%cx, -4(%rbp)
	movb	$0, -6(%rbp)
LBB1_2:
	movswl	-4(%rbp), %eax
	andl	$4096, %eax             ## imm = 0x1000
	cmpl	$0, %eax
	je	LBB1_4
## %bb.3:
	movb	$112, -11(%rbp)
	movswl	-4(%rbp), %eax
	sarl	$8, %eax
	andl	$15, %eax
	movb	%al, %cl
	movb	%cl, -7(%rbp)
	jmp	LBB1_23
LBB1_4:
	movswl	-4(%rbp), %eax
	andl	$2048, %eax             ## imm = 0x800
	cmpl	$0, %eax
	je	LBB1_6
## %bb.5:
	movb	$96, -11(%rbp)
	movswl	-4(%rbp), %eax
	sarl	$7, %eax
	andl	$15, %eax
	movb	%al, %cl
	movb	%cl, -7(%rbp)
	jmp	LBB1_22
LBB1_6:
	movswl	-4(%rbp), %eax
	andl	$1024, %eax             ## imm = 0x400
	cmpl	$0, %eax
	je	LBB1_8
## %bb.7:
	movb	$80, -11(%rbp)
	movswl	-4(%rbp), %eax
	sarl	$6, %eax
	andl	$15, %eax
	movb	%al, %cl
	movb	%cl, -7(%rbp)
	jmp	LBB1_21
LBB1_8:
	movswl	-4(%rbp), %eax
	andl	$512, %eax              ## imm = 0x200
	cmpl	$0, %eax
	je	LBB1_10
## %bb.9:
	movb	$64, -11(%rbp)
	movswl	-4(%rbp), %eax
	sarl	$5, %eax
	andl	$15, %eax
	movb	%al, %cl
	movb	%cl, -7(%rbp)
	jmp	LBB1_20
LBB1_10:
	movswl	-4(%rbp), %eax
	andl	$256, %eax              ## imm = 0x100
	cmpl	$0, %eax
	je	LBB1_12
## %bb.11:
	movb	$48, -11(%rbp)
	movswl	-4(%rbp), %eax
	sarl	$4, %eax
	andl	$15, %eax
	movb	%al, %cl
	movb	%cl, -7(%rbp)
	jmp	LBB1_19
LBB1_12:
	movswl	-4(%rbp), %eax
	andl	$128, %eax
	cmpl	$0, %eax
	je	LBB1_14
## %bb.13:
	movb	$32, -11(%rbp)
	movswl	-4(%rbp), %eax
	sarl	$3, %eax
	andl	$15, %eax
	movb	%al, %cl
	movb	%cl, -7(%rbp)
	jmp	LBB1_18
LBB1_14:
	movswl	-4(%rbp), %eax
	andl	$64, %eax
	cmpl	$0, %eax
	je	LBB1_16
## %bb.15:
	leaq	L_.str.2(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	movb	$0, %al
	callq	_printf
	movb	$16, -11(%rbp)
	movswl	-4(%rbp), %ecx
	sarl	$2, %ecx
	andl	$15, %ecx
	movb	%cl, %dl
	movb	%dl, -7(%rbp)
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	jmp	LBB1_17
LBB1_16:
	movswl	-4(%rbp), %eax
	sarl	$1, %eax
	andl	$15, %eax
	movb	%al, %cl
	movb	%cl, -7(%rbp)
LBB1_17:
	jmp	LBB1_18
LBB1_18:
	jmp	LBB1_19
LBB1_19:
	jmp	LBB1_20
LBB1_20:
	jmp	LBB1_21
LBB1_21:
	jmp	LBB1_22
LBB1_22:
	jmp	LBB1_23
LBB1_23:
	movsbl	-6(%rbp), %eax
	movsbl	-11(%rbp), %ecx
	orl	%ecx, %eax
	movsbl	-7(%rbp), %ecx
	orl	%ecx, %eax
	movb	%al, %dl
	movb	%dl, -5(%rbp)
	movsbl	-5(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_expand_word            ## -- Begin function expand_word
	.p2align	4, 0x90
_expand_word:                           ## @expand_word
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movb	%dil, %al
	movb	%al, -1(%rbp)
	movw	$0, -4(%rbp)
	movsbl	-1(%rbp), %edi
	sarl	$4, %edi
	andl	$7, %edi
	movb	%dil, %al
	movb	%al, -5(%rbp)
	movsbl	-1(%rbp), %edi
	andl	$15, %edi
	movw	%di, %cx
	movw	%cx, -8(%rbp)
	movswl	-8(%rbp), %edi
	movsbl	-5(%rbp), %edx
	addl	$1, %edx
	movl	%edx, %ecx
                                        ## kill: def %cl killed %ecx
	shll	%cl, %edi
	movw	%di, %si
	movw	%si, -4(%rbp)
	cmpb	$0, -5(%rbp)
	je	LBB2_2
## %bb.1:
	movl	$1, %eax
	movsbl	-5(%rbp), %ecx
	addl	$5, %ecx
                                        ## kill: def %cl killed %ecx
	shll	%cl, %eax
	movswl	-4(%rbp), %edx
	orl	%eax, %edx
	movw	%dx, %si
	movw	%si, -4(%rbp)
LBB2_2:
	movsbl	-1(%rbp), %eax
	cmpl	$0, %eax
	jle	LBB2_4
## %bb.3:
	movswl	-4(%rbp), %eax
	imull	$-1, %eax, %eax
	movw	%ax, %cx
	movw	%cx, -4(%rbp)
LBB2_4:
	movswl	-4(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__data
	.globl	_test                   ## @test
	.p2align	2
_test:
	.long	1                       ## 0x1

	.globl	_head_test              ## @head_test
.zerofill __DATA,__common,_head_test,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Sample: %x\nCodeword: %x \nExpanded: %x\n\n"

L_.str.1:                               ## @.str.1
	.asciz	"%d Shift\nSample: %x\nCodeword: %x \nExpanded: %x\n\n"

L_.str.2:                               ## @.str.2
	.asciz	"%s\n"

L_.str.3:                               ## @.str.3
	.asciz	"0x0000 Test"

L_.str.4:                               ## @.str.4
	.asciz	"-c"

L_.str.5:                               ## @.str.5
	.asciz	"-e"

L_.str.6:                               ## @.str.6
	.asciz	"Expanding file"

L_.str.7:                               ## @.str.7
	.asciz	"Usage: ./comp <mode> <file_name> -o <output_file_name>\nModes: -c -> compress,\n       -e -> expand"

L_.str.8:                               ## @.str.8
	.asciz	"here"


.subsections_via_symbols
