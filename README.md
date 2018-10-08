# Assembly Playground

## by [Matheus Almeida](https://twitter.com/mat_almeida)

# Usage

-   You can use the script that i created `assemble.sh` or the following commands

## Linux

```sh
$ nasm -f elf64 hello.asm -o hello.o
$ ld -o hello hello.o
$ ./hello
```

## Mac OSX

```sh
$ nasm -f macho64 hello.asm -o hello.o
$ ld -o hello hello.o -e _start
$ ./hello
```

# Extras

-   If you are having `BUS ERROR` probrably you are using wrong `syscall` for your operational system.
-   I created a script `convert_syscall.py` that you can convert your `syscall`.
-   `NEED PYTHON 3.X`
-   To make this script work you need to add a comment `;Syscall` or `;syscall` on every line you define a `syscall`
    -   ex:
    ```assembly
    	mov rax, 1			;Syscall Write
    	mov rdi, 1			;File Descriptor (stdout)
    	mov rsi, userMsg		;Message
    	mov rdx, 18			;Message size
    	syscall
    ```

```sh
Usage:
	convert_syscall -h|--help
	convert_syscall linux <input> [<output>] # Will convert to Linux Syscall Number
	convert_syscall macosx <input> [<output>] # Will convert to MacOSX Syscall Number

Options:
	-h --help		Show this screen.
	<input>			Path to the original Assembly
	<output>		Path to the converted Assembly (Optional. Otherwise the original file will be subscribed.)
```

## Links

-   Syscall Linux: http://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
-   Syscall MacOSX: https://opensource.apple.com//source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master
