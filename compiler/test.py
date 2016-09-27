import riscv_parser

f = open("test.asm", "r+")
content = f.read()
f.close()
bytes = riscv_parser.parse_string(content)
#o = open("out.txt", "w+")
print((bytes))
i = 0
for byte in bytes:
    print("when " + str(i) + " => \n" +
    "br_data_in <= std_logic_vector(to_unsigned(" + str(byte) + ", br_data_in'length));")
    i = i+1
#o.write(str(bytes))
#o.close()