import pygame
import numpy as np

WHITE = (255,255,255)
BLUE  = (0,0,255)
GREEN = (0,255,0)
RED   = (255,0,0)

class Pion:
  def __init__(self, team):
    self.team = team
    self.position

class Cell:
  def __init__(self, x, y, margin, gutter, size, hover):
    self.x = x
    self.y = y
    self.dimensions = (size, size)
    self.body = pygame.Rect(
      (margin + x * (size + gutter), margin + y * (size + gutter)),
      self.dimensions
    )
    self.hover = hover
    self.color = self.is_hovered() 
  
  def is_hovered(self):
    if self.hover != False and (self.x,self.y) == self.hover:
      return (200,0,0)
    return RED
    
    
  def draw(self, SCREEN):
    pygame.draw.rect(SCREEN, self.color, self.body)

class Grid:
  def __init__(self, width, height, margin, gutter, size):
    self.margin = margin
    self.gutter = gutter
    self.size = size
    
    self.X = width
    self.Y = height
    self.spanX = width * (size + gutter) 
    self.spanY = height * (size + gutter) 
    
    self.cells = []
    self.hover = False
    self.reset()

  def reset(self):
    self.cells = [[False for _ in range(self.Y)] for _ in range(self.X)]

  def paint(self, SCREEN):
    X = self.X
    Y = self.Y

    def draw(x, y, margin, gutter, size, hover, SCREEN):
      Cell(x, y, margin, gutter, size, hover).draw(SCREEN)
      pygame.draw.circle(
        SCREEN, BLUE, 
        ((x*(size+gutter)+margin)+size/2, ( y*(size+gutter)+margin )+size/2), size/2-5)
    
    [
      draw(x, y, self.margin, self.gutter, self.size, self.hover,SCREEN)
      for x in range(X)
      for y in range(Y)
    ]

game = Grid(9, 6, 50, 1, 50)

pygame.init()
HEIGHT = game.margin * 2 + game.spanY
WIDTH = game.margin * 2 + game.spanX
SIZE = (WIDTH, HEIGHT)
SCREEN = pygame.display.set_mode(SIZE)
PIONS = []

TEAMS = {
  team1 = { color = PURPLE, pions = [] },
  team2 = { color = CARMIN, pions = [] }
}

board = pygame.Rect(game.margin, game.margin, game.spanX, game.spanY)

playing = True
while playing:
  for event in pygame.event.get():
    if event.type == pygame.QUIT:
      playing = False

  mouse_x, mouse_y = mouse_pos = pygame.mouse.get_pos()
  
  if board.collidepoint(mouse_pos):
    hovered_cell_x = int((mouse_x - game.margin) / (game.size + game.gutter))
    hovered_cell_y = int((mouse_y - game.margin) / (game.size + game.gutter))
    game.hover = (hovered_cell_x, hovered_cell_y)
  else:
    game.hover = False
    
  SCREEN.fill((255,255,255))
  game.paint(SCREEN)
  pygame.display.flip()
