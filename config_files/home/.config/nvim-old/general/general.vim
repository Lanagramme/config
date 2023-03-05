"  ,----..                                                                 ,--,    
" /   /   \                                                              ,--.'|    
"|   :     :                   ,---,               __  ,-.               |  | :    
".   |  ;. /               ,-+-. /  |            ,' ,'/ /|               :  : '    
".   ; /--`      ,---.    ,--.'|'   |    ,---.   '  | |' |    ,--.--.    |  ' |    
";   | ;  __    /     \  |   |  ,"' |   /     \  |  |   ,'   /       \   '  | |    
"|   : |.' .'  /    /  | |   | /  | |  /    /  | '  :  /    .--.  .-. |  |  | :    
".   | '_.' : .    ' / | |   | |  | | .    ' / | |  | '      \__\/: . .  '  : |__  
"'   ; : \  | '   ;   /| |   | |  |/  '   ;   /| ;  : |      ," .--.; |  |  | '.'| 
"'   | '/  .' '   |  / | |   | |--'   '   |  / | |  , ;     /  /  ,.  |  ;  :    ; 
"|   :    /   |   :    | |   |/       |   :    |  ---'     ;  :   .'   \ |  ,   /  
" \   \ .'     \   \  /  '---'         \   \  /            |  ,     .-./  ---`-'   
"  `---`        `----'                  `----'              `--`---'               

set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1

set number
:set relativenumber

:set autoindent				" indent the new line to the same amount as the previous
:set tabstop=2				" tabs size
:set shiftwidth=2			" autoindent size
:set smarttab

:set cursorline
:set cc=80						" set 80 char column 

:set mouse=a					" enable mouse control
:set clipboard=unnamedplus " use system clipboard
set noswapfile        " disable creating swap file


set scrolloff=8
set sidescrolloff=8

syntax on

" color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
 " colorscheme evening
" colorscheme dracula
" colorscheme onedark

" open new split panes to right and below
set splitright
set splitbelow

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif



