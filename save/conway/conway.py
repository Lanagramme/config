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

class GameOfLife:
    def __init__(self, width, height):
        self.X = width
        self.Y = height
        self.grid = np.zeros((width, height), dtype=int)
        self.live = set()

    def neighbours(self, coords):
        x, y = coords

        prev_row = (x - 1) % self.X
        next_row = (x + 1) % self.X

        prev_col = (y - 1) % self.Y
        next_col = (y + 1) % self.Y

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

    def invert(self, x, y):
        self.grid[x][y] = 1 if self.grid[x][y] == 0 else 0
        if cell in self.live:
            self.live.remove(cell)
        else:
            self.live.add(cell)


    def turn(self):
        NEXT = np.zeros((self.X, self.Y), dtype=int)
        updated = set()
        birthed = self.live.copy()

        def live(x, y):
            NEXT[x][y] = 1
            birthed.add((x, y))

        def die(x, y):
            NEXT[x][y] = 0
            birthed.discard((x, y))

        def check_status(cell):
            x,y = cell
            if cell not in updated:
                around = self.neighbours(cell)
                strength = sum(self.grid[nx][ny] for nx, ny in around)
                if strength < 2 or strength > 3:
                    die(x, y)
                elif strength == 3:
                    live(x, y)
                updated.add((x, y))

        for cell in self.live:
            cluster = self.neighbours(cell)
            cluster.append(cell)
            for case in cluster:
                check_status(case)

        for cell in birthed:
            NEXT[cell[0]][cell[1]] = 1

        if not np.array_equal(self.grid, NEXT):
            self.grid = NEXT
            self.live = birthed

Game = GameOfLife(10, 10)

PAUSE = False
black = 0, 0, 0
white = 255, 255, 255
red = 250, 0, 0
pygame.init()
clock = pygame.time.Clock()
pygame.display.set_caption("GAME")
font = pygame.font.SysFont(None, 36)

side = 10
gutter = 2
x = y = 0
margin = 80
running = True

class Cell:
    def __init__(self, x, y, margin, gutter, side, position):
        self.dimentions = (side, side)
        self.color = black if position == 0 else white
        self.body = pygame.Rect((margin + x * (side + gutter), margin + y * (side + gutter)), self.dimentions)

    def draw(self, screen):
        pygame.draw.rect(screen, self.color, self.body)
    
HEIGHT =  (2* 80) + Game.Y * (side + gutter)
WIDTH  =  (2* 80) + Game.X * (side + gutter)
SIZE = (WIDTH,HEIGHT )

SCREEN = pygame.display.set_mode(SIZE)
SCREEN.fill("purple")
clicked = False

function_interval = 0.2
time_since_last_call = 0

Game.width = Game.X * (side + gutter)
Game.height = Game.Y * (side + gutter)
board = pygame.Rect(margin, margin, Game.width, Game.height)
Button = pygame.Rect(10,10,50,50)

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # internal clock
    delta_time = clock.tick(60) / 1000.0
    time_since_last_call += delta_time

    # draw
    SCREEN.fill("purple")
    for X in range(Game.X):
        for Y in range(Game.Y):
            cell = Cell(X,Y,margin,gutter,side,Game.grid[X][Y])
            cell.draw(SCREEN)

    # mouse info
    mouse_x, mouse_y = mouse_pos = pygame.mouse.get_pos()
    clic, _, _ = pygame.mouse.get_pressed(num_buttons=3)

    if not clic:
        clicked = False

    # pause button
    pygame.draw.rect(SCREEN, red, Button)
    if Button.collidepoint(mouse_pos) and clic and not clicked:
        clicked = True
        PAUSE = not PAUSE

    if not PAUSE:
        text_surface = font.render("PAUSE", True, (255, 255, 255))
        SCREEN.blit(text_surface, (100, 30))

        
        if board.collidepoint(mouse_pos):
            g_x = int((mouse_x - margin) / (side + gutter))
            g_y = int((mouse_y - margin) / (side + gutter))
            cell = (g_x, g_y)

            if clic and not clicked:
                clicked = True
                Game.invert(g_x, g_y)

    else:
        text_surface = font.render("RUNNING", True, (255, 255, 255))
        SCREEN.blit(text_surface, (100, 30))
        if time_since_last_call >= function_interval:
            Game.turn()
            time_since_last_call = 0

    pygame.display.flip()
    clock.tick(60)
