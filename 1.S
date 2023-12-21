.data
s: .long 0
n: .long 28
fs: .asciz "este\n"
.text
.global main
main:


#loop de la 1 la n/2
# call modula si adun la s

mov s,%eax
cmp %eax,n
jne final

#print
push $fs
add $4, %esp

final:

mov 1$, %eax
xor %ebx,%ebx
int 0x80
