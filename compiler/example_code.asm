
// i am a comment
ADDI x1, x0, 0xAAA
ORI  x2, x1, 0x555
ANDI x3, x2, 0xAAA
XORI x4, x3, 0x5AA
XORI x5, x4, 0x0FF // and i a am a comment
 // and i am a comment

SRAI x7, x5, 2
SRLI x8, x7, 3
SLLI x9, x8, 2  //comment as well

ADD x10, x5, x3
SUB x11, x1, x2

LUI x12, 0x2
LUI x13, 0x3
SRA x14, x11, x12
SRL x15, x11, x13
SLL x16, x11, x12