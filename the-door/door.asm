STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0	;Syscall
SYS_WRITE equ 1	;Syscall
SYS_EXIT equ 60	;Syscall

section .data
	doorString1:	db '----------------------            ---------------------', 10
	doorString2:	db '     /     /    /   /|           /     /     /    /   /', 10
	doorString3:	db '--------------------/|            -------------------  ', 10
	doorString4:	db '    |     |     |  | |     -------------------    |  | ', 10
	doorString5:	db '--------------------/|     |                 |-------  ', 10
	doorString6:	db '      |      |     | |     |                 | |   |   ', 10
	doorString7:	db '--------------------/|  x| |                 |-------  ', 10
	doorString8:	db '    |     |     |  | |     |                 |   |   | ', 10
	doorString9:	db '--------------------/      |                 |-------  ', 10
	doorString10:	db '               fcf /       |0----()----()----|  fca    ', 10
	doorString11:	db '                  /            /                       ', 10
	doorString12:	db '                 /    --->    /                        ', 10
	doorString13:	db '                /            /                         ', 10
	doorString14:	db '               /            /                          ', 10
	doorString15:	db '              /            /                           ', 10
	doorString16:	db '             /            /                            ', 10
	doorString17:	db '   / \                                                 ', 10
	doorString18:	db '  /   \                                                ', 10
	doorString19:	db '    |                                                  ', 10
	doorString20:	db '    |                                                  ', 10
	doorString21:	db '  |---|                                                ', 10
	doorString22:	db '  | 0 | ba                                             ', 10
	doorString23:	db '  | 0 | bf                                             ', 10
	doorString24:	db '  |---|                                                ', 10
	doorStringLen:	equ $ - doorString1

section .bss
	num: resb 8

section .text
	global _start
	_start:
		mov rsi, doorString1	;Message
		mov rdx, doorStringLen	;Message size
		call _print

		call _exit

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