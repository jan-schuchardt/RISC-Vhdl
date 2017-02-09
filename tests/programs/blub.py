for i in range(4, 32):
    addr = (i % 4) * 4
    print("lw "+str(i)+" ,"+str(addr))
