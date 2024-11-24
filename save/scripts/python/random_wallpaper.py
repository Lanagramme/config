import random
import os

user = os.getlogin()
path = "/home/"+user+"/Images/Wallpapers/"
image = os.listdir(path)

file = random.choice(image)
print(path+file)

os.system("wal -i '"+path+file+"'")
os.system("feh --bg-fill -r -z "+ path+file)

