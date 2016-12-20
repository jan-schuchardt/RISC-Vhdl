LUI x1, 0x10000
ADDI x1, x1, 0x20
ADDI x3, x3, 0x20

ADDI x2, x0, 0x77

LW x4, x1, 0
LW x5, x1, 4
LW x6, x1, 8
LW x7, x1, 12

LW x8, x3, 0
LW x9, x3, 4
LW x10, x3, 8
LW x11, x3, 12

SB x1, x2, 1

LW x12, x1, 0
LW x13, x1, 4
LW x14, x1, 8
LW x15, x1, 12

LW x16, x3, 0
LW x17, x3, 4
LW x18, x3, 8
LW x19, x3, 12

SB x1, x2, 7

LW x20, x1, 0
LW x21, x1, 4
LW x22, x1, 8
LW x23, x1, 12

LW x24, x3, 0
LW x25, x3, 4
LW x26, x3, 8
LW x27, x3, 12
