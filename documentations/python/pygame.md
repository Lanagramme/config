# Intruction to Pygame

Each second many frame are generated
between each generated frame, 
	the game logic computes 
	the player imput are read
	and every element of the game is updated

pygame offers libraries and fonction to handle the logic of a 2d game

**Create a window**
i
To use pygame in a project, it's first necessary to import the pygame librari within the project, and then to initialize it.

then we need to greate a dispay surfice 'the window the game will play in'
At this point, launching the program will display a window but it will be dark, and only appear for a moment. 
We will now make sur it stays open until we decide to close it

The loop will run undefinitely, and each iterration will update the content of the window (a frame of the game). this also mean that we have no mean to close it.

The event loop , run through eery event wich happend that frame, we will then listen to the event quit and quit the game, but we will need to close the program to free the computer memory.
For that reason we will also need to import the exit function from the sys library.

For now, our computer will compute each frame as fast as your computer allow, meaning, depending of the plateform, the speed of the game will wildly vvary 
we will use tht pygame to define a clock speed, wich will cap the maximum fps

With this, we have the basis to display a window and run a basic pygame program, even if, for now, it would not do anything but display a black window.

```python
import pygame
from sys import exit
clock = pygame.time.Clock()

pygame.init()
screen = pygame.display.set_mod((800,400))

# define the name of the window
pygame.display.set_cption('Game_name')

while True:
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			pygame.quit()
			exit()
	
	pygame.display.update()
	clock.tick(60)
```

**Display an image**
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
