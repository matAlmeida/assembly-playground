STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0	;Syscall
SYS_WRITE equ 1	;Syscall
SYS_EXIT equ 60	;Syscall

section .data
	welcomeMsg: 	db 'Converter de Int para Float', 10
	welcomeMsgLen:	equ $ - welcomeMsg

	inputMsg:		db 'Inteiro: '
	inputMsgLen:	equ $ - inputMsg

	outputMsg:		db 'Float: '
	outputMsgLen:	equ $ - outputMsg

	digit: db 0,10

section .bss
	number:	resb 16

section .text
	global _start

	_start:
		mov rsi, inputMsg
		mov rdx, inputMsgLen
		call _print

		mov rsi, number
		mov rdx, 16
		call _scan
		call string_to_int

		mov rsi, outputMsg
		mov rdx, outputMsgLen
		call _print

		mov rsi, rax
		mov rdx, 16
		call _print

		call _exit

	string_to_int:
		movzx rax, byte[rsi]	; Pega primeiro byte da string
		sub rax, '0'			; Transforma para "Inteiro"
		cmp al, 9				; Checa se é um digito (Entre 0-9)
		jbe .loop_entry			; Se for digito pula para o Loop_Entry
		xor rax, rax			; Se não for retorna 0
		ret
		.next_digit:			; Salva o digito em RAX
		lea rax, [rax*4 + 4]	; Total *= 5
		lea rax, [rax*2 + rcx]	; Total = Total*2 + Digito
		.loop_entry:
		inc	rsi					; Pula para o segundo byte
		movzx ecx, byte[rsi]	; Move o byte para ECX
		sub ecx, '0'			; Transforma para "Inteiro"
		cmp ecx, 9				; Checa se é um digito (Entre 0-9)
		jbe .next_digit			; Se for digito pula para o Next_Digit
		ret						; Se não acabou os números válidos e retorna

	_printRAXDigit:
		add rax, '0'
		mov [digit], al
		mov rax, SYS_WRITE
		mov rdi, STDOUT
		mov rsi, digit
		mov rdx, 2
		syscall
		ret

	_print: ; rsi = Buffer, rdx = Count
		mov rax, SYS_WRITE
		mov rdi, STDOUT
		syscall
		ret

	_scan: ; rsi = Buffer, rdx = Count
		mov rax, SYS_READ
		mov rdi, STDIN
		syscall
		ret

	_exit:
		mov rax, SYS_EXIT
		xor rdi, rdi
		syscall
