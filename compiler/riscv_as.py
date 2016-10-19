import riscv_parser
import sys, getopt, ntpath, os

def main(argv):
	try:
		opts, args = getopt.getopt(argv, "i:o:")
	except getopt.GetoptError:
		sys.exit(2)
	
	infile = None
	outfile = None
	
	#Parse the options
	for opt, arg in opts:
		if opt == "-i":
			infile = arg
		if opt == "-o":
			outfile = arg
	if not infile:
		print("Error: Missing input file")
		sys.exit(2)
	if not outfile:
		print("Error: Missing output file")
		sys.exit(2)	
	parse_file(infile, outfile)
	
def parse_file(infile, outfile):
	infile = open(infile, "r+")
	content = remove_comments(infile.read())
	infile.close()
	parsed = riscv_parser.parse_string(content)
	bytes = parsed[0]
	comments = parsed[1]
	out = ""
	
	current_cache = ""
	for i in range (0, len(bytes)):
		current_cache = '{0:08b}'.format(bytes[i]) + current_cache
		if i % 8 == 7:
			out += comments[int(i/4)-1]+"\n"+comments[int(i/4)]+"\n\""+current_cache+"\",\n\n"
			current_cache = ""
	if len(bytes) % 8:
		out += comments[-1]+"\n--NOP\n\"00000000000000000000000000000000"+current_cache+"\",\n\n"
	out += "others=>(others=>'0')\n"
	
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