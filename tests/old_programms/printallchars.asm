ADDI x30, x0, 0x7FF
LUI x28, 0x20000


.mar0

ADDI x29, x29, 0x001
ADDI x28, x28, 0x001
SB x28, x29, 0
BNE x29, x30, mar0



LUI x1, 0x20000
ADDI x1, x0,

LB x4, x1, 0

LB x5, x1, 2


