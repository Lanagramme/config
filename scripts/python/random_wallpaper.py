# import random
# import os
# import subprocess
#
# home = os.environ["HOME"]
# wallpaper_path = os.path.join(home, "Images", "Wallpapers")
#
# # Set X environment so feh/wal can talk to X server
# os.environ["DISPLAY"] = ":0"
# os.environ["XAUTHORITY"] = os.path.join(home, ".Xauthority")
#
# images = os.listdir(wallpaper_path)
# file = random.choice(images)
# full_path = os.path.join(wallpaper_path, file)
#
# print(full_path)
#
# subprocess.run(["wal", "-i", full_path], env=os.environ)
# subprocess.run(["feh", "--bg-fill", full_path], env=os.environ)

# import random
# import os
#
# home = os.environ["HOME"]
# path = os.path.join(home, "Images", "Wallpapers")
#
# image = os.listdir(path)
# file = random.choice(image)
# full_path = os.path.join(path, file)
#
# print(full_path)
#
# # Ensure DISPLAY is set for feh/wal
# os.environ["DISPLAY"] = ":0"
#
# os.system(f"wal -i '{full_path}'")
# os.system(f"feh --bg-fill '{full_path}'")

import random 
import os 

user = os.getlogin() 
path = "/home/"+user+"/Images/Wallpapers/" 
image = os.listdir(path) 
file = random.choice(image) 

print(path+file) 

os.system("wal -i '"+path+file+"'") 
# os.system("feh --bg-fill -r -z "+ path+file) 
os.system("feh --bg-fill "+ path+file)
