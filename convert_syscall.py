#!/usr/bin/env python3
doc = """Assembly Syscall Converter.

Usage:
	convert_syscall -h|--help
	convert_syscall linux <input> [<output>]
	convert_syscall macosx <input> [<output>]

Options:
	-h --help		Show this screen.
	<input>			Path to the original Assembly
	<output>		Path to the converted Assembly (Optional. Otherwise the original file will be subscribed.)
"""

import os
import sys
from docopt import docopt

elf64_to_macho64 = {
    '0':	'0x2000003',  # Read
    '1':	'0x2000004',  # Write
    '60':	'0x2000001'  # Exit
}

macho64_to_elf64 = {
    '0x2000001':	'60',  # Exit
    '0x2000003':	'0',  # Read
    '0x2000004':	'1'  # Write
}


def __convert_syscall(inputFile, convertTable):
	output = ""
	with open(inputFile) as assembly:
		for line in assembly:
			nextLine = line
			if (";Syscall" in line) or (";syscall" in line):
				if ',' in line:
					sysCall = line.split(',')[-1].split('\t')[0].replace(' ', '')
				else:
					sysCall = line.split(' ')[-1].split('\t')[0].replace(' ', '')
				nextLine = line.replace(sysCall, convertTable[sysCall])

			output += nextLine
		assembly.close()
		return output


if __name__ == '__main__':
    arguments = docopt(doc, version='Assembly Syscall Converte 0.0.1')
    inputFile = arguments['<input>']
    existInputFile = os.path.isfile(os.path.abspath(inputFile))
    if not existInputFile:
        print("The file \"{0}\", doesn't exist. Check if you passed the right path and try again.".format(
            inputFile))
        exit(1)

    if arguments['linux']:
        output = __convert_syscall(inputFile, macho64_to_elf64)
        if arguments['<output>'] != None:
            outputFile = open(arguments['<output>'], 'w')
        else:
            outputFile = open(arguments['<input>'], 'r+')
            outputFile.truncate(0)
            outputFile = open(arguments['<input>'], 'w')

        outputFile.write(output)

    if arguments['macosx']:
        output = __convert_syscall(inputFile, elf64_to_macho64)
        if arguments['<output>'] != None:
            outputFile = open(arguments['<output>'], 'w')
        else:
            outputFile = open(arguments['<input>'], 'r+')
            outputFile.truncate(0)
            outputFile = open(arguments['<input>'], 'r+')

        outputFile.write(output)
