global _start

section .data
mensagem: db 'Hello my paladin', 10

section .text
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, mensagem
	mov rdx, 17
	syscall

	mov rax, 60 ; número da syscall exit
	xor rdi, rdi
	syscall
