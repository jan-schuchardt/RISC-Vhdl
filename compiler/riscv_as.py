import riscv_parser
import sys, getopt, ntpath, os
import json

def main(argv):
	try:
		opts, args = getopt.getopt(argv, "i:o:s:b:")
	except getopt.GetoptError:
		sys.exit(2)
	
	infile = None
	outfile = None
	symfile = None
	binfile = None
	
	#Parse the options
	for opt, arg in opts:
		if opt == "-i":
			infile = arg
		if opt == "-o":
			outfile = arg
		if opt == "-s":
			symfile = arg
		if opt == "-b":
			binfile = arg
	if not infile:
		print("Error: Missing input file")
		sys.exit(2)
	if not outfile:
		print("Error: Missing output file")
		sys.exit(2)	
	parse_file(infile, outfile, symfile, binfile)
	
def parse_file(infile, outfile, symfile, binfile):
	infile = open(infile, "r+")
	content = remove_comments(infile.read())
	infile.close()
	parsed = riscv_parser.parse_string(content)
	bytes = parsed[0]
	comments = parsed[1]
	symbols = parsed[2]
	out = ""
	current_cache = ""
	
	for i in range (0, len(bytes)):
		
	
		current_cache = current_cache + "\""+'{0:08b}'.format(bytes[i]) + "\","
		if i % 4 == 3:
			out += comments[int(i/4)]+"\n"+current_cache+"\n\n"
			current_cache = ""
	out += "others=>(others=>'0')\n"
	
	if symfile:
		symfile = open(symfile, "w+")
		symfile.write(json.dumps(symbols))
		symfile.close()
	
	if binfile:
		barray = bytearray(bytes)
		binfile = open(binfile, "wb")
		binfile.write(barray)
		binfile.close()


	o = open(outfile, "w+")
	o.write(out)
	o.close()
	
	
def remove_comments(content):
	lines = content.split("\n")
	result = ""
	for line in lines:
		#remove comments
		if line.find("//") == -1:
			result += line + "\n"
		else:
			result += line[0:line.find("//")] + "\n"
	return result
	
if __name__ == "__main__":
	main(sys.argv[1:])
