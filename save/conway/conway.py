# A 2d array will store the current state of the game
# A second array will store the futur state

# The coordinates of all the living cells are stored in a set as tuples
# A second set save the coordinates of all cells updated this turn

# Each turn, scan all the livig cells and their neighbours
# As a cell is scanned, add its coordinates to the set
# Befoer scanning a cell, check if it's coordinates are in the set
# The new state of a cell is stored in the next turn array

# Generate the grid
WIDTH = 10
HEIGHT = 10

GRID = [[0 for _ in range(WIDTH)] for _ in range(HEIGHT)]


