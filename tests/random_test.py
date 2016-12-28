import random
import math

def double_dif (a, b):
    return (a/b) << 16


def double_pow(a, b):
    n = 1
    for i in range(0, b):
        n = double_mul(n, a)
    return n

def double_mul(a, b):
    a = a >> 8
    b = b >> 8
    return a*b

def sin(x):
    s = 0x28BE93CB #magic number (0x100000000 / 2 pi as 16-bit double)
    i = int(x / s)
    value = i
    value -= int(double_pow(i, 3) / 6)
    value += int(double_pow(i, 5) / 120)
    value -= int(double_pow(i, 7) / 5040)
    return value


for i in range(0, 0x10000, 0x100):
    print(sin(i * 0x10000))
    



