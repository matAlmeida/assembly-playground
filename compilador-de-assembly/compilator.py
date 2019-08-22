#!/usr/bin/env python
import re

filename = "../the-door/door.asm"

# Make a regex that matches if any of our regexes match.
instructions = ['je', 'jmp', 'xor', 'call', 'ret', 'syscall', 'mov', 'movzx']
mergedInstructions = "(" + ")|(".join(instructions) + ")"
registers = ['rax', 'rdi', 'rsi', 'rdx', 'r15', 'r14', 'r13']
mergedRegisters = "(" + ")|(".join(registers) + ")"

with open(filename) as f:
    for line in f:
        line = line.split(';')[0]

        instructions = re.search(mergedInstructions, line)
        registers = re.search(mergedRegisters, line)
        label = re.match('\s*(.+):\n', line)
        section = re.search('^section \.(.+)', line)
        data = re.search('^\s*\w+:\s*.+\n', line)
        immediate = re.search('\d+', line)
        dataAddress = re.search('mov (rdx|rsi)[,\/] (\w+)', line)

        if data != None:
            print('<DATA>', data.group(0)[:-1])
            continue
        if label != None:
            print('<LABEL>', label.group(1))
        if instructions != None:
            print('<INST>', instructions.group(0))
        if registers != None:
            print('<REGS>', registers.group(0))
        if section != None:
            print('<SECTION>', section.group(1))
        if immediate != None:
            print('<IMMEDIATE>', immediate.group(0))
        if dataAddress != None:
            print('<DATA_ADDRESS>', dataAddress.group(2))
