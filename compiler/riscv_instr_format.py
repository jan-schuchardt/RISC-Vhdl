def rshift(val, n): return (val % 0x100000000) >> n

def compile_bitfield(bfrom, bto, value, base):
	""" compiles value into base as bitfield to range bfrom (inc) to bto (exc)"""
	bitlen = bto-bfrom
	mask = 0xFFFFFFFF >> (32-bitlen)
	value = value & mask
	mask = mask << bfrom
	value = value << bfrom
	base = base & (~mask)
	return base | value

def le_encode(bitfield):
	return [int(bitfield & 0xFF), int(rshift(bitfield, 8) & 0xFF), \
	int(rshift(bitfield, 16) & 0xFF), int(rshift(bitfield, 24) & 0xFF)]

def compile_r(opcode, rd, funct3, rs1, rs2, funct7):
	n = compile_bitfield(0, 7, opcode, 0)
	n = compile_bitfield(7, 12, rd, n)
	n = compile_bitfield(12, 15, funct3, n)
	n = compile_bitfield(15, 20, rs1, n)
	n = compile_bitfield(20, 25, rs2, n)
	return compile_bitfield(25, 32, funct7, n)
	
def compile_i(opcode, rd, funct3, rs1, imm_11_0):
	n = compile_bitfield(0, 7, opcode, 0)
	n = compile_bitfield(7, 12, rd, n)
	n = compile_bitfield(12, 15, funct3, n)
	n = compile_bitfield(15, 20, rs1, n)
	return compile_bitfield(20, 32, imm_11_0, n)
	
def compile_s(opcode, imm_4_0, funct3, rs1, rs2, imm_11_5):
	n = compile_bitfield(0, 7, opcode, 0)
	n = compile_bitfield(7, 12, imm_4_0, n)
	n = compile_bitfield(12, 15, funct3, n)
	n = compile_bitfield(15, 20, rs1, n)
	n = compile_bitfield(20, 25, rs2, n)
	return compile_bitfield(25, 32, imm_11_5, n)
	
def compile_u(opcode, rd, imm_31_12):
	n = compile_bitfield(0, 7, opcode, 0)
	n = compile_bitfield(7, 12, rd, n)
	return compile_bitfield(12, 32, imm_31_12, n)
	
def compile_sb(opcode, imm1, funct3, rs1, rs2, imm2):
	n = compile_bitfield(0, 7, opcode, 0)
	n = compile_bitfield(7, 12, imm1, n)
	n = compile_bitfield(12, 15, funct3, n)
	n = compile_bitfield(15, 20, rs1, n)
	n = compile_bitfield(20, 25, rs2, n)
	return compile_bitfield(25, 32, imm2, n)
	
def compile_i_s(opcode, rd, funct3, rs1, imml5, immu7):
	imm = imml5 & 0x1F
	imm = imm | ((immu7 & 0x7F) << 5)
	return compile_i(opcode, rd, funct3, rs1, imm)
	
def sb_imm_split(imm):
	imm1 = rshift(imm, 11) & 1
	imm1 = imm1 | ((rshift(imm, 1) & 0xF)<<1)
	imm2 = (rshift(imm, 5) & 0x3F)
	imm2 = imm2 | ((rshift(imm, 12) & 1)<<6)
	return (int(imm1), int(imm2))