# A 2d array will store the current state of the game
# A second array will store the futur state

# The coordinates of all the living cells are stored in a set as tuples
# A second set save the coordinates of all cells updated this turn

# Each turn, scan all the livig cells and their neighbours
# Befoer scanning a cell, check if it's coordinates are in the updated set
# As a cell is scanned, add its coordinates to the updated set
# The new state of a cell is stored in the next turn array

# Generate the grid
import pygame
import numpy as np

G_WIDTH = 47
G_HEIGHT = 47

# GRID = [[0 for _ in range(G_WIDTH)] for _ in range(G_HEIGHT)]
GRID = np.zeros((G_HEIGHT, G_WIDTH), dtype=int)
LIVE = set()


def neighbours(coords):
    x, y = coords

    prev_row = (x - 1) % G_HEIGHT
    next_row = (x + 1) % G_HEIGHT

    prev_col = (y - 1) % G_WIDTH
    next_col = (y + 1) % G_WIDTH

    # prev_row = G_HEIGHT - 1 if x - 1 < 0 else x - 1
    # next_row = 0 if x + 1 >= G_HEIGHT else x + 1

    # prev_col = G_WIDTH - 1 if y - 1 < 0 else y - 1
    # next_col = 0 if y + 1 >= G_WIDTH else y + 1

    return [
        ( prev_row,prev_col),  # Top-left
        ( prev_row, y),  # Top
        ( prev_row,next_col),  # Top-right
        ( x,prev_col),  # Left
        ( x,next_col),  # Right
        ( next_row,prev_col),  # Bottom-left
        ( next_row, y),  # Bottom
        ( next_row,next_col),  # Bottom-right
    ]


def turn():
    global GRID, LIVE
    NEXT = np.zeros((G_HEIGHT, G_WIDTH), dtype=int)
    updated = set()
    birthed = LIVE.copy()

    def live(x, y):
        NEXT[x][y] = 1
        birthed.add((x, y))

    def die(x, y):
        NEXT[x][y] = 0
        birthed.discard((x, y))

    def check_status(cell):
        x,y = cell
        if cell not in updated:
            around = neighbours(cell)
            strength = sum(GRID[nx][ny] for nx, ny in around)
            if strength < 2 or strength > 3:
                die(x, y)
            elif strength == 3:
                live(x, y)
            updated.add((x, y))

    for cell in LIVE:
        cluster = neighbours(cell)
        cluster.append(cell)
        for case in cluster:
            check_status(case)

    for cell in birthed:
        NEXT[cell[0]][cell[1]] = 1

    if not np.array_equal(GRID, NEXT):
        GRID = NEXT
        LIVE = birthed


SIZE = WIDTH, HEIGTH = 726, 726
PAUSE = False
black = 0, 0, 0
white = 255, 255, 255
red = 250, 0, 0
pygame.init()
SCREEN = pygame.display.set_mode(SIZE)
clock = pygame.time.Clock()
SCREEN.fill("purple")
pygame.display.set_caption("GAME")
font = pygame.font.SysFont(None, 36)

side = 10
gutter = 2
cell_dimentions = (side, side)
x = y = 0
margin = 80
cell_position = (margin + x, margin + y)
running = True

clicked = False

function_interval = 0.2
time_since_last_call = 0

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    delta_time = clock.tick(60) / 1000.0
    time_since_last_call += delta_time
    SCREEN.fill("purple")


    for X in range(G_WIDTH):
        for Y in range(G_HEIGHT):
            cell_position = (margin + X * (side + gutter),
                             margin + Y * (side + gutter))
            color = black if GRID[X][Y] == 0 else white
            pygame.draw.rect(SCREEN, color, pygame.Rect(
                cell_position, cell_dimentions))

    mouse_x, mouse_y = pygame.mouse.get_pos()
    clic, _, _ = pygame.mouse.get_pressed(num_buttons=3)

    if not clic:
        clicked = False

    # pause button
    pygame.draw.rect(SCREEN, red, pygame.Rect(10, 10, 50, 50))
    if (
        mouse_x > 10
        and mouse_x < 60
        and mouse_y > 10
        and mouse_y < 60
        and clic
        and not clicked
    ):
        clicked = True
        PAUSE = not PAUSE
        # turn()

    if not PAUSE:
        text_surface = font.render("PAUSE", True, (255, 255, 255))
        SCREEN.blit(text_surface, (100, 30))

        if mouse_x > margin and mouse_x < margin + G_WIDTH * (side + gutter):
            if mouse_y > margin and mouse_y < margin + G_HEIGHT * (side + gutter):
                g_x = int((mouse_x - margin) / (side + gutter))
                g_y = int((mouse_y - margin) / (side + gutter))

                if clic and not clicked:
                    clicked = True
                    GRID[g_x][g_y] = 1 if GRID[g_x][g_y] == 0 else 0
                    if (g_x, g_y) in LIVE:
                        LIVE.remove((g_x, g_y))
                    else:
                        LIVE.add((g_x, g_y))

    else:
        text_surface = font.render("RUNNING", True, (255, 255, 255))
        SCREEN.blit(text_surface, (100, 30))
        if time_since_last_call >= function_interval:
            turn()
            time_since_last_call = 0

    pygame.display.flip()
    clock.tick(60)
