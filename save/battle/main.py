import pygame

# import numpy as np
from random import randrange

WHITE = (255, 241, 215)
BLUE = (93, 100, 190)
GREEN = (0, 255, 0)

RED = (250, 170, 117)
DARK = (245, 121, 85)

PURPLE = (125, 82, 222)
CARMIN = (120, 227, 253)


class Pion:
    def __init__(self, team, position):
        self.team = team
        self.position = position


class Cell:
    def __init__(self, x, y, margin, gutter, size, hover):
        self.x = x
        self.y = y
        self.padding = 5
        self.dimensions = (size, size)
        self.body = pygame.Rect(
            (margin + x * (size + gutter), margin + y * (size + gutter)),
            self.dimensions,
        )
        self.hover = hover
        self.color = self.def_color()

    def def_color(self):
        if self.hover is not False and (self.x, self.y) == self.hover:
            return DARK
        return RED

    def draw(self, SCREEN, has_pion, pion_color):
        pygame.draw.rect(SCREEN, self.color, self.body)
        if has_pion:
            pygame.draw.circle(
                SCREEN,
                pion_color,
                (self.body.centerx, self.body.centery),
                self.body.width / 2 - self.padding,
            )


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
        self.active = False
        self.reset()

    def reset(self):
        self.cells = [[False for _ in range(self.Y)] for _ in range(self.X)]

    def paint(self, SCREEN):
        for x in range(self.X):
            for y in range(self.Y):
                has_pion = self.cells[x][y] is not False
                pion_color = (
                    TEAMS[LIST_PIONS[self.cells[x][y]].team]["color"]
                    if has_pion
                    else None
                )
                cell = Cell(x, y, self.margin, self.gutter, self.size, self.hover)
                cell.draw(SCREEN, has_pion, pion_color)


game = Grid(9, 6, 50, 1, 50)
board = pygame.Rect(game.margin, game.margin, game.spanX, game.spanY)

pygame.init()
pygame.time.Clock().tick(60)

HEIGHT = game.margin * 2 + game.spanY
WIDTH = game.margin * 2 + game.spanX
SIZE = (WIDTH, HEIGHT)
SCREEN = pygame.display.set_mode(SIZE)
LIST_PIONS = []

TEAMS = {
    "team1": {"color": PURPLE, "pions": []},
    "team2": {"color": CARMIN, "pions": []},
}


def create(team):
    while True:
        X = randrange(game.X)
        Y = randrange(game.Y)
        pos = (X, Y)
        nouveau_pion = Pion(team, pos)
        if game.cells[X][Y] is False:
            break

    game.cells[X][Y] = len(LIST_PIONS)
    LIST_PIONS.append(nouveau_pion)


create("team1")
create("team1")
create("team1")
create("team2")
create("team2")
create("team2")

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

    SCREEN.fill(WHITE)
    game.paint(SCREEN)
    pygame.display.flip()

pygame.quit()
