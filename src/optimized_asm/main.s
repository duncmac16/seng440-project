	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	expand_word
	.type	expand_word, %function
expand_word:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0, lsr #4
	and	r1, r3, #7
	add	r3, r1, #1
	and	r2, r0, #15
	mov	r2, r2, asl r3
	cmp	r1, #0
	mov	r2, r2, asl #16
	movne	r3, #1
	mov	ip, r0
	mov	r0, r2, lsr #16
	addne	r2, r1, #5
	orrne	r3, r0, r3, asl r2
	movne	r3, r3, asl #16
	movne	r0, r3, lsr #16
	cmp	ip, #0
	rsbne	r3, r0, #0
	movne	r3, r3, asl #16
	movne	r0, r3, lsr #16
	mov	r0, r0, asl #16
	mov	r0, r0, asr #16
	bx	lr
	.size	expand_word, .-expand_word
	.align	2
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	orr	r3, r1, r0, asl #8
	movs	r1, r3, asl #16
	rsbmi	r3, r3, #0
	movmi	r1, r3, asl #16
	mov	r2, r1, lsr #16
	movpl	ip, #128
	movmi	ip, #0
	tst	r2, #4096
	movne	r3, r1, asr #24
	andne	r3, r3, #15
	movne	r0, #112
	bne	.L9
	tst	r2, #2048
	movne	r3, r1, asr #23
	andne	r3, r3, #15
	movne	r0, #96
	bne	.L9
	tst	r2, #1024
	movne	r3, r1, asr #22
	andne	r3, r3, #15
	movne	r0, #80
	bne	.L9
	tst	r2, #512
	movne	r3, r1, asr #21
	andne	r3, r3, #15
	movne	r0, #64
	bne	.L9
	tst	r2, #256
	movne	r3, r1, asr #20
	andne	r3, r3, #15
	movne	r0, #48
	bne	.L9
	tst	r2, #128
	movne	r3, r1, asr #19
	andne	r3, r3, #15
	movne	r0, #32
	bne	.L9
	ands	r0, r2, #64
	movne	r3, r1, asr #18
	moveq	r3, r1, asr #17
	andne	r3, r3, #15
	movne	r0, #16
	andeq	r3, r3, #15
