# A 2d array will store the current state of the game
# A second array will store the futur state

# The coordinates of all the living cells are stored in a set as tuples
# A second set save the coordinates of all cells updated this turn

# Each turn, scan all the livig cells and their neighbours
# Befoer scanning a cell, check if it's coordinates are in the updated set
# As a cell is scanned, add its coordinates to the updated set
# The new state of a cell is stored in the next turn array

# Generate the grid
import sys
import time
import pygame
import numpy as np

G_WIDTH = 10
G_HEIGHT = 10
GRID = [[0 for _ in range(G_WIDTH)] for _ in range(G_HEIGHT)]
LIVE = set()


def neighbours(coords):
    x, y = coords

    prev_row = (x - 1) % G_HEIGHT
    next_row = (x + 1) % G_HEIGHT

    prev_col = (y - 1) % G_WIDTH
    next_col = (y + 1) % G_WIDTH

    return [
        (prev_col, prev_row),  # Top-left
        (x, prev_row),  # Top
        (next_col, prev_row),  # Top-right
        (prev_col, y),  # Left
        (next_col, y),  # Right
        (prev_col, next_row),  # Bottom-left
        (x, next_row),  # Bottom
        (next_col, next_row),  # Bottom-right
    ]


def turn():
    global GRID, LIVE
    NEXT = [[0 for _ in range(G_WIDTH)] for _ in range(G_HEIGHT)]
    updated = set()

    def live(x, y):
        NEXT[x][y] = 1
        LIVE.add((x, y))

    def die(x, y):
        NEXT[x][y] = 0
        LIVE.discard((x, y))

    def check_status(x, y):
        if (x, y) not in updated:
            around = neighbours((x, y))
            strength = sum(GRID[nx][ny] for nx, ny in around)
            if strength < 2 or strength > 3:
                die(x, y)
            elif strength == 3:
                live(x, y)
            updated.add((x, y))

    for cell in LIVE:
        cluster = neighbours((cell[0], cell[1]))
        cluster.append((cell[0], cell[1]))
        for case in cluster:
            check_status(case[0], case[1])

    if not np.array_equal(GRID, NEXT):
        GRID = NEXT


SIZE = WIDTH, HEIGTH = 300, 400
black = 0, 0, 0
pygame.init()
SCREEN = pygame.display.set_mode(SIZE)
# SCREEN.fill("purple")
pygame.display.set_caption("GAME")

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    pygame.display.flip()
