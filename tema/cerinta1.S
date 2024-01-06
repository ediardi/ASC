.data
ma: .space 1600
n: .space 4
m: .space 4
k: .space 4
p: .space 4
x: .space 4
y: .space 4
trash: .long 0
cript: .space 4
key: .space 320
word: .space 11
keyc: .space 11
printvar: .long 0
mask: .long 0x000000ff
formatscanf: .asciz "%ld"
formatprintf: .asciz "%ld "
formatpas: .asciz "%s"
formttrash: .asciz " %c"
formtchar: .asciz "%c"
formatendl: .asciz "\n"
oxstr: .asciz "0x"
hexp: .asciz "%02hhX"
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




cmpl $0,p
je p0


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
	
	addl $1,x
	addl $1,y

	mov $20,%edx
	mov x,%eax
	imul %edx
	add y,%eax
	mov $4, %edx
	imul %edx
	add $ma,%eax
	movl $1, (%eax)

loop readl

p0:

pushl $k
pushl $formatscanf
call scanf
popl %ebx
popl %ebx

cmpl $0,k
je k0

kloop:

	mov $0,%esi
	life0:
		
		inc %esi
		mov $0,%ecx
		life1:

			inc %ecx
			
			mov $0,%ebx
			
			inc %ecx
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			and $1,%edx
			add %edx,%ebx
			
			dec %esi
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			and $1,%edx
			add %edx,%ebx
			
			dec %ecx
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			and $1,%edx
			add %edx,%ebx
			
			dec %ecx
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			and $1,%edx
			add %edx,%ebx
			
			inc %esi
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			and $1,%edx
			add %edx,%ebx
			
			inc %esi
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			and $1,%edx
			add %edx,%ebx
			
			inc %ecx
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			and $1,%edx
			add %edx,%ebx
			
			inc %ecx
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			and $1,%edx
			add %edx,%ebx
			
			dec %ecx
			dec %esi
			
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			
			cmp $2,%ebx
			jl less2
			cmp $3,%ebx
			je case3
			cmp $4,%ebx
			jge more4
			
			jmp endbranch
			
			less2:
			mov $0,%edx
			jmp endbranch
			more4:
			mov $0,%edx
			jmp endbranch
			case3:
			mov $1,%edx
			endbranch:
			add  %edx,(%eax)
			add  %edx,(%eax)
		
		cmp %ecx,m
		jne life1

	cmp n,%esi
	jne life0
	mov $0,%esi
	set0:
		
		inc %esi
		mov $0,%ecx
		set1:

			inc %ecx
			mov $20,%edx
			mov %esi,%eax
			imul %edx
			add %ecx,%eax
			mov $4, %edx
			imul %edx
			add $ma,%eax
			mov (%eax),%edx
			shr $1,%edx
			mov %edx,(%eax)
			
			
		cmp %ecx,m
		jne set1

	cmp n,%esi
	jne set0

subl $1,k
jnz kloop

k0:

addl $2,n
addl $2,m

mov $0,%eax

mov $0,%esi
print0:
	
	mov $0,%ecx
	print1:
	
		push %eax
		mov $20,%edx
		mov %esi,%eax
		imul %edx
		add %ecx,%eax
		mov $4, %edx
		imul %edx
		add $ma,%eax
		mov (%eax),%edx
		popl %eax
		
		lea key,%edi
		add %eax,%edi
		mov %edx,(%edi)
		
		
		add $4,%eax
		cmp $320,%eax
		je done
		
		inc %ecx
	cmp %ecx,m
	jne print1

inc %esi
cmp n,%esi
jne print0





mov %eax,%ecx
mov $0,%ebx

complete:

lea key,%esi
add %ecx,%esi
lea key,%edi
add %ebx,%edi

mov (%edi),%edi
mov %edi,(%esi)

add $4,%ebx
cmp %ebx,%eax
jne notlenght
	mov $0,%ebx
notlenght:

add $4,%ecx
cmp $320,%ecx
jne complete

done:

mov $0,%ecx
mov $0,%eax

compres0:

	mov $0,%esi
	mov $0,%edx
	compres1:
		
		lea key,%ebx
		add %eax,%ebx
		mov (%ebx),%edi
		shl $1,%edx
		add %edi,%edx
		
		inc %esi
		add $4,%eax
		cmp $8,%esi
	jne compres1
	
	lea keyc,%ebx
	add %ecx,%ebx
	mov %dl,(%ebx)
	
inc %ecx
cmp $10,%ecx
jne compres0

pushl $cript
pushl $formatscanf
call scanf
popl %ebx
popl %ebx

cmpl $0,cript
je encript

decript:

pushl $trash
pushl $formttrash
call scanf
popl %ebx
popl %ebx
pushl $trash
pushl $formttrash
call scanf
popl %ebx
popl %ebx

mov $0,%ecx
whilec:
	push %ecx
	pushl $trash
	pushl $hexp
	call scanf
	popl %ebx
	popl %ebx
	popl %ecx
	cmp $1,%eax
	jne final
	
	mov trash,%ebx
	lea keyc,%eax
	add %ecx,%eax
	mov (%eax),%edx
	xor %ebx,%edx
	
	and mask,%edx
	mov %edx,printvar

	pusha
		push printvar
		push $formtchar
		call printf
		popl %ebx
		popl %ebx
		push $0
		call fflush
		popl %ebx
	popa

	inc %ecx
jmp whilec

encript:

pusha
push $oxstr
call printf
popl %ebx
popa

pushl $word
call gets
popl %ebx
pushl $word
call gets
popl %ebx

mov $0,%ecx
hexaprint:


	lea word,%eax
	add %ecx,%eax
	mov (%eax),%ebx

	cmp $0,%bl
	je final
	lea keyc,%eax
	add %ecx,%eax
	mov (%eax),%edx
	xor %ebx,%edx

	b1:
	and mask,%edx
	mov %edx,printvar
	movb %dl,(%eax)

	pusha
		push printvar
		push $hexp
		call printf
		popl %ebx
		popl %ebx
		push $0
		call fflush
		popl %ebx
	popa

	inc %ecx
	cmp $10,%ecx
jne hexaprint


#whapp exemplu task0
#cazul cu 0X

final:
push $formatendl
call printf
popl %ebx

push $0
call fflush
popl %ebx
mov $1,%eax
xor %ebx,%ebx
int $0x80
