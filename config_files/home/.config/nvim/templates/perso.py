#! /usr/bin/python

import sys
import os

# print(sys.argv)
name = sys.argv[1]
path = sys.argv[2]

index = path.rfind('/')
path = path[:index + 1]

file = "/home/ludji/vimwiki/projets/veil/characters/" + name + ".md"

if (os.path.isfile(file)) :
    print("file exists")
else:
    template = """# {name}

@---
tags:character
element:
archetype:
affilliations:
orientation:
awakening:
@---

**Physical traits**:
**Personnality traits**:
**Positive traits**:
 *
**Negative traits**:
 *


## Attitude
### Inner mentality
### Place in the social hierarchy

## Backstory
### Legacy
### Biography
    """

    f = open(file, 'w')

    f.write(template.format(name=name))

