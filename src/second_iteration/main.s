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
	movl	$-4352, %r12d           ## imm = 0xEF00
	movl	$16, %r13d
	movl	$1, %r14d
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movswl	%r12w, %eax
	sarl	%eax
	movl	$-2, %r12d
	movl	%r13d, %ecx
	roll	%cl, %r12d
	andl	%eax, %r12d
	movl	%r12d, %ebx
	shrl	$8, %ebx
	movl	%r12d, %eax
	negw	%ax
	cmovlw	%r12w, %ax
	andl	$128, %ebx
	movswl	%ax, %r15d
	btl	$12, %r15d
	jb	LBB0_2
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	btl	$11, %r15d
	jb	LBB0_4
## %bb.5:                               ##   in Loop: Header=BB0_1 Depth=1
	btl	$10, %r15d
	jb	LBB0_6
## %bb.7:                               ##   in Loop: Header=BB0_1 Depth=1
	btl	$9, %r15d
	jb	LBB0_8
## %bb.9:                               ##   in Loop: Header=BB0_1 Depth=1
	btl	$8, %r15d
	jb	LBB0_10
## %bb.11:                              ##   in Loop: Header=BB0_1 Depth=1
	testb	%r15b, %r15b
	js	LBB0_12
## %bb.13:                              ##   in Loop: Header=BB0_1 Depth=1
	testb	$64, %r15b
	jne	LBB0_15
## %bb.14:                              ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movl	$1, %ecx
	jmp	LBB0_16
	.p2align	4, 0x90
LBB0_2:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	$112, %eax
	movl	$8, %ecx
	jmp	LBB0_16
	.p2align	4, 0x90
LBB0_4:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	$96, %eax
	movl	$7, %ecx
	jmp	LBB0_16
LBB0_6:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	$80, %eax
	movl	$6, %ecx
	jmp	LBB0_16
LBB0_8:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	$64, %eax
	movl	$5, %ecx
	jmp	LBB0_16
LBB0_10:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	$48, %eax
	movl	$4, %ecx
	jmp	LBB0_16
LBB0_12:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	$32, %eax
	movl	$3, %ecx
	jmp	LBB0_16
LBB0_15:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	L_.str.4(%rip), %rdi
	callq	_puts
	movl	$16, %eax
	movl	$2, %ecx
	.p2align	4, 0x90
LBB0_16:                                ##   in Loop: Header=BB0_1 Depth=1
                                        ## kill: def %cl killed %cl killed %ecx
	shrl	%cl, %r15d
	orl	%ebx, %eax
	andl	$15, %r15d
	orl	%r15d, %eax
	movl	%eax, %ebx
	xorb	$-128, %bl
	shrb	$4, %al
	andb	$7, %al
	movzbl	%al, %edx
	leal	1(%rdx), %ecx
                                        ## kill: def %cl killed %cl killed %ecx
	shll	%cl, %r15d
	testb	%dl, %dl
	je	LBB0_18
## %bb.17:                              ##   in Loop: Header=BB0_1 Depth=1
	movl	$32, %edx
	movl	%eax, %ecx
	shll	%cl, %edx
	andl	$65534, %r15d           ## imm = 0xFFFE
	orl	%edx, %r15d
LBB0_18:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	%r15d, %eax
	negl	%eax
	testb	%bl, %bl
	cmovlel	%r15d, %eax
	movzwl	%r12w, %edx
	movzbl	%bl, %ecx
	movzwl	%ax, %r8d
	xorl	%eax, %eax
	leaq	L_.str.1(%rip), %rdi
	movl	%r14d, %esi
	callq	_printf
	decl	%r13d
	incl	%r14d
	cmpl	$8, %r13d
	jne	LBB0_1
## %bb.19:
	leaq	L_.str(%rip), %rdi
	movl	$58112, %esi            ## imm = 0xE300
	movl	$125, %edx
	movl	$58112, %ecx            ## imm = 0xE300
	xorl	%eax, %eax
	callq	_printf
	movl	$-7424, %r12d           ## imm = 0xE300
	movl	$16, %r13d
	movl	$1, %r14d
	.p2align	4, 0x90
LBB0_20:                                ## =>This Inner Loop Header: Depth=1
	movswl	%r12w, %eax
	sarl	%eax
	movl	$-2, %r12d
	movl	%r13d, %ecx
	roll	%cl, %r12d
	andl	%eax, %r12d
	movl	%r12d, %ebx
	shrl	$8, %ebx
	movl	%r12d, %eax
	negw	%ax
	cmovlw	%r12w, %ax
	andl	$128, %ebx
	movswl	%ax, %r15d
	btl	$12, %r15d
	jb	LBB0_21
## %bb.22:                              ##   in Loop: Header=BB0_20 Depth=1
	btl	$11, %r15d
	jb	LBB0_23
## %bb.24:                              ##   in Loop: Header=BB0_20 Depth=1
	btl	$10, %r15d
	jb	LBB0_25
## %bb.26:                              ##   in Loop: Header=BB0_20 Depth=1
	btl	$9, %r15d
	jb	LBB0_27
## %bb.28:                              ##   in Loop: Header=BB0_20 Depth=1
	btl	$8, %r15d
	jb	LBB0_29
