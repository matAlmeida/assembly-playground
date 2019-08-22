opcode_translate = {
    "MOV_R15": '41bf',
    "MOV_RDX": 'ba',
    "MOV_RAX": 'b8',
    "MOV_RDI": 'bf',

    "MOVABS_RSI": '48be',
    "MOVZBQ_R14": '4c0fb63425',
    "MOVZBQ_R13": '4c0fb62c25',

    "CMP_R14": '4983fe',
    "CMP_R13": '4983fd',
    "CMP_R15": '4983ff',

    "JE": "74",
    "JMP": "eb",
    "XOR": "4831ff",

    "CALLQ": "e8",
    "RETQ": "c3",
    "SYSCALL": "0f05"

    # Data é só converter o char pra ascii
}

opcode_size = {
    "MOV_R15": 6,
    "MOV_RDX": 5,
    "MOV_RAX": 5,
    "MOV_RDI": 5,

    "MOVABS_RSI": 10,
    "MOVZBQ_R14": 9,
    "MOVZBQ_R13": 9,

    "CMP_R14": 4,
    "CMP_R13": 4,
    "CMP_R15": 4,

    "JE": 2,
    "JMP": 2,
    "XOR": 3,

    "CALLQ": 5,
    "RETQ": 1,
    "SYSCALL": 2

    # Data é só converter o char pra ascii
}
