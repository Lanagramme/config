from random import seed
from random import randint
from datetime import datetime
import os


user = os.getlogin()
path = "/home/"+user+"/Images/Wallpapers/"
a = os.listdir(path)

time = datetime.now()
seed(time.microsecond)
value = randint(1, len(a))

print(value)
os.system("wal -i "+path+a[value-1])
os.system("feh --bg-fill -r -z "+ path+a[value-1])

