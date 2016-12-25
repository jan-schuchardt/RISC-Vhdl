addi x1, x0, 0x20
.loop
addi x1, x1, 0xFFF
bne x1, x0, loop
