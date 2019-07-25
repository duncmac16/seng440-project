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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	leaq	L_.str(%rip), %rdi
	movl	$61184, %esi            ## imm = 0xEF00
	movl	$113, %edx
	movl	$61184, %ecx            ## imm = 0xEF00
	xorl	%eax, %eax
	callq	_printf
	movl	$-4352, %r13d           ## imm = 0xEF00
	movl	$16, %r12d
	movl	$1, %r14d
	leaq	L_.str.1(%rip), %r15
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movswl	%r13w, %eax
	sarl	%eax
	movl	$-2, %r13d
	movl	%r12d, %ecx
	roll	%cl, %r13d
	andl	%eax, %r13d
	movl	%r13d, %esi
	shrl	$8, %esi
	movl	%r13d, %eax
	negw	%ax
	cmovlw	%r13w, %ax
	andb	$-128, %sil
	movswl	%ax, %edx
	movb	$7, %bl
	btl	$12, %edx
	jb	LBB0_9
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movb	$6, %bl
	btl	$11, %edx
	jb	LBB0_9
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movb	$5, %bl
	btl	$10, %edx
	jb	LBB0_9
## %bb.4:                               ##   in Loop: Header=BB0_1 Depth=1
	movb	$4, %bl
	btl	$9, %edx
	jb	LBB0_9
## %bb.5:                               ##   in Loop: Header=BB0_1 Depth=1
	movb	$3, %bl
	btl	$8, %edx
	jb	LBB0_9
## %bb.6:                               ##   in Loop: Header=BB0_1 Depth=1
	testb	%dl, %dl
	js	LBB0_7
## %bb.8:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	%edx, %ebx
	shrb	$6, %bl
	andb	$1, %bl
	jmp	LBB0_9
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	movb	$2, %bl
	.p2align	4, 0x90
LBB0_9:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	%ebx, %ecx
	incb	%cl
	sarl	%cl, %edx
	movl	%edx, %ecx
	andb	$15, %cl
	movl	%ebx, %eax
	shlb	$4, %al
	orb	%sil, %al
	orb	%cl, %al
	xorb	$-128, %al
	andl	$15, %edx
	movzbl	%bl, %esi
	leal	1(%rsi), %ecx
                                        ## kill: def %cl killed %cl killed %ecx
	shll	%cl, %edx
	testb	%sil, %sil
	je	LBB0_11
## %bb.10:                              ##   in Loop: Header=BB0_1 Depth=1
	movl	$32, %esi
	movl	%ebx, %ecx
	shll	%cl, %esi
	andl	$65534, %edx            ## imm = 0xFFFE
	orl	%esi, %edx
LBB0_11:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	%edx, %esi
	negl	%esi
	testb	%al, %al
	cmovlel	%edx, %esi
	movzwl	%r13w, %edx
	movzbl	%al, %ecx
	movzwl	%si, %r8d
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	%r14d, %esi
	callq	_printf
	decl	%r12d
	incl	%r14d
	cmpl	$8, %r12d
	jne	LBB0_1
## %bb.12:
	leaq	L_.str(%rip), %rdi
	movl	$58112, %esi            ## imm = 0xE300
	movl	$125, %edx
	movl	$58112, %ecx            ## imm = 0xE300
	xorl	%eax, %eax
	callq	_printf
	movl	$-7424, %r13d           ## imm = 0xE300
	movl	$16, %r12d
	movl	$1, %r14d
	leaq	L_.str.1(%rip), %r15
	.p2align	4, 0x90
LBB0_13:                                ## =>This Inner Loop Header: Depth=1
	movswl	%r13w, %eax
	sarl	%eax
	movl	$-2, %r13d
	movl	%r12d, %ecx
	roll	%cl, %r13d
	andl	%eax, %r13d
	movl	%r13d, %esi
	shrl	$8, %esi
	movl	%r13d, %eax
	negw	%ax
	cmovlw	%r13w, %ax
	andb	$-128, %sil
	movswl	%ax, %edx
	movb	$7, %bl
	btl	$12, %edx
	jb	LBB0_21
## %bb.14:                              ##   in Loop: Header=BB0_13 Depth=1
	movb	$6, %bl
	btl	$11, %edx
	jb	LBB0_21
## %bb.15:                              ##   in Loop: Header=BB0_13 Depth=1
	movb	$5, %bl
	btl	$10, %edx
	jb	LBB0_21
## %bb.16:                              ##   in Loop: Header=BB0_13 Depth=1
	movb	$4, %bl
	btl	$9, %edx
	jb	LBB0_21
## %bb.17:                              ##   in Loop: Header=BB0_13 Depth=1
	movb	$3, %bl
	btl	$8, %edx
	jb	LBB0_21
## %bb.18:                              ##   in Loop: Header=BB0_13 Depth=1
	testb	%dl, %dl
	js	LBB0_19
## %bb.20:                              ##   in Loop: Header=BB0_13 Depth=1
	movl	%edx, %ebx
	shrb	$6, %bl
	andb	$1, %bl
	jmp	LBB0_21
LBB0_19:                                ##   in Loop: Header=BB0_13 Depth=1
	movb	$2, %bl
	.p2align	4, 0x90
