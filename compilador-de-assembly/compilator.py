#!/usr/bin/env python
import re
import mapper


class Token():
    def __init__(self, ttype, value):
        self.type = ttype
        self.value = value

    def __repr__(self):
        return "<{0}> {1}".format(self.type, self.value)


filename = "../the-door/door.asm"
tokens = []

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
        immediate = re.search(', (\d+)', line)
        dataAddress = re.search('mov (rdx|rsi)[,\/] (\w+)', line)

        if data != None:
            foundData = Token("DATA", data.group(0)[:-1])
            tokens.append(foundData)
            continue
        if label != None:
            foundLabel = Token("LABEL", label.group(1))
            tokens.append(foundLabel)
        if instructions != None:
            foundInstructions = Token("INSTRUCTION", instructions.group(0))
            tokens.append(foundInstructions)
        if registers != None:
            foundRegister = Token("REGISTER", registers.group(0))
            tokens.append(foundRegister)
        if section != None:
            foundSection = Token("SECTION", section.group(1))
            tokens.append(foundSection)
        if immediate != None:
            foundImmediate = Token("IMMEDIATE", immediate.group(1))
            tokens.append(foundImmediate)
        if dataAddress != None:
            foundDataAddress = Token("DATA_ADDRESS", dataAddress.group(2))
            tokens.append(foundDataAddress)

instruction_count = 0
label_count = 0
for token in tokens:
    if token.type == "INSTRUCTION":
        instruction_count += 1
    if token.type == "LABEL":
        label_count += 1

print(label_count)
