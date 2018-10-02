# Assembly Playground

## by [Matheus Almeida](https://twitter.com/mat_almeida)

# Usage

## Linux

```sh
$ nasm -felf64 hello.asm -o hello.o
$ ld -o hello hello.o
$ chmod u+x hello
$ ./hello
```

## Mac OSX

```sh
$ nasm -fmacho64 hello.asm -o hello.o
$ ld -o hello hello.o -e _start
$ chmod u+x hello
$ ./hello
```

## Links

-   https://pt.wikibooks.org/wiki/Assembly_no_Linux/Exemplos_de_uso_de_syscalls
