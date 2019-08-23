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
instructions = ['je', 'jmp', 'xor', 'call',
                'ret', 'cmp', 'syscall', 'mov', 'movzx']
mergedInstructions = "(" + ")|(".join(instructions) + ")"
registers = ['rax', 'rdi', 'rsi', 'rdx', 'r15', 'r14', 'r13']
mergedRegisters = "(" + ")|(".join(registers) + ")"

with open(filename) as f:
    for line in f:
        line = line.split(';')[0]

        instructions = re.search(mergedInstructions, line)
        registers = re.search(mergedRegisters, line)
        label = re.match('\s*(.+):\.*\n', line)
        label_call = re.match('\s*(call|jmp|je) (_|\.)(\w+)\n', line)
        section = re.search('^section \.(.+)', line)
        data = re.search('^\s*\w+:\s*.+\n', line)
        immediate = re.search(', (\d+)', line)
        dataAddress = re.search('mov (rdx|rsi)[,\/] ([a-zA-Z]\w*)', line)

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


def int2hexstr(integer):
    converted = ""

    if integer < 0:
        converted = hex(((abs(integer) ^ 0xffff) + 1)
                        & 0xffff).split('x')[-1]
    else:
        converted = hex(integer).split('x')[-1]

    if len(converted) % 2 != 0:
        converted = "0" + converted

    convertedList = list(converted)
    abc = ""
    size = len(converted)
    i = 0
    while i < size:
        abc += convertedList.pop(-2)
        abc += convertedList.pop(-1)
        i += 2

    return abc


class Program():
    def __init__(self):
        self.lines = []
        self.ilc = {}

    # def __repr__(self):
    #     return

    def addLine(self, binary, opcode, label=None):
        offset = 0
        for line in self.lines:
            offset += mapper.opcode_size[line["opcode"]]

        self.lines.append({
            "binary": binary,
            "opcode": opcode,
            "offset": offset,
            "label": label
        })

    def addIlc(self, labelName, offset):
        self.ilc[labelName] = offset


instruction_count = 0
label_count = 0
program = Program()
i = 0
while i < len(tokens):
    if tokens[i].type == "INSTRUCTION":
        if tokens[i].value == "mov":
            register = tokens[i+1].value
            instStr = f'mov_{register}'.upper()
            binary = mapper.opcode_translate[instStr]
            if tokens[i+2].type == "IMMEDIATE":
                binary += hex(int(tokens[i+2].value)).split('x')[-1]
                i += 1
            size = int(mapper.opcode_size[instStr]) * 2
            binary = binary.ljust(size, '0')

            i += 2
            program.addLine(binary, instStr)
            continue
        if tokens[i].value == "cmp":
            register = tokens[i+1].value
            instStr = f'cmp_{register}'.upper()
            binary = mapper.opcode_translate[instStr]
            if tokens[i+2].type == "IMMEDIATE":
                binary += hex(int(tokens[i+2].value)).split('x')[-1]
                i += 1
            size = int(mapper.opcode_size[instStr]) * 2
            binary = binary.ljust(size, '0')
            i += 2
            program.addLine(binary, instStr)
            continue
        if tokens[i].value == "je":
            label = tokens[i+1].value
            binary = mapper.opcode_translate['JE']
            binary += f'<sub>'
            size = int(mapper.opcode_size['JE']) * 2
            i += 2
            program.addLine(binary, 'JE', label)
            continue
        if tokens[i].value == "jmp":
            label = tokens[i+1].value
            binary = mapper.opcode_translate['JMP']
            binary += f'<sub>'
            size = int(mapper.opcode_size['JMP']) * 2
            i += 2
            program.addLine(binary, 'JMP', label)
            continue
        if tokens[i].value == "xor":
            binary = mapper.opcode_translate['XOR']
            size = int(mapper.opcode_size['XOR']) * 2
            binary = binary.ljust(size, '0')
            i += 2
            program.addLine(binary, 'XOR')
            continue
        if tokens[i].value == "call":
            label = tokens[i+1].value
            binary = mapper.opcode_translate['CALL']
            binary += f'<sub>'
            size = int(mapper.opcode_size['CALL']) * 2
            i += 1
            program.addLine(binary, 'CALL', label)
            continue
        if tokens[i].value == "ret":
            binary = mapper.opcode_translate['RET']
            size = int(mapper.opcode_size['RET']) * 2
            binary = binary.ljust(size, '0')
            i += 1
            program.addLine(binary, 'RET')
            continue
        if tokens[i].value == "syscall":
            binary = mapper.opcode_translate['SYSCALL']
            size = int(mapper.opcode_size['SYSCALL']) * 2
            binary = binary.ljust(size, '0')
            i += 1
            program.addLine(binary, 'SYSCALL')
            continue
        instruction_count += 1
    if tokens[i].type == "LABEL":
        offset = 0
        for line in program.lines:
            offset += mapper.opcode_size[line["opcode"]]

        program.addIlc(tokens[i].value, offset)

    i += 1

# for token in tokens:
#     print(token)

# print(program.ilc)

for line in program.lines:
    if line["label"] != None:
        lineEnd = line['offset'] + mapper.opcode_size[line["opcode"]]
        labelStart = program.ilc[line["label"]]
        offset = labelStart - lineEnd

        binary = line["binary"].replace("<sub>", int2hexstr(offset))

        if offset < 0:
            binary = binary.ljust(mapper.opcode_size[line["opcode"]] * 2, 'f')
        else:
            binary = binary.ljust(mapper.opcode_size[line["opcode"]] * 2, '0')

        line["binary"] = binary

        # print('lineEnd: ', lineEnd)
        # print('labelStart: ', labelStart)
        # print('offset: ', offset)
        # print('binary: ', binary)
        # print('')


for line in program.lines:
    print(line["binary"])
