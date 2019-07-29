#!/usr/bin/env python
import re

filename = "hello.asm"
labels = []
inst = []
regs = []
instructions = ['add', 'mov', 'xor', 'syscall']
registers = ['rax', 'rdi', 'rsi', 'rdx']
# Make a regex that matches if any of our regexes match.
instCombined = "(" + ")|(".join(instructions) + ")"
regCombined = "(" + ")|(".join(registers) + ")"

with open(filename) as f:
    content = [word for line in f for word in line.split()]

# print(content)

for word in content:

    label = re.match('.+:', word)
    instructions = re.match(instCombined, word)
    registers = re.match(regCombined, word)
    if label != None:
        labels.append(label.string)
    if instructions != None:
        inst.append(instructions.string)
    if registers != None:
        regs.append(registers.string)

print(regs)
