STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0	;Syscall
SYS_WRITE equ 1	;Syscall
SYS_EXIT equ 60	;Syscall

STRING_TERMINATOR equ 0

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
	string: resb 16

section .text
	global _start

	_start:
		mov rax, 1234
		call _print_uInt

		mov rsi, string
		mov rdx, 9
		call _print

		call _exit

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

	int_to_string:
		add rsi,9
		mov byte [rsi],STRING_TERMINATOR

		mov rbx,10
		.next_digit:
		xor rdx,rdx			; Clear rdx prior to dividing rdx:eax by rbx
		div rbx				; rax /= 10
		add dl,'0'			; Convert the remainder to ASCII
		dec rsi				; store characters in reverse order
		mov [rsi],dl
		test rax,rax
		jnz .next_digit		; Repeat until rax==0
		mov rax,rsi
		ret

	_print_uInt:			; rax = 1234
		mov rdi, 10
		.redo:				; do {
		mov rbx, rax		; rbx = 1234
		div rdi				; rax = 1234 / 10 = 123
		mul rdi				; rax = 123 * 10 = 1230
		sub rbx, rax		; rbx = 1234 - 1230 = 4
		div rdi				; rax = 1230 / 10 = 123
		mov rsi, rax		; rsi = 123
		mov rax, rbx		; rax = 4
		call _printRAXDigit	; print '4'
		mov rax, rsi		; rax = 123
		cmp rax, 10
		jge .redo			; } while (rax >= 10);
		call _printRAXDigit
		ret
		; add rax, '0'
		; mov [string], al
		; mov rax, rbx


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
