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

    warningMessage: db 'Você não pode realizar esta ação, pois: ', 10
    warningMessageLen: equ $ - warningMessage

	closedState: db 'O portao esta fechado', 10
	closedStateLen: equ $ - closedState

	openedState: db 'O portao esta aberto', 10
	openedStateLen: equ $ - openedState

	action: db 0

section .text
	global _start
	_start:
    ; r15 = estado do portão
		mov r15, 48							; O programa sempre comecara com o portao fechado (0 em r15)
		call _runProgram

	_runProgram:
		call _printActualState
		mov rsi, menu1
		mov rdx, menuLen
		call _print
		call _exitCondition
	ret

	_exitCondition:
		mov rsi, action
		mov rdx, 2
		call _scan
		movzx r14, byte[action]
		cmp r14, 48
		je .exitProgram
    cmp r14, 51
    je .warningMessageExitCondition
		jmp .continueProgram
    .warningMessageExitCondition:
      call _actionWarning
			call _runProgram
		.continueProgram:
			call _changeState
			call _runProgram
		.exitProgram:
			call _exit
		ret

	_emergencyButton:
		mov rsi, menu1
		mov rdx, menuLen
		call _print
		mov rsi, action
		mov rdx, 2
		call _scan
		movzx r13, byte[action]
		cmp r13, 49
    je .warningMessageEmergencyButton
		cmp r13, 51
		je .openDoorEmergencyButton
    cmp r13, 50
    je .exitEmergency
		cmp r13, 48
		je .exit
    .warningMessageEmergencyButton:
      call _actionWarning
			ret
		.openDoorEmergencyButton:
			mov rsi, doorOpening1
			mov rdx, doorOpeningLen
			call _print
			mov rsi, doorOpened1
			mov rdx, doorOpenedLen
			call _print
			mov r15, 50
			ret
    .exitEmergency:
			mov rsi, doorClosed1
			mov rdx, doorClosedLen
			call _print
			mov r15, 48
      ret
		.exit:
			call _exit
			ret
		ret


	; Input:
	;		r15 - estado atual do portão
	;		r14 - 1 (em ascii)
	; Output:
	;		Estado de transicao do portao e estado final
	_changeState:
		cmp r14, 49
		je .openDoorChangeState
    cmp r14, 50
		je .closeDoorChangeState
    call _actionWarning
		.openDoorChangeState:
			cmp r15, 50
			je _actionWarning
			mov rsi, doorOpening1
			mov rdx, doorOpeningLen
			call _print
			mov rsi, doorOpened1
			mov rdx, doorOpenedLen
			call _print
			mov r15, 50
			ret
		.closeDoorChangeState:
			cmp r15, 48
			je _actionWarning
			mov rsi, doorClosing1
			mov rdx, doorClosingLen
			call _print
			call _emergencyButton
			ret
		ret


	; Input:
	;		r15 - estado atual do portão
	; Output:
	;		Imprime na tela o estado atual do portão
	_printActualState:
		cmp r15, 48
		je .printClosedState
		cmp r15, 50
		je .printOpenedState
		.printClosedState:
			mov rsi, closedState
			mov rdx, closedStateLen
			call _print
			ret
		.printOpenedState:
			mov rsi, openedState
			mov rdx, openedStateLen
			call _print
			ret
		ret

	; Input:
	;		RSI - Buffer
	;		RDX - Count
	; Output:
	;		Printa conteúdo do Buffer na tela
	_print:
		mov rax, 1
		mov rdi, 1
		syscall
		ret

	; Output:
	;		Finaliza a execução do programa
	_exit:
		mov rax, 60
		xor rdi, rdi
		syscall

	; Input:
	;		RSI - Buffer
	;		RDX - Count
	; Output:
	;		Salva input do úsuario no Buffer
	_scan:
		mov rax, 0
		mov rdi, 0
		syscall
		ret

	_actionWarning:
		mov rsi, warningMessage
		mov rdx, warningMessageLen
		call _print
		ret
