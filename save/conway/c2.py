import pygame
import numpy as np


class GameOfLife:
    def __init__(self, width, height, cell_size):
        self.width = width
        self.height = height
        self.cell_size = cell_size
        self.grid = np.zeros((height, width), dtype=int)
        self.live = set()
        self.paused = False

        pygame.init()
        self.screen = pygame.display.set_mode(
            (width * cell_size, height * cell_size))
        self.clock = pygame.time.Clock()
        pygame.display.set_caption("Game of Life")
        self.font = pygame.font.SysFont(None, 36)

    def neighbours(self, coords):
        x, y = coords
        prev_row = (x - 1) % self.height
        next_row = (x + 1) % self.height
        prev_col = (y - 1) % self.width
        next_col = (y + 1) % self.width

        return [
            (prev_col, prev_row),
            (y, prev_row),
            (next_col, prev_row),
            (prev_col, y),
            (next_col, y),
            (prev_col, next_row),
            (y, next_row),
            (next_col, next_row),
        ]

    def turn(self):
        if not self.live:
            return
        next_grid = np.zeros((self.height, self.width), dtype=int)
        updated = set()
        birthed = self.live.copy()

        def live(x, y):
            next_grid[x, y] = 1
            birthed.add((x, y))

        def die(x, y):
            next_grid[x, y] = 0
            birthed.discard((x, y))

        def check_status(x, y):
            if (x, y) not in updated:
                around = self.neighbours((x, y))
                strength = sum(self.grid[nx, ny] for nx, ny in around)
                if self.grid[x, y] == 1:
                    if strength < 2 or strength > 3:
                        die(x, y)
                    else:
                        live(x, y)
                else:
                    if strength == 3:
                        live(x, y)
                updated.add((x, y))

        for cell in self.live:
            cluster = self.neighbours(cell)
            cluster.append(cell)
            for case in cluster:
                check_status(*case)

        if not np.array_equal(self.grid, next_grid):
            self.grid = next_grid
            self.live = birthed

    def draw(self):
        self.screen.fill((128, 0, 128))  # purple
        for x in range(self.width):
            for y in range(self.height):
                color = (0, 0, 0) if self.grid[x, y] == 0 else (255, 255, 255)
                pygame.draw.rect(
                    self.screen,
                    color,
                    pygame.Rect(
                        y * self.cell_size,
                        x * self.cell_size,
                        self.cell_size,
                        self.cell_size,
                    ),
                )

        pygame.display.flip()

    def run(self):
        running = True
        while running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    running = False

            if not self.paused:
                self.turn()

            self.draw()
            self.clock.tick(10)  # Adjust FPS as needed

        pygame.quit()


if __name__ == "__main__":
    game = GameOfLife(47, 47, 15)  # Example cell size
    game.run()
