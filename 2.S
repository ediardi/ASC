.data
n: .long 0
x: .long 0
fs: .asciz "%ld"
fps: .asciz "%ld\n"
.text
.global main
main:

pushl $n
pushl $fs
call scanf
popl %eax
popl %eax

movl n,%ecx
etloop:
pusha
pushl $x
pushl $fs
call scanf
popl %eax
popl %eax
popa
pushl x

loop etloop

movl n,%ecx
loop2:
popl x
pusha
pushl x
pushl $fps
call printf
popl %eax
popl %eax
popa

loop loop2

pushl n
pushl $fps
call printf
popl %eax
popl %eax

mov $1, %eax
xor %ebx,%ebx
int $0x80
