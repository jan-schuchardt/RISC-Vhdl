//concrete program to handle 4 counters (1 word, 1 halfword, 1 byte, 1 misaligned word)
// all counters are incremented by 0x40 every cycle

LUI x1, 0x10000

//init
SW x1, x0, 8
SH x1, x0, 44
SB x1, x0, 67
SW x1, x0, 35

.loopyloop
LW x4, x1, 8
ADDI x4, x4, 0x40
SW x1, x4, 8

LH x5, x1, 44
ADDI x5, x5, 0x40
SH x1, x5, 44

LB x6, x1, 67
ADDI x6, x6, 0x40
SB x6, x1, 67

LW x7, x1, 35
ADDI x7, x7 0x40
SW x7, x1, 35

//cross checking
LW x8, x1, 7 //lower enviroment of aligned word counter
LW x9, x1, 43 //load the alinged hword counter into the middle of x9 (plus its enviroment)
LW x10, x1, 66 //enviroment of our byte counter
LW x11, x1, 34 //enviroment of unaligned hword counter 

JAL x0, loopyloop