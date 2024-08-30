# A 2d array will store the current state of the game
# A second array will store the futur state

# The coordinates of all the living cells are stored in a set as tuples
# A second set save the coordinates of all cells updated this turn

# Each turn, scan all the livig cells and their neighbours
# Befoer scanning a cell, check if it's coordinates are in the updated set
# As a cell is scanned, add its coordinates to the updated set
# The new state of a cell is stored in the next turn array

import pygame
import GameOfLife
import utils
import colors

# GameOfLive settings
Game = GameOfLife.Main(100, 70)

bg_col   = colors.light
live_col = colors.honey
dead_col = colors.dark

side = 10
gutter = 2
x = y = 0
margin = 80
playing = True

Game.width  = Game.X * (side + gutter)
Game.height = Game.Y * (side + gutter)
board  = pygame.Rect(margin, margin, Game.width, Game.height)

class Cell:
    def __init__(self, x, y, margin, gutter, side, position):
        self.dimentions = (side, side)
        self.color = dead_col if position == 0 else live_col
        self.body = pygame.Rect((margin + x * (side + gutter), 
                                 margin + y * (side + gutter)), 
                                self.dimentions)

    def draw(self, screen):
        pygame.draw.rect(screen, self.color, self.body)
    
# pygame settings
pygame.init()
clock = pygame.time.Clock()
pygame.display.set_caption("GAME")
HEIGHT =  (2* margin) + Game.Y * (side + gutter)
WIDTH  =  (2* margin) + Game.X * (side + gutter)
SIZE   = (WIDTH,HEIGHT)
SCREEN = pygame.display.set_mode(SIZE)
PAUSE = False

function_interval = 0.2
time_since_last_call = 0

pause_button = utils.Button1(10,10,100,30, "RUN", colors.dark, colors.white )

while playing:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            playing = False

    # internal clock
    delta_time = clock.tick(60) / 1000.0
    time_since_last_call += delta_time

    # mouse info
    mouse_x, mouse_y = mouse_pos = pygame.mouse.get_pos()
    clic, _, _ = pygame.mouse.get_pressed(num_buttons=3)

    # cancel clicking state if needed 
    if not clic: clicking = False
        
    # pause button
    pause_button.update(mouse_pos)
    if pause_button.is_clicked(mouse_pos, clic and not clicking):
        clicking = True
        PAUSE = not PAUSE

    # draw
    SCREEN.fill(bg_col)
    pause_button.draw(SCREEN)
    [Cell(x, y, margin, gutter, side, Game.grid[x][y]).draw(SCREEN) 
        for x in range(Game.X) for y in range(Game.Y)]
    
    if not PAUSE:
        if board.collidepoint(mouse_pos):
            hovered_cell_x = int((mouse_x - margin) / (side + gutter))
            hovered_cell_y = int((mouse_y - margin) / (side + gutter))
            cell = (hovered_cell_x, hovered_cell_y)

            if clic and not clicking:
                clicking = True
                Game.invert(hovered_cell_x, hovered_cell_y)

    else:
        if time_since_last_call >= function_interval:
            Game.turn()
            time_since_last_call = 0

    pygame.display.flip()
    clock.tick(60)
