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

	doorOpened1:	db '----------------------            ---------------------', 10
	doorOpened2:	db '     /     /    /   /|           /     /     /    /   /', 10
	doorOpened3:	db '--------------------/|            -------------------  ', 10
	doorOpened4:	db '    |     |     |  | |            ------------------- |', 10
	doorOpened5:	db '--------------------/|            |                 |-|', 10
	doorOpened6:	db '      |      |     | |            |                 | |', 10
	doorOpened7:	db '--------------------/|         x| |                 |-|', 10
	doorOpened8:	db '    |     |     |  | |            |                 | |', 10
	doorOpened9:	db '--------------------/             |                 |-|', 10
	doorOpened10:	db '               fcf /              |0----()----()----| |', 10
	doorOpened11:	db '                  /            /                       ', 10
	doorOpened12:	db '                 /            /                        ', 10
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

	doorClosing1:		db '----------------------            ---------------------', 10
	doorClosing2:		db '     /     /    /   /|           /     /     /    /   /', 10
	doorClosing3:		db '--------------------/|            -------------------  ', 10
	doorClosing4:		db '    |     |     |  | |     -------------------    |  | ', 10
	doorClosing5:		db '--------------------/|     |                 |-------  ', 10
	doorClosing6:		db '      |      |     | |     |                 | |   |   ', 10
	doorClosing7:		db '--------------------/|  x| |                 |-------  ', 10
	doorClosing8:		db '    |     |     |  | |     |                 |   |   | ', 10
	doorClosing9:		db '--------------------/      |                 |-------  ', 10
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

	doorClosed1:	db '---------------------            -------------------------', 10
	doorClosed2:	db '    /     /    /   /|           /     /      /      /    /', 10
	doorClosed3:	db '-------------------/|            ----------------------   ', 10
	doorClosed4:	db '   |    |     |    |--------------------|    |    |    |  ', 10
	doorClosed5:	db '-------------------|                    |--------------   ', 10
	doorClosed6:	db '     |     |     | |                    |     |    |      ', 10
	doorClosed7:	db '-----------------x||                    |--------------   ', 10
	doorClosed8:	db '   |    |     |    |                    |    |    |    |  ', 10
	doorClosed9:	db '-------------------|                    |--------------   ', 10
	doorClosed10:	db '             fcf  /|0-----()-----()-----| fca             ', 10
	doorClosed11:	db '                 /            /                           ', 10
	doorClosed12:	db '                /            /                            ', 10
	doorClosed13:	db '               /            /                             ', 10
	doorClosed14:	db '              /            /                              ', 10
	doorClosed15:	db '             /            /                               ', 10
	doorClosed16:	db '            /            /                                ', 10
	doorClosed17:	db '    / \                                                   ', 10
	doorClosed18:	db '   /   \                                                  ', 10
	doorClosed19:	db '     |                                                    ', 10
	doorClosed20:	db '     |                                                    ', 10
	doorClosed21:	db '   |---|                                                  ', 10
	doorClosed22:	db '   | 0 | ba                                               ', 10
	doorClosed23:	db '   | 0 | bf                                               ', 10
	doorClosed24:	db '   |---|                                                  ', 10
	doorClosedLen:	equ $ - doorClosed1

	menu1: db '********** MENU ***********', 10
	menu2: db '* 0) Sair do programa     *', 10
	menu3: db '* 1) Abrir portão         *', 10
	menu4: db '* 2) Fechar portão        *', 10
	menu5: db '* 3) Botão de Emergência  *', 10
	menu6: db '***************************', 10
	menuLen: equ $ - menu1

	closedState: db 'O portao esta fechado', 10
	closedStateLen: equ $ - closedState

	openedState: db 'O portao esta aberto', 10
	openedStateLen: equ $ - openedState

	askState: db 'Digite ENTER para mudar o estado do portão, 0 para sair', 10
	askStateLen: equ $ - askState

	askEmerency: db 'O portão está fechando, entre com 0 para cancelar a ação. Se deseja continuar aperte ENTER', 10
	askEmerencyLen: equ $ - askEmerency

	action: db 0

section .bss
	num: resb 8

section .text
	global _start
	_start:
		mov r15, 48							; O programa sempre comecara com o portao fechado (0 em r15)
		call _runProgram

	_runProgram:
		call _printActualState	; Imprime o estado atual do portao
		print menu1, menuLen
		scan action, 1
		call _exitCondition
	ret

	_exitCondition:
		mov r14, [action]
		cmp r14, 48
		je .exitProgram
		jmp .continueProgram
		.continueProgram:
			call _changeState
			call _runProgram
		.exitProgram:
			exit
		ret

	_emergencyButton:
		print menu1, menuLen
		scan action, 1
		mov r13, [action]
		cmp r13, 51
		je .openDoor
		.openDoor:
			print doorOpening1, doorOpeningLen
			print doorOpened1, doorOpenedLen
			mov r15, 50							; apos abrir o portao, o estado eh mudado para aberto
			ret
		ret


	; Input:
	;		r15 - estado desejado
	;		r14 - 1 (em ascii)
	; Output:
	;		Estado de transicao do portao e estado final
	_changeState:
		cmp r15, 48								; se o estado atual eh fechado
		je .openDoor							; se o estado for fechado, abre o portao
		jmp .closeDoor							; se nao for, abre o portao
		.openDoor:								; abertura
			print doorOpening1, doorOpeningLen
			print doorOpened1, doorOpenedLen
			mov r15, 50							; apos abrir o portao, o estado eh mudado para aberto
			ret
		.closeDoor:								; fechamento
			print doorClosing1, doorClosingLen
			call _emergencyButton
			print doorClosed1, doorClosedLen
			mov r15, 48							; apos abrir o portao, o estado eh mudado
			ret
		ret

	_printActualState:
		cmp r15, 48
		je .printClosedState
		jmp .printOpenedState
		.printClosedState:
			print closedState, closedStateLen	; Printa que o portao esta fechado
			ret
		.printOpenedState:
			print openedState, openedStateLen	; Printa que o portao esta aberto
			ret
		ret