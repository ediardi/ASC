.data
v: .long 2,2,2,2
n: .long 4
s: .long 0

.text
.global main
main:
mov $0, %ecx
mov $v, %edi

begin:

cmp n, %ecx
je final

mov (%edi), %eax
add %eax, s
inc %ecx
add $4, %edi


jmp begin



final:
mov $1,%eax
xor %ebx,%ebx
int $0x80
