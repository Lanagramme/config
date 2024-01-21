#! /usr/bin/python

import sys
import os

print(sys.argv)
name = sys.argv[1]
path = sys.argv[2]

index = path.rfind('/')
path = path[:index + 1]

file = "/home/ludji/vimwiki/projets/veil/spells/" + name + ".md"

if (os.path.isfile(file)) :
    print("file exists")
else:
    template = """# {name}

@---
tags:spell
element:
archetype:
---@

**Type**:

**Range**:

**Description**:

**Cost**:

**Effect**:
"""

    f = open(file, 'w')

    f.write(template.format(name=name))

