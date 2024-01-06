.data
ma: .space 1600
n: .space 4
m: .space 4
k: .space 4
p: .space 4
x: .space 4
y: .space 4
fin: .long 0
fout: .long 0
formatscanf: .asciz "%ld"
formatprintf: .asciz "%ld "
formatendl: .asciz "\n"
tempin: .asciz "in.txt"
tempinr: .asciz "r"
tempout: .asciz "out.txt"
tempoutw: .asciz "w"
.text
.global main
main:
push $tempinr
push $tempin
call fopen
popl %ebx
popl %ebx
mov %eax,fin

push $tempoutw
push $tempout
call fopen
popl %ebx
popl %ebx
mov %eax,fout


pushl $n
pushl $formatscanf
push fin
call fscanf
popl %ebx
popl %ebx
popl %ebx

pushl $m
pushl $formatscanf
push fin
call fscanf
popl %ebx
popl %ebx
popl %ebx

pushl $p
pushl $formatscanf
push fin
call fscanf
popl %ebx
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
	push fin
	call fscanf
	popl %ebx
	popl %ebx
	popl %ebx

	pushl $y
	pushl $formatscanf
	push fin
	call fscanf
	popl %ebx
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
push fin
call fscanf
popl %ebx
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

mov $0,%esi
print0:
	
	inc %esi
	mov $0,%ecx
	print1:

		inc %ecx
		
		mov $20,%edx
		mov %esi,%eax
		imul %edx
		add %ecx,%eax
		mov $4, %edx
		imul %edx
		add $ma,%eax
		mov (%eax),%edx
		mov %edx,%ebx

		push %ecx
		push %ebx
		push $formatprintf
		push fout
		call fprintf
		popl %ebx
		popl %ebx
		popl %ebx

		push $0
		call fflush
		popl %ebx
		popl %ecx
	
	cmp %ecx,m
	jne print1

	pusha
	push $formatendl
	push fout
	call fprintf
	popl %ebx
	popl %ebx
	push $0
	call fflush
	popl %ebx
	popa

cmp n,%esi
jne print0

push fout
call fclose
popl %ebx

push fin
call fclose
popl %ebx

mov $1,%eax
xor %ebx,%ebx
int $0x80
