LUI x1, 0x10000
ADDI x1, x1, 0x20

LUI x2, 0x77777
ADDI x2, x2, 0x777

LW x4, x1, 0
LW x5, x1, 4
LW x6, x1, 8
LW x7, x1, 12

SW x1, x2, 0

LW x8, x1, 0
LW x9, x1, 4
LW x10, x1, 8
LW x11, x1, 12

SW x1, x2, 8

LW x12, x1, 0
LW x13, x1, 4
LW x14, x1, 8
LW x15, x1, 12

SW x1, x2, 4

LW x16, x1, 0
LW x17, x1, 4
LW x18, x1, 8
LW x19, x1, 12

SW x1, x2, 12

LW x20, x1, 0
LW x21, x1, 4
LW x22, x1, 8
LW x23, x1, 12
