import pygame

pygame.init()


MAP = [
    [(0,0), (1,0), (1,0), (1,0), (17, 0)],
    [(0,7), (1,1), (2,1), (4,1), (17,1)],
    [(0,7), (1,2), (2,2), (4,2), (17,2)],
    [(0,7), (1,4), (2,4), (4,4), (17,2)],
    [(0,8), (16,8),(16,8),(16,8),(17,8)]
]

screen_width, screen_height = 640, 480
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption('Display a Tile')

tileset_image = pygame.image.load( "./Tileset/Interior/TopDownHouse_FloorsAndWalls.png" ).convert_alpha()
tile_width, tile_height = 16, 16
tiles = []

def load_tiles(tileset_image, tile_width, tile_height):
    # tiles = []
    tileset_width, tileset_height = tileset_image.get_size()
    tiles = [[0 for _ in range(9)] for _ in range(18)]
    
    xi= yi=0
    for y in range(0, tileset_height, tile_height):
        for x in range(0, tileset_width, tile_width):
            rect = pygame.Rect(x, y, tile_width, tile_height)
            tile = tileset_image.subsurface(rect)
            tiles[xi][yi] = tile
            xi = 0 if xi+1 == int(tileset_width / tile_width) else xi+1
        yi = 0 if yi+1 == int(tileset_height / tile_height) else yi+1
    
    return tiles

def draw_map(MAP, tileset):
    margin = 50
    for x in range(len(MAP)):
        for y in range(len(MAP[x])):
            tile = MAP[x][y]
            pos_y = margin + tile_width *x
            pos_x = margin + tile_width *y
            screen.blit(tileset[tile[0]][tile[1]],(pos_x, pos_y))

tiles = load_tiles(tileset_image, tile_width, tile_height)

tile_to_display = tiles[1][1]
tile_position = (100, 100)  # x, y position on the screen

# Main loop
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Fill the screen with a color (e.g., white)
    screen.fill((255, 255, 255))

    # Draw the tile at the specified position
    # screen.blit(tile_to_display, tile_position)
    draw_map(MAP, tiles)

    # Update the display
    pygame.display.flip()

# Quit Pygame
pygame.quit()