LBB0_21:                                ##   in Loop: Header=BB0_13 Depth=1
	movl	%ebx, %ecx
	incb	%cl
	sarl	%cl, %edx
	movl	%edx, %ecx
	andb	$15, %cl
	movl	%ebx, %eax
	shlb	$4, %al
	orb	%sil, %al
	orb	%cl, %al
	xorb	$-128, %al
	andl	$15, %edx
	movzbl	%bl, %esi
	leal	1(%rsi), %ecx
                                        ## kill: def %cl killed %cl killed %ecx
	shll	%cl, %edx
	testb	%sil, %sil
	je	LBB0_23
## %bb.22:                              ##   in Loop: Header=BB0_13 Depth=1
	movl	$32, %esi
	movl	%ebx, %ecx
	shll	%cl, %esi
	andl	$65534, %edx            ## imm = 0xFFFE
	orl	%esi, %edx
LBB0_23:                                ##   in Loop: Header=BB0_13 Depth=1
	movl	%edx, %esi
	negl	%esi
	testb	%al, %al
	cmovlel	%edx, %esi
	movzwl	%r13w, %edx
	movzbl	%al, %ecx
	movzwl	%si, %r8d
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	%r14d, %esi
	callq	_printf
	decl	%r12d
	incl	%r14d
	cmpl	$8, %r12d
	jne	LBB0_13
## %bb.24:
	leaq	L_.str.3(%rip), %rdi
	callq	_puts
	leaq	L_.str(%rip), %rdi
	xorl	%esi, %esi
	movl	$128, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
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
	movl	%edi, %eax
	shll	$8, %eax
	movzbl	%sil, %ecx
	orl	%eax, %ecx
	movl	%ecx, %eax
	negw	%ax
	cmovlw	%cx, %ax
	andb	$-128, %dil
	cwtl
	movb	$7, %dl
	btl	$12, %eax
	jb	LBB1_8
## %bb.1:
	movb	$6, %dl
	btl	$11, %eax
	jb	LBB1_8
## %bb.2:
	movb	$5, %dl
	btl	$10, %eax
	jb	LBB1_8
## %bb.3:
	movb	$4, %dl
	btl	$9, %eax
	jb	LBB1_8
## %bb.4:
	movb	$3, %dl
	btl	$8, %eax
	jb	LBB1_8
## %bb.5:
	testb	%al, %al
	js	LBB1_6
## %bb.7:
	movl	%eax, %edx
	shrb	$6, %dl
	andb	$1, %dl
	jmp	LBB1_8
LBB1_6:
	movb	$2, %dl
LBB1_8:
	movl	%edx, %ecx
	incb	%cl
	sarl	%cl, %eax
	andb	$15, %al
	shlb	$4, %dl
	orb	%dil, %dl
	orb	%al, %dl
	xorb	$-128, %dl
	movsbl	%dl, %eax
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
	movl	%edi, %eax
	shrb	$4, %al
	andb	$7, %al
	movl	%edi, %edx
	andl	$15, %edx
	movzbl	%al, %esi
	leal	1(%rsi), %ecx
                                        ## kill: def %cl killed %cl killed %ecx
	shll	%cl, %edx
	testb	%sil, %sil
	je	LBB2_2
## %bb.1:
	movl	$32, %esi
	movl	%eax, %ecx
	shll	%cl, %esi
	andl	$65534, %edx            ## imm = 0xFFFE
	orl	%esi, %edx
LBB2_2:
	movl	%edx, %eax
	negl	%eax
	testb	%dil, %dil
	cmovlew	%dx, %ax
	cwtl
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_sign               ## -- Begin function get_sign
	.p2align	4, 0x90
_get_sign:                              ## @get_sign
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	shrl	$8, %edi
	notb	%dil
	andb	$-128, %dil
	movsbl	%dil, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_magnitude          ## -- Begin function get_magnitude
	.p2align	4, 0x90
_get_magnitude:                         ## @get_magnitude
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %eax
	negw	%ax
	cmovlw	%di, %ax
	cwtl
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_chord              ## -- Begin function get_chord
	.p2align	4, 0x90
_get_chord:                             ## @get_chord
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %eax
	movb	$7, %cl
	btl	$12, %eax
	jb	LBB5_7
## %bb.1:
	movb	$6, %cl
	testb	$8, %ah
	jne	LBB5_7
## %bb.2:
	movb	$5, %cl
	btl	$10, %eax
	jb	LBB5_7
## %bb.3:
	movb	$4, %cl
	btl	$9, %eax
	jb	LBB5_7
## %bb.4:
	movb	$3, %cl
	btl	$8, %eax
	jb	LBB5_7
## %bb.5:
	testb	%al, %al
	js	LBB5_6
## %bb.8:
	shrl	$6, %eax
	andl	$1, %eax
	popq	%rbp
	retq
LBB5_6:
	movb	$2, %cl
LBB5_7:
	movsbl	%cl, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_get_step               ## -- Begin function get_step
	.p2align	4, 0x90
_get_step:                              ## @get_step
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        ## kill: def %esi killed %esi def %rsi
	leal	1(%rsi), %ecx
                                        ## kill: def %cl killed %cl killed %ecx
	sarl	%cl, %edi
	andl	$15, %edi
	movl	%edi, %eax
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

L_.str.3:                               ## @.str.3
	.asciz	"0x0000 Test"


.subsections_via_symbols
