STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0	;Syscall
SYS_WRITE equ 1	;Syscall
SYS_EXIT equ 60	;Syscall

FLOAT_BIAS equ 63

section .data
	inputMsg:		db 'Float: '
	inputMsgLen:	equ $ - inputMsg

	outputMsg:		db 'Decimal: '
	outputMsgLen:	equ $ - outputMsg

	digit:			db 0,10

	signal:			db 0
	expoent:		times 7 db 0
	frac1:			times 4 db 0
	frac2:			times 4 db 0

section .bss
	string:		resb 16

section .text
	global _start

	_start:

		mov rsi, string
		mov rdx, 16
		call _scan
		call string_to_float

		mov	rsi, expoent
		mov rdx, 7
		call _print


		call _exit

	; Input:
	;		RSI - string com notação de FLOAT IEEE 754
	; FLOAT IEEE 754 (Modificado)
	;		Sinal:		1 bit
	; 		Expoente:	7 bits
	; 		Fração:		8 bits
	; Output:
	;		signal		- bit de sinal
	;		expoent		- bits de expoente
	;		frac1		- primeiros 4 bits de frac
	;		frac2		- últimos 4 bits de frac
	string_to_float:
		movzx rax, byte[rsi]
		mov [signal], rax

		xor rdi, rdi
		.loop_entry1:
		inc rsi
		movzx rax, byte[rsi]
		mov [expoent + rdi], rax
		inc rdi
		cmp rdi, 6
		jbe .loop_entry1

		xor rdi, rdi
		.loop_entry2:
		inc rsi
		movzx rax, byte[rsi]
		mov [frac1 + rdi], rax
		inc rdi
		cmp rdi, 3
		jbe .loop_entry2

		xor rdi, rdi
		.loop_entry3:
		inc rsi
		movzx rax, byte[rsi]
		mov [frac2 + rdi], rax
		inc rdi
		cmp rdi, 3
		jbe .loop_entry3
		ret

	; Input:
	;		RDX - N in 2^N
	; Output:
	;		RBX - 2^N
	two_pow:
		mov rbx, 1		; Valor inicial
		cmp rdx, 0
		jg .pow_loop	; if (N <= 0) {
		ret				; 	return
						; } else {
		.pow_loop:		; 	do {
		shl rbx, 1		; 		rbx *= 2
		dec rdx			;		n--
		cmp rdx, 0		;
		jg .pow_loop	; 	} while (N > 0)
		ret				; }

	; Input:
	;		RSI - Buffer da String
	; Output:
	;		RAX - Inteiro gerado a partir da String
	string_to_int:
		movzx rax, byte[rsi]	; Pega primeiro byte da string
		sub rax, '0'			; Transforma para "Inteiro"
		cmp al, 9				; Checa se é um digito (Entre 0-9)
		jbe .loop_entry			; Se for digito pula para o Loop_Entry
		xor rax, rax			; Se não for retorna 0
		ret
		.next_digit:			; Multiplica RAX por 10 e adiciona o proximo digito
		lea rax, [rax*4 + rax]	; Total *= 5
		lea rax, [rax*2 + rcx]	; Total = Total*2 + Digito
		.loop_entry:
		inc	rsi					; Pula para o segundo byte
		movzx ecx, byte[rsi]	; Move o byte para ECX
		sub ecx, '0'			; Transforma para "Inteiro"
		cmp ecx, 9				; Checa se é um digito (Entre 0-9)
		jbe .next_digit			; Se for digito pula para o Next_Digit
		ret						; Se não acabou os números válidos e retorna

	; Input:
	;		RAX - Dígito a ser impresso na tela
	; Output:
	;		Printa o Dígito na tela
	_printRAXDigit:
		add rax, '0'
		mov [digit], al
		mov rax, SYS_WRITE
		mov rdi, STDOUT
		mov rsi, digit
		mov rdx, 2
		syscall
		ret

	; Input:
	;		RSI - Buffer
	;		RDX - Count
	; Output:
	;		Printa conteúdo do Buffer na tela
	_print:
		mov rax, SYS_WRITE
		mov rdi, STDOUT
		syscall
		ret

	; Input:
	;		RSI - Buffer
	;		RDX - Count
	; Output:
	;		Salva input do úsuario no Buffer
	_scan:
		mov rax, SYS_READ
		mov rdi, STDIN
		syscall
		ret

	; Output:
	;		Finaliza a execução do programa
	_exit:
		mov rax, SYS_EXIT
		xor rdi, rdi
		syscall
