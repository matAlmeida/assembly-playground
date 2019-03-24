STDIN equ 0
STDOUT equ 1
STDERR equ 2

SYS_READ equ 0	;Syscall
SYS_WRITE equ 1	;Syscall
SYS_EXIT equ 60	;Syscall

	; Output:
	;		Finaliza a execução do programa
%macro exit 0
    mov rax, SYS_EXIT   ; system call for exit
    xor rdi, rdi        ; exit code 0
    syscall             ; invoke operating system to exit
%endmacro

	; Input:
	;		RSI - Buffer
	;		RDX - Count
	; Output:
	;		Printa conteúdo do Buffer na tela
%macro print 2

    mov rax, SYS_WRITE  ; systemcall for write
    mov rdi, STDOUT     ; file handle 1 is stdout
    mov rsi, %1         ; address of string to output
    mov rdx, %2         ; number of bytes
    syscall

%endmacro

	; Input:
	;		RSI - Buffer
	;		RDX - Count
	; Output:
	;		Salva input do úsuario no Buffer
%macro scan 2

    mov rax, SYS_READ   ; systemcall for read
    mov rdi, STDIN     ; file handle 1 is stdout
    mov rsi, %1         ; address of string to output
    mov rdx, %2         ; number of bytes
    syscall

%endmacro

section .data
	doorOpening1:	  db '----------------------            ---------------------', 10
	doorOpening2:	  db '     /     /    /   /|           /     /     /    /   /', 10
	doorOpening3:	  db '--------------------/|            -------------------  ', 10
	doorOpening4:	  db '    |     |     |  | |     -------------------    |  | ', 10
	doorOpening5:	  db '--------------------/|     |                 |-------  ', 10
	doorOpening6:	  db '      |      |     | |     |                 | |   |   ', 10
	doorOpening7:	  db '--------------------/|  x| |                 |-------  ', 10
	doorOpening8:	  db '    |     |     |  | |     |                 |   |   | ', 10
	doorOpening9:	  db '--------------------/      |                 |-------  ', 10
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

	doorOpened1:	db '----------------------            ---------------------', 10
	doorOpened2:	db '     /     /    /   /|           /     /     /    /   /', 10
	doorOpened3:	db '--------------------/|            -------------------  ', 10
	doorOpened4:	db '    |     |     |  | |     -------------------    |  | ', 10
	doorOpened5:	db '--------------------/|     |                 |-------  ', 10
	doorOpened6:	db '      |      |     | |     |                 | |   |   ', 10
	doorOpened7:	db '--------------------/|  x| |                 |-------  ', 10
	doorOpened8:	db '    |     |     |  | |     |                 |   |   | ', 10
	doorOpened9:	db '--------------------/      |                 |-------  ', 10
	doorOpened10:	db '               fcf /       |0----()----()----|  fca    ', 10
	doorOpened11:	db '                  /            /                       ', 10
	doorOpened12:	db '                 /    --->    /                        ', 10
	doorOpened13:	db '                /            /                         ', 10
	doorOpened14:	db '               /            /                          ', 10
	doorOpened15:	db '              /            /                           ', 10
	doorOpened16:	db '             /            /                            ', 10
	doorOpened17:	db '   / \                                                 ', 10
	doorOpened18:	db '  /   \                                                ', 10
	doorOpened19:	db '    |                                                  ', 10
	doorOpened20:	db '    |                                                  ', 10
	doorOpened21:	db '  |---|                                                ', 10
	doorOpened22:	db '  | 0 | ba                                             ', 10
	doorOpened23:	db '  | 0 | bf                                             ', 10
	doorOpened24:	db '  |---|                                                ', 10
	doorOpenedLen:	equ $ - doorOpened1

	doorClosing1:	  db '----------------------            ---------------------', 10
	doorClosing2:	  db '     /     /    /   /|           /     /     /    /   /', 10
	doorClosing3:	  db '--------------------/|            -------------------  ', 10
	doorClosing4:	  db '    |     |     |  | |     -------------------    |  | ', 10
	doorClosing5:	  db '--------------------/|     |                 |-------  ', 10
	doorClosing6:	  db '      |      |     | |     |                 | |   |   ', 10
	doorClosing7:	  db '--------------------/|  x| |                 |-------  ', 10
	doorClosing8:	  db '    |     |     |  | |     |                 |   |   | ', 10
	doorClosing9:	  db '--------------------/      |                 |-------  ', 10
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

	doorClosed1:	db '----------------------            ---------------------', 10
	doorClosed2:	db '     /     /    /   /|           /     /     /    /   /', 10
	doorClosed3:	db '--------------------/|            -------------------  ', 10
	doorClosed4:	db '    |     |     |  | |     -------------------    |  | ', 10
	doorClosed5:	db '--------------------/|     |                 |-------  ', 10
	doorClosed6:	db '      |      |     | |     |                 | |   |   ', 10
	doorClosed7:	db '--------------------/|  x| |                 |-------  ', 10
	doorClosed8:	db '    |     |     |  | |     |                 |   |   | ', 10
	doorClosed9:	db '--------------------/      |                 |-------  ', 10
	doorClosed10:	db '               fcf /       |0----()----()----|  fca    ', 10
	doorClosed11:	db '                  /            /                       ', 10
	doorClosed12:	db '                 /    <---    /                        ', 10
	doorClosed13:	db '                /            /                         ', 10
	doorClosed14:	db '               /            /                          ', 10
	doorClosed15:	db '              /            /                           ', 10
	doorClosed16:	db '             /            /                            ', 10
	doorClosed17:	db '   / \                                                 ', 10
	doorClosed18:	db '  /   \                                                ', 10
	doorClosed19:	db '    |                                                  ', 10
	doorClosed20:	db '    |                                                  ', 10
	doorClosed21:	db '  |---|                                                ', 10
	doorClosed22:	db '  | 0 | ba                                             ', 10
	doorClosed23:	db '  | 0 | bf                                             ', 10
	doorClosed24:	db '  |---|                                                ', 10
	doorClosedLen:	equ $ - doorClosed1

	askState: db 'Digite 1 para abrir o portão e 2 para fechar', 10
	askStateLen: equ $ - askState

	state: db 0

section .bss
	num: resb 8

section .text
	global _start
	_start:
		print askState, askStateLen
		scan state, 1
		call _chooseState

		exit

	; Input:
	;		r15 - estado desejado
	;		r14 - 1 (em ascii)
	; Output:
	;		Estado de transicao do portao e estado final
	_chooseState:
		mov r15, [state]											; estado é passado para r15
		mov r14, 49														; num 1(ascii) é passado para r14
		cmp r15, r14													; comparacao entre o estado passado e 1
		je .openDoor													; se o estado passado for 1, abre o portao
		jmp .closeDoor												; se nao for, fecha o portao
		.openDoor:														; abertura
			print doorOpening1, doorOpeningLen
			print doorOpened1, doorOpenedLen
			ret
		.closeDoor:														; fechamento
			print doorClosing1, doorClosingLen
			print doorClosed1, doorClosedLen
			ret
		ret