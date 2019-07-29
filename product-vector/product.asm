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
    mov rdi, STDIN      ; file handle 1 is stdout
    mov rsi, %1         ; address of string to output
    mov rdx, %2         ; number of bytes
    syscall

%endmacro

section .data
	digit:		 db 0,10

    teste:       db 'OMG', 10
    testeLen:    equ $ - teste

    fibArray:    dd 2, 1, 2, 3
    fibArrayLen: equ ($ - fibArray) / 4

section .text
	global _start
	_start:
		mov rsi, fibArray
        mov rdi, fibArrayLen - 1
        call _printArray
        exit


    _printArray:



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
