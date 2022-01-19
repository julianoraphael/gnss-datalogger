import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = input()
f = input()

virgulas=0
string_list = list(s)
for i in range(len(s)):
    if f[i+virgulas].isupper():
        string_list[i] = s[i].upper()
    elif f[i+virgulas].islower:
        string_list[i] = s[i].lower()
    if f[i+virgulas] == ',' :
        string_list[i] = ', '
        virgulas += 1
print(string_list)