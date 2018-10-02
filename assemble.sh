#!/bin/bash
# Created by Matheus Almeida [https://github.com/matalmeida]
# ./assemble <Assembly File> <Output File Name>

assembly_file=$1
directory=$(temp=$( realpath "$assembly_file"  ) && dirname "$temp")
binary=$directory/$2
object=$directory/$2".o"

echo "Assembleling $assembly_file..."

format='unknown'
entry=''
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   format='elf64'
elif [[ "$unamestr" == 'Darwin' ]]; then
   format='macho64'
   entry='-e _start'
fi

if [ -f $binary ]; then
    rm $binary
fi
if [ -f $object ]; then
    rm $object
fi

nasm -f $format $assembly_file -o $object
ld -o $binary $object $entry