import riscv_parser

f = open("test.asm", "r+")
content = f.read()
f.close()
parsed = riscv_parser.parse_string(content)
bytes = parsed[0]
comments = parsed[1]
output = ""
for i in range (0, len(bytes)):
	if not i % 4:
		output += "\n"+comments[int(i/4)]+"\n"
	output += "when " + str(i) + " => \n" + \
    "br_data_in <= \"" + '{0:08b}'.format(bytes[i]) + "\";\n"
print(output)



o = open("out.txt", "w+")

o.write(output)
o.close()