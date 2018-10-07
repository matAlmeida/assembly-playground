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

## Links

-   Syscall Linux: http://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
-   Syscall MacOSX: https://opensource.apple.com//source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master
