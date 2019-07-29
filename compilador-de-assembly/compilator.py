#!/usr/bin/env python
import re

filename = "door.asm"
labels = []
inst = []
regs = []
# Make a regex that matches if any of our regexes match.
instructions = ['add', 'mov', 'xor', 'syscall', 'print',
                'call', 'ret', 'cmp', 'je', 'jmp', 'jg', 'movzx']
instCombined = "(" + ")|(".join(instructions) + ")"
registers = ['rax', 'rdi', 'rsi', 'rdx',
             'r15', 'r14', 'r13', 'r12', 'r11', 'r10']
regCombined = "(" + ")|(".join(registers) + ")"

with open(filename) as f:
    for line in f:
        line = line.split(';')[0]

        label = re.match('.+:\n', line)
        instructions = re.search(instCombined, line)
        registers = re.search(regCombined, line)
        section = re.search('^section \..+', line)
        variable = re.search('^\s*\w+:\s*.+\n', line)
        if label != None:
            labelString = label.string
            labelString = labelString.replace('\n', '')
            labelString = labelString.replace('\t', '')
            labelString = labelString.replace(' ', '')
            labels.append(labelString)
            print('<LABEL>', labelString)
        if instructions != None:
            inst.append(instructions)
            print('<INST>', instructions.group(0))
        if registers != None:
            regs.append(registers.string)
            print('<REGS>', registers.group(0))
        if section != None:
            print('<SECTION>', section.group(0))
        if variable != None:
            print('<VARIABLE>', variable.group(0)[:-1])
