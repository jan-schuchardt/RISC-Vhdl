.entry
	lui x3, 0x40000
	lui x2, 0x00001 //init sp
	addi x2, x2, 0x800
	lui x4, 0x30000 //ioram
	
.flush_pram_loop

	lbu x5, x5, 1
	andi x5, x5, 0x80 //switch(3)
	bne x5, x0, pram_start //switch is pressed, pram start
	
	//wait for valid data
	lbu x5, x4, 5
	andi x5, x5, 1
	bne x5, x0, flush_pram_loop //data is not valid
	
	lbu x5, x4, 4 //uart data
	sb x3, x5, 0
	addi x3, x3, 1 //next byte
	
	//wait for data to become invalid
	.wait_for_new_data
		
		lbu x5, x5, 1
		andi x5, x5, 0x80 //switch(3)
		bne x5, x0, pram_start //switch is pressed, pram start
	
		lbu x5, x4, 5
		andi x5, x5, 1
		beq x5, x0, flush_pram_loop
		
		jal x0, wait_for_new_data
		
	
	
	
	
.pram_start
	lui x1, 0x40000
	jalr x0, x1, 0
	
.bios_error
	jal x0, bios_error