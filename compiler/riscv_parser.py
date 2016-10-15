import riscv_linker as linker

def parse_string(string):
	"""parses a linebreak seperated instruciton string"""
	lines = string.split("\n")
	symbols = {}
	object = []
	line_nr = 0
	for line in lines:
		parse_line(line, symbols, object, line_nr)
		line_nr += 1
	return linker.linker(symbols, object)

	
def parse_line(line, symbols, object, line_nr):
	"""parse a single line"""
	line = line.strip("\t")
	line = line.strip(" ")
	if len(line):
		if(line[0] == '.'):
			#add a symbol
			symbols[line[1:]] = len(object)*4
		else:
			object.append((line_nr, line, len(object)*4))
		
