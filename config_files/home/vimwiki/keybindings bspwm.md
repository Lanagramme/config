
| prefix               | Key     | function                                | Description                  |
|----------------------|---------|-----------------------------------------|------------------------------|
| super                | exc     | pkill -USR1 -x sxhkd                    |                              |
| super                | print   | bspscreenshot --area                    |                              |
| super                | return  | terminal                                |                              |
| super                | b       | Rofi bluetooth                          |                              |
| super                | d       | Rofi app launcher                       |                              |
| super                | m       | Rofi music                              |                              |
| super                | n       | Rofi network manager                    |                              |
| super                | p       | Color picker                            |                              |
| super                | q       | bspc node -c                            |                              |
| super                | r       | Rofi asroot                             |                              |
| super                | s       | Rofi screenshot                         |                              |
| super                | t       | Rofi themes                             |                              |
| super                | w       | Rofi windows                            |                              |
| super                | x       | Rofi powermenu                          |                              |
| super                | h,j,k,l | bspc node -f {west, south, north, east} |                              |
| super + alt          | return  | bspterm --full                          | fullscreen terminal          |
| super + alt + shift  | h,j,k,l | bspc node -v {-20 0,0 20,0 -20,20 0}    | move floating windows        |
| super + ctrl + shift | Left    | bspc node -d prev --follow              |                              |
| super + ctrl + shift | Right   | bspc node -d next --follow              |                              |
| super + shift        | return  | bspterm --float                         | floating terminal            |
| super + shift        | b       | firefox                                 |                              |
| super + shift        | e       | geany                                   |                              |
| super + shift        | f       | thunar                                  |                              |
| super + shift        | n       | bspwinmask                              |                              |
| super + shift        | q       | bspc quit                               |                              |
| super + shift        | h       | bspw wm -r                              |                              |
| alt                  | F2      | Rofi runner                             |                              |
| alt                  | print   | bspscreenshot --in5                     |                              |
| ctrl                 | print   | bspscreenshot --win                     |                              |
| ctrl + alt           | esc     | xkill                                   |                              |
| ctrl + alt           | Left    | bspc desktop -f pfev.local              |                              |
| ctrl + alt           | Right   | bspc desktop -f next.local              |                              |
| ctrl + alt           | r       | alacritty -e ranger                     | open terminal app ranger     |
| ctrl + alt           | h       | alacritty -e htop                       | open terminal app htop       |
| ctrl + alt           | l       | alacritty -e lockscreen                 | open terminal app lockscreen |
| ctrl + alt           | m       | alacritty -e ncmcpp                     | open terminal app ncmcpp     |
| ctrl + alt           | v       | alacritty -e neovim                     | open terminal app neovim     |
| print                |         | bspscreenshot --now                     |                              |
| shift                | print   | bspscreenshot --in10                    |                              |
|                      |         |                                         |                              |


