.data
vec: .long 1,2,3,4
nr: .long 4
fs: .asciz "suma celor %ld numere este %ld\n"
.text
proc1:
# push-uri si pop-uri in numar egal
# suma elem
push %ebp
mov %esp, %ebp
#reg calee-saved
push %esi
#var locale
mov $0, %eax
mov 12(%ebp), %ecx #n
mov 8(%ebp), %esi

begin:
add -4(%esi, %ecx, 4), %eax
loop begin

#depozitarea val de return in eax
#sterg var locale
# restarurare reg calee-saved
pop %esi
pop %ebp
ret
# stiva arata ca la intrare in procedura,
# in varf se afla deci adresa instructiunii mov 1, eax
# salt la adresa din varf
.global main
main:
mov nr, %ecx
mov $vec, %esi
push %ecx
push %ecx
push %esi
call proc1
addl $8, %esp
pop %ecx

push %eax
push %ecx
push $fs
call printf
add $12, %esp

# este adaugata pe stiva adresa lui mov 1, eax
# salt la proc


mov $1, %eax
xor %ebx, %ebx
int $0x80
