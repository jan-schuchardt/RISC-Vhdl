// x3 = 0x1000000
ADDI x3, x0, 0x000
LUI x3, 0x01000
// x2 = '0'
ADDI x2, x0, 0x030
// x4 = ':' ('9'+1)
ADDI x4, x0, 0x03A
// x5 = 'G' ('F'+1)
ADDI x5, x0, 0x047
// x6 = 17 (#Schleifendurchlaeufe)
ADDI x6, x0, 0x011
.init1
SB x3, x2, 0x000
ADDI x2, x2, 0x001
ADDI x3, x3, 0x001
BLT x2, x4, init1
// == BEQ x4, x5, init2
BGE x4, x5, init2
// x2 = 'A'
ADDI x2, x0, 0x041
// x4 = 'G'
ADD x4, x0, x5
JAL x0, init1
.init2
// x3 = 0x1000000
SUB x3, x3, x6
JAL x0, start

// Arguments:
// x1 = return address
// x2 = pointer to video memory
// x3 = 0x1000000
// x10 = HEX-number to print
// Returns:
// x6 changed
// x7 changed
// x8 changed
.print_dword
ADDI x8, x0, 0x007
.print_dword1
ADD x7, x0, x10
SLL x8, x8, 0x2
SRL x7, x7, x8
SRL x8, x8, 0x2
ANDI x7, x7, 0x00F
ADD x7, x7, x3
LB x7, x7, 0x000
ADD x6, x2, x8
SB x6, x7, 0x000
ADDI x8, x8, 0xFFF
BLT x0, x8, print_dword1
JALR x0, x1, 0x000


.start
ADDI x10, x0, 0xbcd
LUI x10, 0x6789a
ADDI x2, x0, 0x000
LUI x2, 0x20000
JAL x1, print_dword
