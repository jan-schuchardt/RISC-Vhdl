LUI x1, 0x10000
ADDI x1, x1, 0x100



ADDI x30, x0, 0x100
LUI x28, 0x20000


.mar0

ADDI x29, x29, 0x001
ADDI x28, x28, 0x001
SB x28, x29, 0
BNE x29, x30, mar0




ADDI x2, x0, 0
ADDI x2, x2, 0xFFF
LUI x3, 0x80201
ADDI x3, x3, 0x008
LW x4, x1, 16
LW x5, x1, 20
LW x6, x1, 24
LW x7, x1, 28

SW x1, x2, 16
SW x1, x2, 20
SW x1, x2, 24
SW x1, x2, 28

SW x1, x0, 16

LW x8, x1, 16
LW x9, x1, 20
LW x10, x1, 24
LW x11, x1, 28


SW x1, x0, 21


LW x12, x1, 16
LW x13, x1, 20
LW x14, x1, 24
LW x15, x1, 28

SH x1, x0, 24



LW x16, x1, 16
LW x17, x1, 20
LW x18, x1, 24
LW x19, x1, 28


SH x1, x0, 27 

LW x20, x1, 16
LW x21, x1, 20
Lw x22, x1, 24
LW x23, x1, 28

SB x1, x0, 30

LW x24, x1, 16
LW x25, x1, 20
LW x26, x1, 24
LW x27, x1, 28





//SW x1, x2, 0
//SH x1, x2, 4
//SB x1, x2, 6
//SH x1, x2, 7
//ADDI x3, x2, 0xFFF
//SW x1, x3, 9
//LW x4, x1, 0
//LW x5, x1, 4
//LW x6, x1, 8
//LH x7, x1, 0
//LB x8, x1, 0
//LB x9, x1, 1

