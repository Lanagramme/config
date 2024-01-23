#! /usr/bin/python

import subprocess
from os import walk

f = []
spells = []
for (dirpath, dirnames, filenames) in walk("./"):
    f.extend(filenames)
    break

for filename in f:
    spell = { "name" : filename.split('.')[0] }
    with open("./" + filename, "r") as file:
        i = 1
        for line in file:
            line = line.strip()
            if i == 1 and line != "@---": break
            i = 0
            if line == "---@": break
            if line != "@---": 
                meta = line.split(':')
                if len(meta) == 2: spell[meta[0]] = meta[1]
                else: spell[meta[0]] = ""
        if i == 0 and spell["tags"] == "spell": spells.append(spell)

print(spells)

compendium_text= """# Spells Compendium

| Nom          | Element | Archetype |
| ---          | ---     | ---       |
"""

compendium = open("./compendium.md", 'w')
compendium.write(compendium_text)
spells = sorted(spells, key=lambda x: x['name'])
for spell in spells:
    k = " | "
    print("| [[" + spell[ "name" ] + "]]" +  k + spell[ "archetype" ] +k  + spell[ "element" ] + "|")
    compendium.write("| [[" + spell[ "name" ] + "]]" +  k + spell[ "element" ]  +k  +spell["archetype"] + "|\n")
