#f(x)=x+4
#g(y)=f(y) + f(y+1)

.data
fs: .asciz "f(5) + 3g(1) = %ld\n"
.text
f:
push %ebp
mov %esp, %ebp

mov 8(%ebp), %eax
add $4, %eax
#val de returnat e depozitata in eax

pop %ebp
ret
g:
push %ebp
mov %esp, %ebp
push %ebx

mov 8(%ebp), %eax #eax=y
push %eax #salvarea reg caller saved
push %eax #argumentul
call f
#eax = f(y)
mov %eax, %ebx
add $4, %esp
pop %eax #restaurare

inc %eax
push %eax
call f
add $4, %esp
#eax = f(y+1), ebx= f(y)
add %ebx, %eax

pop %ebx
pop %ebp
ret

.global main
main:

push $5
call f
add $4, %esp
mov %eax, %ebx

push $1
call g
add $4, %esp

mov $3, %ecx
mul %ecx # eax= 3*eax

add %ebx, %eax

push %eax
push $fs
call printf
add $8, %esp


mov $1, %eax
xor %ebx, %ebx
int $0x80
