asm_dict = {
    # Text

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

    "CALLQ": "e8",
    "RETQ": "c3",
    "SYSCALL": "0f05"

    # Data é só converter o char pra ascii
}