## %bb.30:                              ##   in Loop: Header=BB0_20 Depth=1
	testb	%r15b, %r15b
	js	LBB0_31
## %bb.32:                              ##   in Loop: Header=BB0_20 Depth=1
	testb	$64, %r15b
	jne	LBB0_34
## %bb.33:                              ##   in Loop: Header=BB0_20 Depth=1
	xorl	%eax, %eax
	movl	$1, %ecx
	jmp	LBB0_35
	.p2align	4, 0x90
LBB0_21:                                ##   in Loop: Header=BB0_20 Depth=1
	movl	$112, %eax
	movl	$8, %ecx
	jmp	LBB0_35
	.p2align	4, 0x90
LBB0_23:                                ##   in Loop: Header=BB0_20 Depth=1
	movl	$96, %eax
	movl	$7, %ecx
	jmp	LBB0_35
LBB0_25:                                ##   in Loop: Header=BB0_20 Depth=1
	movl	$80, %eax
	movl	$6, %ecx
	jmp	LBB0_35
LBB0_27:                                ##   in Loop: Header=BB0_20 Depth=1
	movl	$64, %eax
	movl	$5, %ecx
	jmp	LBB0_35
LBB0_29:                                ##   in Loop: Header=BB0_20 Depth=1
	movl	$48, %eax
	movl	$4, %ecx
	jmp	LBB0_35
LBB0_31:                                ##   in Loop: Header=BB0_20 Depth=1
	movl	$32, %eax
	movl	$3, %ecx
	jmp	LBB0_35
LBB0_34:                                ##   in Loop: Header=BB0_20 Depth=1
	leaq	L_.str.4(%rip), %rdi
	callq	_puts
	movl	$16, %eax
	movl	$2, %ecx
	.p2align	4, 0x90
LBB0_35:                                ##   in Loop: Header=BB0_20 Depth=1
                                        ## kill: def %cl killed %cl killed %ecx
	shrl	%cl, %r15d
	orl	%ebx, %eax
	andl	$15, %r15d
	orl	%r15d, %eax
	movl	%eax, %ebx
	xorb	$-128, %bl
	shrb	$4, %al
	andb	$7, %al
	movzbl	%al, %edx
	leal	1(%rdx), %ecx
                                        ## kill: def %cl killed %cl killed %ecx
	shll	%cl, %r15d
	testb	%dl, %dl
	je	LBB0_37
## %bb.36:                              ##   in Loop: Header=BB0_20 Depth=1
	movl	$32, %edx
	movl	%eax, %ecx
	shll	%cl, %edx
	andl	$65534, %r15d           ## imm = 0xFFFE
	orl	%edx, %r15d
LBB0_37:                                ##   in Loop: Header=BB0_20 Depth=1
	movl	%r15d, %eax
	negl	%eax
	testb	%bl, %bl
	cmovlel	%r15d, %eax
	movzwl	%r12w, %edx
	movzbl	%bl, %ecx
	movzwl	%ax, %r8d
	xorl	%eax, %eax
	leaq	L_.str.1(%rip), %rdi
	movl	%r14d, %esi
	callq	_printf
	decl	%r13d
	incl	%r14d
	cmpl	$8, %r13d
	jne	LBB0_20
## %bb.38:
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
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	%edi, %r14d
	shll	$8, %edi
	movzbl	%sil, %eax
	orl	%edi, %eax
	movl	%eax, %ecx
	negw	%cx
	cmovlw	%ax, %cx
	notl	%r14d
	andl	$128, %r14d
	movswl	%cx, %ebx
	btl	$12, %ebx
	jb	LBB1_1
## %bb.2:
	btl	$11, %ebx
	jb	LBB1_3
## %bb.4:
	btl	$10, %ebx
	jb	LBB1_5
## %bb.6:
	btl	$9, %ebx
	jb	LBB1_7
## %bb.8:
	btl	$8, %ebx
	jb	LBB1_9
## %bb.10:
	testb	%bl, %bl
	js	LBB1_11
## %bb.12:
	testb	$64, %bl
	jne	LBB1_14
## %bb.13:
	xorl	%eax, %eax
	movl	$1, %ecx
	jmp	LBB1_15
LBB1_1:
	movl	$112, %eax
	movl	$8, %ecx
	jmp	LBB1_15
LBB1_3:
	movl	$96, %eax
	movl	$7, %ecx
	jmp	LBB1_15
LBB1_5:
	movl	$80, %eax
	movl	$6, %ecx
	jmp	LBB1_15
LBB1_7:
	movl	$64, %eax
	movl	$5, %ecx
	jmp	LBB1_15
LBB1_9:
	movl	$48, %eax
	movl	$4, %ecx
	jmp	LBB1_15
LBB1_11:
	movl	$32, %eax
	movl	$3, %ecx
	jmp	LBB1_15
LBB1_14:
	leaq	L_.str.4(%rip), %rdi
	callq	_puts
	movl	$16, %eax
	movl	$2, %ecx
LBB1_15:
                                        ## kill: def %cl killed %cl killed %ecx
	shrl	%cl, %ebx
	orl	%r14d, %eax
	andl	$15, %ebx
	orl	%eax, %ebx
	movsbl	%bl, %eax
	popq	%rbx
	popq	%r14
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

L_.str.4:                               ## @.str.4
	.asciz	"here"


.subsections_via_symbols
