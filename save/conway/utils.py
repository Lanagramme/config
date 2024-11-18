import pygame


class Button1:
    def __init__(
        self,
        x,
        y,
        width,
        height,
        text,
        text_alt,
        color_main,
        color_sub,
        hover_color,
        text_color,
    ):
        self.font = pygame.font.Font(None, 40)
        self.rect = pygame.Rect(x, y, width, height)
        self.text_default = text
        self.text_alt = text_alt
        self.text = text
        self.color_main = color_main
        self.color_sub = color_sub
        self.hover_color = hover_color
        self.text_color = text_color
        self.is_hovered = False
        self.status = 0

    def draw(self, screen):
        if self.is_hovered:
            pygame.draw.rect(screen, self.hover_color, self.rect)
        else:
            pygame.draw.rect(screen, self.color_main, self.rect)

        text_surface = self.font.render(self.text, True, self.text_color)
        text_rect = text_surface.get_rect(center=self.rect.center)
        screen.blit(text_surface, text_rect)

    def update(self, mouse_pos):
        self.is_hovered = self.rect.collidepoint(mouse_pos)

    def is_clicked(self, mouse_pressed):
        if self.is_hovered and mouse_pressed:
            self.switch_state()
        return self.is_hovered and mouse_pressed

    def switch_state(self):
        self.status = 1 if self.status == 0 else 0
        self.text = self.text_default if self.status == 0 else self.text_alt
        self.color = self.color_sub if self.status == 1 else self.color_main
