import pygame
import colors

class Button1:
    def __init__(self, x,y, width, height, text,hover_color, text_color):
        self.font = pygame.font.Font(None, 40)
        self.rect = pygame.Rect(x,y,width,height)
        self.text = text
        self.color = colors.green
        self.hover_color = hover_color
        self.text_color = text_color
        self.is_hovered = False
        self.status = 0

    def draw(self, screen):
        if self.is_hovered:
            pygame.draw.rect(screen, self.hover_color, self.rect)
        else:
            pygame.draw.rect(screen, self.color, self.rect)

        text_surface = self.font.render(self.text, True, self.text_color)
        text_rect = text_surface.get_rect(center=self.rect.center)
        screen.blit(text_surface, text_rect)
    
    def update(self, mouse_pos):
        self.is_hovered = self.rect.collidepoint(mouse_pos)

    def is_clicked(self, mouse_pos, mouse_pressed):
        if self.is_hovered and mouse_pressed:
            self.status = 1 if self.status == 0 else 0
            self.text = "RUN" if self.status == 0 else "PAUSE"
            self.color = colors.red if self.status == 1 else colors.green
        return self.is_hovered and mouse_pressed
