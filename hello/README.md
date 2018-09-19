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
