segment	.bss
arr_1	resd 1
size_1	resd 1
arr_2	resd 1
size_2	resd 1
output	resd 1
output_size	resd 1

segment	.data
i 	dd 0
j 	dd 0
k	dd 0

segment	.text
global	cross_correlation_asm_full


cross_correlation_asm_full:
	push ebp
	mov ebp, esp



assigning:
	mov ebx, [ebp+8]
	mov [arr_1], ebx

	mov ebx, [ebp+12]
	mov [size_1], ebx

	mov ebx, [ebp+16]
	mov [arr_2], ebx

	mov ebx, [ebp+20]
	mov [size_2], ebx
	dec ebx
	mov [j], ebx

	mov ebx, [ebp+24]
	mov [output], ebx

	mov ebx, [ebp+28]
	mov [output_size], ebx
	
	mov ebx, dword [arr_2]
	mov eax, [ebx + 0]
zz:
	mov eax, [ebx + 4]
xx:
	mov eax, [ebx + 8]
yy:
	mov dword [i], 0
	mov dword [k], 0
	mov si, 4

loop:
	mov eax, [i]
	mul si
	mov ebx, dword [arr_1]
	mov ebx, [ebx + eax]

	mov eax, [j]
	mul si
	mov ecx, [arr_2]
	mov eax, [ecx + eax]
	
	mov edi, [k]
	mul ebx
	mov ebx, eax

	mov eax, [k]
	mul si
	mov edi, eax
	mov ecx, [output]
	mov eax, [ecx + edi]
	add ebx, eax
	mov [ecx + edi], ebx

	inc dword [i]
	inc dword [j]

cm1:
	mov eax, dword [i]
	cmp eax, dword [size_1]
	je cm3

cm2:
	mov eax, dword [j]
	cmp eax, dword [size_2]
	jne control
 
cm3:
	mov eax, dword [i]
	mov ebx, dword [size_2]
	cmp eax, dword [size_2]
	jb con1
	
	mov eax, [j]
	sub dword [i], eax
	inc dword [i]
	mov dword [j], 0

	inc dword [k]
	jmp control

con1:
	mov eax, [i]
	sub dword [j], eax
	dec dword [j]
	mov dword [i], 0

	inc dword [k]
	jmp control

control:
	mov eax, dword [k]
	cmp eax, dword [output_size]
	jne loop

last:
	pop ebp
	ret
	