#! /usr/bin/python

import subprocess
from os import walk

f = []
for (dirpath, dirnames, filenames) in walk("./"):
    f.extend(filenames)
    break

# result = subprocess.run(["./awky.sh", "Zero-G.md"])
# print(f)

for file in f:
    # print(file)
    aa = subprocess.run(["./awky.sh",f'{file}'])
    # if aa.returncode == 0:
    #     print("no")
    # else:
    #     print(aa)
