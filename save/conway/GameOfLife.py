import numpy as np


class Main:
    def __init__(self, width, height):
        self.X = width
        self.Y = height
        self.height = 0
        self.width = 0
        self.reset()

    def neighbours(self, coords):
        x, y = coords

        prev_row = (x - 1) % self.X
        next_row = (x + 1) % self.X

        prev_col = (y - 1) % self.Y
        next_col = (y + 1) % self.Y

        return [
            (prev_row, prev_col),  # Top-left
            (prev_row, y),  # Top
            (prev_row, next_col),  # Top-right
            (x, prev_col),  # Left
            (x, next_col),  # Right
            (next_row, prev_col),  # Bottom-left
            (next_row, y),  # Bottom
            (next_row, next_col),  # Bottom-right
        ]

    def invert(self, x, y):
        self.grid[x][y] = 1 if self.grid[x][y] == 0 else 0
        cell = (x, y)
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
            x, y = cell
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

    def reset(self):
        self.grid = np.zeros((self.X, self.Y), dtype=int)
        self.live = set()
