# What to do if an app detect a keyboard layout different than the system's

if the wrong keyboard layout is detected, launch the application throught the terminal with this hack

```bash
$ setxkbmap fr && rofi -show run

```

here the program to launch is rofi with the arguments -show run. by defining the xkbmap to fr first, the program is forced to launch with the fr layout