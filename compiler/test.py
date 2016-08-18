import riscv_parser

f = open("test.asm", "r+")
content = f.read()
f.close()
bytes = riscv_parser.parse_string(content)
o = open("out.txt", "w+")
o.write(str(bytes))
o.close()