.L9:
	orr	r0, r0, r3
	orr	r0, ip, r0
	bx	lr
	.size	compress_sample, .-compress_sample
	.global	__aeabi_i2d
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L54
	ldr	r1, [r3, #0]
	cmp	r1, #0
	sub	sp, sp, #8
	beq	.L19
	mov	r6, #0
.L20:
	bl	clock
	mov	r4, r0
	bl	clock
	rsb	r0, r4, r0
	bl	__aeabi_i2d
	mov	r5, r1
	mov	r2, r0
	mov	r3, r1
	mov	r4, r0
	ldr	r0, .L54+4
	bl	printf
	mov	r0, r7
	mov	r1, r8
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dadd
	add	r6, r6, #1
	cmp	r6, #20
	mov	r7, r0
	mov	r8, r1
	bne	.L20
	mov	r3, #1073741824
	mov	r2, #0
	add	r3, r3, #3407872
	bl	__aeabi_ddiv
	mov	r3, #1090519040
	add	r3, r3, #3047424
	mov	r2, #0
	add	r3, r3, #1152
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L54+8
	bl	printf
	mov	r6, #0
	mov	r7, #0
	mov	r8, #0
.L21:
	bl	clock
	mov	r4, r0
	bl	clock
	rsb	r5, r4, r0
	mov	r1, r5
	ldr	r0, .L54+12
	bl	printf
	mov	r0, r5
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	add	r8, r8, #1
	cmp	r8, #20
	mov	r6, r0
	mov	r7, r1
	bne	.L21
	mov	r3, #1073741824
	mov	r2, #0
	add	r3, r3, #3407872
	bl	__aeabi_ddiv
	mov	r3, #1090519040
	add	r3, r3, #3047424
	mov	r2, #0
	add	r3, r3, #1152
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L54+16
	bl	printf
.L22:
	mov	r0, #0
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L19:
	mov	r4, r1
	mov	r5, #-285212672
	mov	r6, #1
.L35:
	rsb	r3, r4, #16
	mov	r3, r6, asl r3
	mvn	r3, r3
	and	r3, r3, r5, asr #17
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	and	r2, r3, #65280
	orr	r2, r2, r1
	movs	r1, r2, asl #16
	mov	r5, r3, asl #16
	rsbmi	r3, r2, #0
	movmi	r1, r3, asl #16
	mov	r3, r1, lsr #16
	movpl	ip, #128
	movmi	ip, #0
	tst	r3, #4096
	movne	r3, r1, asr #24
	andne	r3, r3, #15
	movne	r2, #112
	bne	.L26
	tst	r3, #2048
	movne	r3, r1, asr #23
	andne	r3, r3, #15
	movne	r2, #96
	bne	.L26
	tst	r3, #1024
	movne	r3, r1, asr #22
	andne	r3, r3, #15
	movne	r2, #80
	bne	.L26
	tst	r3, #512
	movne	r3, r1, asr #21
	andne	r3, r3, #15
	movne	r2, #64
	bne	.L26
	tst	r3, #256
	movne	r3, r1, asr #20
	andne	r3, r3, #15
	movne	r2, #48
	bne	.L26
	tst	r3, #128
	movne	r3, r1, asr #19
	andne	r3, r3, #15
	movne	r2, #32
	bne	.L26
	ands	r0, r3, #64
	movne	r3, r1, asr #18
	moveq	r3, r1, asr #17
	andne	r3, r3, #15
	movne	r2, #16
	andeq	r3, r3, #15
	moveq	r2, r0
.L26:
	orr	r3, r2, r3
	orr	r3, ip, r3
	and	r0, r3, #255
	mov	r2, r0, lsr #4
	and	r1, r2, #7
	add	r2, r1, #1
	and	r3, r3, #15
	mov	r3, r3, asl r2
	cmp	r1, #0
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	addne	r3, r1, #5
	orrne	r3, ip, r6, asl r3
	movne	r3, r3, asl #16
	movne	ip, r3, lsr #16
	cmp	r0, #0
	rsbne	r3, ip, #0
	movne	r3, r3, asl #16
	add	r4, r4, #1
	movne	ip, r3, lsr #16
	mov	r1, r4
	mov	r3, r0
	mov	r2, r5, lsr #16
	ldr	r0, .L54+20
	str	ip, [sp, #0]
	bl	printf
	cmp	r4, #8
	bne	.L35
	mov	r1, #58112
	ldr	r0, .L54+24
	mov	r2, #125
	mov	r3, r1
	bl	printf
	sub	r4, r4, #8
	mov	r5, #-486539264
	mov	r6, #1
.L48:
	rsb	r3, r4, #16
	mov	r3, r6, asl r3
	mvn	r3, r3
	and	r3, r3, r5, asr #17
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r1, r3, #255
	and	r2, r3, #65280
	orr	r2, r2, r1
	movs	r1, r2, asl #16
	mov	r5, r3, asl #16
	rsbmi	r3, r2, #0
	movmi	r1, r3, asl #16
	mov	r3, r1, lsr #16
	movpl	ip, #128
	movmi	ip, #0
	tst	r3, #4096
	movne	r3, r1, asr #24
	andne	r3, r3, #15
	movne	r2, #112
	bne	.L39
	tst	r3, #2048
	movne	r3, r1, asr #23
	andne	r3, r3, #15
	movne	r2, #96
	bne	.L39
	tst	r3, #1024
	movne	r3, r1, asr #22
	andne	r3, r3, #15
	movne	r2, #80
	bne	.L39
	tst	r3, #512
	movne	r3, r1, asr #21
	andne	r3, r3, #15
	movne	r2, #64
	bne	.L39
	tst	r3, #256
	movne	r3, r1, asr #20
	andne	r3, r3, #15
	movne	r2, #48
	bne	.L39
	tst	r3, #128
	movne	r3, r1, asr #19
	andne	r3, r3, #15
	movne	r2, #32
	bne	.L39
	ands	r0, r3, #64
	movne	r3, r1, asr #18
	moveq	r3, r1, asr #17
	andne	r3, r3, #15
	movne	r2, #16
	andeq	r3, r3, #15
	moveq	r2, r0
.L39:
	orr	r3, r2, r3
	orr	r3, ip, r3
	and	r0, r3, #255
	mov	r2, r0, lsr #4
	and	r1, r2, #7
	add	r2, r1, #1
	and	r3, r3, #15
	mov	r3, r3, asl r2
	cmp	r1, #0
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	addne	r3, r1, #5
	orrne	r3, ip, r6, asl r3
	movne	r3, r3, asl #16
	movne	ip, r3, lsr #16
	cmp	r0, #0
	rsbne	r3, ip, #0
	movne	r3, r3, asl #16
	add	r4, r4, #1
	movne	ip, r3, lsr #16
	mov	r1, r4
	mov	r3, r0
	mov	r2, r5, lsr #16
	ldr	r0, .L54+20
	str	ip, [sp, #0]
	bl	printf
	cmp	r4, #8
	bne	.L48
	ldr	r0, .L54+28
	bl	puts
	mov	r1, #0
	mov	r2, #128
	mov	r3, r1
	ldr	r0, .L54+24
	bl	printf
	b	.L22
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.size	main, .-main
	.global	test
	.global	time_test
	.global	head_test
	.data
	.align	2
.LANCHOR0 = . + 0
	.type	time_test, %object
	.size	time_test, 4
time_test:
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%f\012\000"
.LC1:
	.ascii	"Average time to compress: %f\012\000"
	.space	2
.LC2:
	.ascii	"%lu\012\000"
	.space	3
.LC3:
	.ascii	"Average time to expand: %f\012\000"
.LC4:
	.ascii	"%d Shift\012Sample: %x\012Codeword: %x \012Expanded"
	.ascii	": %x\012\012\000"
	.space	3
.LC5:
	.ascii	"Sample: %x\012Codeword: %x \012Expanded: %x\012\012"
	.ascii	"\000"
.LC6:
	.ascii	"0x0000 Test\000"
	.bss
	.align	2
	.type	test, %object
	.size	test, 4
test:
	.space	4
	.type	head_test, %object
	.size	head_test, 4
head_test:
	.space	4
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
