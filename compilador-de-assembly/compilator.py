#!/usr/bin/env python
import re
import mapper


class Token():
    def __init__(self, ttype, value):
        self.type = ttype
        self.value = value

    def __repr__(self):
        return "<{0}> {1}".format(self.type, self.value)


filename = "./door.asm"
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
        label_call = re.match('\s*(call|jmp|je) (_|\.)(\w+)\n', line)
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
        if label_call != None:
            foundLabel = Token(
                "LABEL_CALL", label_call.group(2) + label_call.group(3))
            tokens.append(foundLabel)
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
program = []
i = 0
while i < len(tokens):
    if tokens[i].type == "INSTRUCTION":
        if tokens[i].value == "mov":
            register = tokens[i+1].value
            instStr = f'mov_{register}'.upper()
            binary = mapper.opcode_translate[instStr]
            if tokens[i+2].type == "IMMEDIATE":
                binary += hex(int(tokens[i+2].value)).split('x')[-1]
            size = int(mapper.opcode_size[instStr]) * 2
            binary = binary.ljust(size, '0')
            i += 3
            program.append(binary)
            continue
        elif tokens[i].value == "call":
            label = tokens[i+1].value
            binary = mapper.opcode_translate['CALL']
            binary += f'<ILC-{label}>'
            size = int(mapper.opcode_size['CALL']) * 2
            binary = binary.ljust(size, '0')
            i += 2
            program.append(binary)
            continue
        elif tokens[i].value == "je":
            label = tokens[i+1].value
            binary = mapper.opcode_translate['JE']
            binary += f'<ILC-{label}>'
            size = int(mapper.opcode_size['JE']) * 2
            binary = binary.ljust(size, '0')
            i += 2
            program.append(binary)
            continue
        elif tokens[i].value == "jmp":
            label = tokens[i+1].value
            binary = mapper.opcode_translate['JMP']
            binary += f'<ILC-{label}>'
            size = int(mapper.opcode_size['JMP']) * 2
            binary = binary.ljust(size, '0')
            i += 2
            program.append(binary)
            continue
        instruction_count += 1
    elif tokens[i].type == "LABEL":
        label_count += 1

    i += 1

# for token in tokens:
#     print(token)

for line in program:
    print(line)
