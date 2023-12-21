.data
	x: .long 16
	y: .long 1
	s1: .long 0
	s2: .long 0
	yest: .asciz "True"
	note: .asciz "False"
.text
.global main
main:
	movl x, %eax
	sar $4, %eax
	movl %eax, s1
	
	movl y, %eax
	sal $4, %eax
	addl %eax,s1
	
check:

	movl x, %eax
	movl $0, %edx
	movl $16, %ebx
	div %ebx
	movl %eax, s2
	
	movl y, %eax
	movl $16, %ebx
	mul %ebx
	add %eax, s2
	
	movl s1, %eax
	cmp %eax, s2
	jne et
	jmp et2
	
et:
	
	mov $4, %eax
	mov $1, %ebx
	mov $note, %ecx
	mov $5, %edx
	int $0x80
	jmp check2
	
et2:
	mov $4, %eax
	mov $1, %ebx
	mov $yest, %ecx
	mov $4, %edx
	int $0x80
	jmp check2

check2:

	mov $1, %eax
	mov $0, %ebx
	int $0x80
	
