global _start

section .data
	userMsg: db 'Digite um numero: '
	dispMsg: db 'O numero foi: '

section .bss
	num: resb 8

section .text
_start:
	mov rax, 1			;Syscall Write
	mov rdi, 1			;File Descriptor (stdout)
	mov rsi, userMsg	;Message
	mov rdx, 18			;Message size
	syscall

	mov rax, 0			;Syscall Read
	mov rdi, 0			;File Descriptor (stdin)
	mov rsi, num
	mov rdx, 8
	syscall

	mov rax, 1			;syscall
	mov rdi, 1
	mov rsi, dispMsg
	mov rdx, 14
	syscall

	mov rax, 1			;syscall
	mov rdi, 1
	mov rsi, num
	mov rdx, 8
	syscall

	mov rax, 60			;Syscall Exit
	xor rdi, rdi
	syscall