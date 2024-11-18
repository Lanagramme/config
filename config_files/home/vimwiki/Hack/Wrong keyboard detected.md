# What to do if an app detect a keyboard layout different than the system's

if the wrong keyboard layout is detected, launch the application throught the terminal with this hack

```bash
$ setxkbmap fr && rofi -show run

```

here the program to launch is rofi with the arguments -show run. by defining the xkbmap to fr first, the program is forced to launch with the fr layout

___

## If the layout return to english after rebooting

1. Edit the vconsole configuration:

```bash
sudo nano /etc/vconsole.conf

```
add of modify the line 

```plaintext
KEYMAP=fr

```

2. Configure the X11 layout

```bash
sudo nano /etc/X11/xorg.conf.d/00-keyboard.conf

```
Make sure the confituration is 

```plaintext
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "fr"
EndSection
```
1. Edit rc.lua

```lua
os.execute("setxkbmap fr")
```
