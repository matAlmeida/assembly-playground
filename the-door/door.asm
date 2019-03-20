STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0	;Syscall
SYS_WRITE equ 1	;Syscall
SYS_EXIT equ 60	;Syscall

section .data
	doorOpening1:	db '----------------------            ---------------------', 10
	doorOpening2:	db '     /     /    /   /|           /     /     /    /   /', 10
	doorOpening3:	db '--------------------/|            -------------------  ', 10
	doorOpening4:	db '    |     |     |  | |     -------------------    |  | ', 10
	doorOpening5:	db '--------------------/|     |                 |-------  ', 10
	doorOpening6:	db '      |      |     | |     |                 | |   |   ', 10
	doorOpening7:	db '--------------------/|  x| |                 |-------  ', 10
	doorOpening8:	db '    |     |     |  | |     |                 |   |   | ', 10
	doorOpening9:	db '--------------------/      |                 |-------  ', 10
	doorOpening10:	db '               fcf /       |0----()----()----|  fca    ', 10
	doorOpening11:	db '                  /            /                       ', 10
	doorOpening12:	db '                 /    --->    /                        ', 10
	doorOpening13:	db '                /            /                         ', 10
	doorOpening14:	db '               /            /                          ', 10
	doorOpening15:	db '              /            /                           ', 10
	doorOpening16:	db '             /            /                            ', 10
	doorOpening17:	db '   / \                                                 ', 10
	doorOpening18:	db '  /   \                                                ', 10
	doorOpening19:	db '    |                                                  ', 10
	doorOpening20:	db '    |                                                  ', 10
	doorOpening21:	db '  |---|                                                ', 10
	doorOpening22:	db '  | 0 | ba                                             ', 10
	doorOpening23:	db '  | 0 | bf                                             ', 10
	doorOpening24:	db '  |---|                                                ', 10
	doorOpeningLen:	equ $ - doorOpening1

	doorClosing1:	db '----------------------            ---------------------', 10
	doorClosing2:	db '     /     /    /   /|           /     /     /    /   /', 10
	doorClosing3:	db '--------------------/|            -------------------  ', 10
	doorClosing4:	db '    |     |     |  | |     -------------------    |  | ', 10
	doorClosing5:	db '--------------------/|     |                 |-------  ', 10
	doorClosing6:	db '      |      |     | |     |                 | |   |   ', 10
	doorClosing7:	db '--------------------/|  x| |                 |-------  ', 10
	doorClosing8:	db '    |     |     |  | |     |                 |   |   | ', 10
	doorClosing9:	db '--------------------/      |                 |-------  ', 10
	doorClosing10:	db '               fcf /       |0----()----()----|  fca    ', 10
	doorClosing11:	db '                  /            /                       ', 10
	doorClosing12:	db '                 /    <---    /                        ', 10
	doorClosing13:	db '                /            /                         ', 10
	doorClosing14:	db '               /            /                          ', 10
	doorClosing15:	db '              /            /                           ', 10
	doorClosing16:	db '             /            /                            ', 10
	doorClosing17:	db '   / \                                                 ', 10
	doorClosing18:	db '  /   \                                                ', 10
	doorClosing19:	db '    |                                                  ', 10
	doorClosing20:	db '    |                                                  ', 10
	doorClosing21:	db '  |---|                                                ', 10
	doorClosing22:	db '  | 0 | ba                                             ', 10
	doorClosing23:	db '  | 0 | bf                                             ', 10
	doorClosing24:	db '  |---|                                                ', 10
	doorClosingLen:	equ $ - doorClosing1

section .bss
	num: resb 8

section .text
	global _start
	_start:
		mov rsi, doorOpening1	;Message
		mov rdx, doorOpeningLen	;Message size
		call _print
		
		mov rsi, doorClosing1	;Message
		mov rdx, doorClosingLen	;Message size
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