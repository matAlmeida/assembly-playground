#!/bin/bash
# Created by Matheus Almeida [https://github.com/matalmeida]

#Polyfill for MacOsX
realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

usage="\n$(basename "$0") [-h | --help] <Assembly_File> <Output_Name>
\n\n
where:\n
\t	-h, --help	show this help text\n
inputs:\n
\t	<Assembly_File>	path to the assembly file\n
\t	<Output_Name>	name of the output file"

if [ $# -eq 0 ]; then
    echo -e "No arguments supplied.\n\nRun $0 -h to see a helpful text"
	exit 1
fi

if [ "$1" == "-h" ]; then
  echo -e $usage
  exit 0
fi

if [ "$1" == "--help" ]; then
  echo -e $usage
  exit 0
fi

assembly_file=$1
directory=$(temp=$( realpath "$assembly_file"  ) && dirname "$temp")
binary=$directory/$2
object=$directory/$2".o"

echo "Assembling $assembly_file..."

format='unknown'
entry=''
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   format='elf64'
elif [[ "$unamestr" == 'Darwin' ]]; then
   format='macho64'
   entry='-e _start -macosx_version_min 10.8 -lSystem'
fi

if [ -f $binary ]; then
    rm $binary
fi
if [ -f $object ]; then
    rm $object
fi

nasm -f $format $assembly_file -o $object
ld -o $binary $object $entry
