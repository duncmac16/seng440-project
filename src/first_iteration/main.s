	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"main.c"
	.global	test
	.data
	.align	2
	.type	test, %object
	.size	test, 4
test:
	.word	1
	.global	head_test
	.bss
	.align	2
	.type	head_test, %object
	.size	head_test, 4
head_test:
	.space	4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Sample: %x\012Codeword: %x \012Expanded: %x\012\012"
	.ascii	"\000"
	.align	2
.LC1:
	.ascii	"%d Shift\012Sample: %x\012Codeword: %x \012Expanded"
	.ascii	": %x\012\012\000"
	.align	2
.LC2:
	.ascii	"0x0000 Test\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r3, #61184
	strh	r3, [fp, #-24]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #8
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strb	r3, [fp, #-21]
	ldrh	r3, [fp, #-24]	@ movhi
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	compress_sample
	mov	r3, r0
	strb	r3, [fp, #-19]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r0, r3
	bl	expand_word
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-18]	@ movhi
	ldrh	r3, [fp, #-24]
	mov	r2, r3
	ldrb	ip, [fp, #-19]	@ zero_extendqisi2
	ldrh	r3, [fp, #-18]
	ldr	r0, .L7
	mov	r1, r2
	mov	r2, ip
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #1
	strh	r3, [fp, #-24]	@ movhi
	ldr	r3, [fp, #-16]
	rsb	r2, r3, #16
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mvn	r3, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3	@ movhi
	ldrh	r3, [fp, #-24]	@ movhi
	and	r3, r2, r3
	strh	r3, [fp, #-24]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #8
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strb	r3, [fp, #-21]
	ldrh	r3, [fp, #-24]	@ movhi
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	compress_sample
	mov	r3, r0
	strb	r3, [fp, #-19]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r0, r3
	bl	expand_word
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-18]	@ movhi
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldrh	r3, [fp, #-24]
	mov	ip, r3
	ldrb	r4, [fp, #-19]	@ zero_extendqisi2
	ldrh	r3, [fp, #-18]
	str	r3, [sp, #0]
	ldr	r0, .L7+4
	mov	r1, r2
	mov	r2, ip
	mov	r3, r4
	bl	printf
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L3
	mov	r3, #58112
	strh	r3, [fp, #-24]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #8
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strb	r3, [fp, #-21]
	ldrh	r3, [fp, #-24]	@ movhi
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	compress_sample
	mov	r3, r0
	strb	r3, [fp, #-19]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r0, r3
	bl	expand_word
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-18]	@ movhi
	ldrh	r3, [fp, #-24]
	mov	r2, r3
	ldrb	ip, [fp, #-19]	@ zero_extendqisi2
	ldrh	r3, [fp, #-18]
	ldr	r0, .L7
	mov	r1, r2
	mov	r2, ip
	bl	printf
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L4
.L5:
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #1
	strh	r3, [fp, #-24]	@ movhi
	ldr	r3, [fp, #-16]
	rsb	r2, r3, #16
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mvn	r3, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3	@ movhi
	ldrh	r3, [fp, #-24]	@ movhi
	and	r3, r2, r3
	strh	r3, [fp, #-24]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #8
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strb	r3, [fp, #-21]
	ldrh	r3, [fp, #-24]	@ movhi
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	compress_sample
	mov	r3, r0
	strb	r3, [fp, #-19]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r0, r3
	bl	expand_word
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-18]	@ movhi
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldrh	r3, [fp, #-24]
	mov	ip, r3
	ldrb	r4, [fp, #-19]	@ zero_extendqisi2
	ldrh	r3, [fp, #-18]
	str	r3, [sp, #0]
	ldr	r0, .L7+4
	mov	r1, r2
	mov	r2, ip
	mov	r3, r4
	bl	printf
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L4:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L5
	ldr	r0, .L7+8
	bl	puts
	mov	r3, #0
	strh	r3, [fp, #-24]	@ movhi
	ldrsh	r3, [fp, #-24]
	mov	r3, r3, asr #8
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strb	r3, [fp, #-21]
	ldrh	r3, [fp, #-24]	@ movhi
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	compress_sample
	mov	r3, r0
	strb	r3, [fp, #-19]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r0, r3
	bl	expand_word
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-18]	@ movhi
	ldrh	r3, [fp, #-24]
	mov	r2, r3
	ldrb	ip, [fp, #-19]	@ zero_extendqisi2
	ldrh	r3, [fp, #-18]
	ldr	r0, .L7
	mov	r1, r2
	mov	r2, ip
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.align	2
	.global	expand_word
	.type	expand_word, %function
expand_word:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strb	r3, [fp, #-13]
	mov	r3, #0
	strh	r3, [fp, #-10]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	and	r3, r3, #7
	strb	r3, [fp, #-7]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	and	r3, r3, #15
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r2, [fp, #-6]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	add	r3, r3, #1
	mov	r3, r2, asl r3
	strh	r3, [fp, #-10]	@ movhi
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L10
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	add	r2, r3, #5
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, r3	@ movhi
	ldrh	r3, [fp, #-10]	@ movhi
	orr	r3, r2, r3
	strh	r3, [fp, #-10]	@ movhi
.L10:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L11
	ldrh	r3, [fp, #-10]	@ movhi
	rsb	r3, r3, #0
	strh	r3, [fp, #-10]	@ movhi
.L11:
	ldrh	r3, [fp, #-10]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	expand_word, .-expand_word
	.align	2
	.global	compress_sample
	.type	compress_sample, %function
compress_sample:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-21]
	mov	r3, r2
	strb	r3, [fp, #-22]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #8
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldrb	r2, [fp, #-22]	@ zero_extendqisi2
	mov	r1, r3	@ movhi
	mov	r3, r2	@ movhi
	orr	r3, r1, r3
	strh	r3, [fp, #-12]	@ movhi
	ldrsh	r3, [fp, #-12]
	mov	r0, r3
	bl	get_sign
	mov	r3, r0
	strb	r3, [fp, #-9]
	ldrsh	r3, [fp, #-12]
	mov	r0, r3
	bl	get_magnitude
	mov	r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldrsh	r3, [fp, #-8]
	mov	r0, r3
	bl	get_chord
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrsh	r3, [fp, #-8]
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	get_step
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strb	r3, [fp, #-6]
	ldrb	r2, [fp, #-9]
	ldrb	r3, [fp, #-6]
	orr	r3, r2, r3
	and	r2, r3, #255
	ldrb	r3, [fp, #-5]
	orr	r3, r2, r3
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	compress_sample, .-compress_sample
	.align	2
	.global	get_step
	.type	get_step, %function
get_step:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	mov	r2, r1
	strh	r3, [fp, #-14]	@ movhi
	mov	r3, r2
	strb	r3, [fp, #-15]
	ldrsh	r2, [fp, #-14]
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	add	r3, r3, #1
	mov	r3, r2, asr r3
	and	r3, r3, #255
	and	r3, r3, #15
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	get_step, .-get_step
	.align	2
	.global	get_chord
	.type	get_chord, %function
get_chord:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-9]
	mov	r3, #12
	str	r3, [fp, #-8]
	b	.L18
.L21:
	ldrsh	r2, [fp, #-14]
	ldr	r3, [fp, #-8]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L19
	ldr	r3, [fp, #-8]
	and	r3, r3, #255
	sub	r3, r3, #5
	strb	r3, [fp, #-9]
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	b	.L20
.L19:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L18:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	bgt	.L21
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	str	r3, [fp, #-20]
.L20:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	get_chord, .-get_chord
	.align	2
	.global	get_magnitude
	.type	get_magnitude, %function
get_magnitude:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-6]
	cmp	r3, #0
	bge	.L24
	ldrh	r3, [fp, #-6]	@ movhi
	rsb	r3, r3, #0
	strh	r3, [fp, #-6]	@ movhi
.L24:
	ldrh	r3, [fp, #-6]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	get_magnitude, .-get_magnitude
	.align	2
	.global	get_sign
	.type	get_sign, %function
get_sign:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-6]
	cmp	r3, #0
	bge	.L27
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L28
.L27:
	mov	r3, #128
	str	r3, [fp, #-12]
.L28:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	get_sign, .-get_sign
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
