.data
ma: .space 1600
n: .space 4
m: .space 4
k: .space 4
p: .space 4
x: .space 4
y: .space 4
formatscanf: .asciz "%ld"
formatprintf: .asciz "%ld "
formatendl: .asciz "\n"
.text
.global main
main:
pushl $n
pushl $formatscanf
call scanf
popl %ebx
popl %ebx

pushl $m
pushl $formatscanf
call scanf
popl %ebx
popl %ebx

pushl $p
pushl $formatscanf
call scanf
popl %ebx
popl %ebx

mov n,%esi
inc %esi

init0:

mov m,%ecx
inc %ecx
init1:

mov $20,%edx
mov %esi,%eax
imul %edx
add %ecx,%eax
mov $4, %edx
imul %edx
add $ma,%eax
movl $0, (%eax)

dec %ecx
jns init1


dec %esi
jns init0







mov p,%ecx
readl:
push %ecx
pushl $x
pushl $formatscanf
call scanf
popl %ebx
popl %ebx

pushl $y
pushl $formatscanf
call scanf
popl %ebx
popl %ebx
popl %ecx

mov $20,%edx
mov x,%eax
imul %edx
add y,%eax
mov $4, %edx
imul %edx
add $ma,%eax
movl $1, (%eax)

loop readl

pushl $k
pushl $formatscanf
call scanf
popl %ebx
popl %ebx


mov n,%esi

print0:

mov m,%ecx

print1:


mov $20,%edx
mov %esi,%eax
imul %edx
add %ecx,%eax
mov $4, %edx
imul %edx
add $ma,%eax
mov (%eax),%edx
mov %edx,x

push %ecx
push $x
push $formatprintf
call printf
popl %ebx
popl %ebx
popl %ecx

loop print1

pusha
push $formatendl
call printf
popl %ebx
popa

dec %esi
jnz print0

mov $1,%eax
xor %ebx,%ebx
int $0x80
