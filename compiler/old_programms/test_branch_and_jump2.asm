ADDI x1, x0, 0x5
ADD x2, x0, x0
.start
ADDI x2, x2, 0x1
BNE x1, x2, start
JAL x3, end
ADDI x5, x0, 0xFFF
.end
ADDI x6, x0, 0xAAA