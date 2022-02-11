
"           _|                                _|                      
" _|_|_|    _|  _|    _|    _|_|_|    _|_|_|      _|_|_|      _|_|_|  
" _|    _|  _|  _|    _|  _|    _|  _|    _|  _|  _|    _|  _|_|      
" _|    _|  _|  _|    _|  _|    _|  _|    _|  _|  _|    _|      _|_|  
" _|_|_|    _|    _|_|_|    _|_|_|    _|_|_|  _|  _|    _|  _|_|_|    
" _|                            _|        _|                          
" _|                        _|_|      _|_|                            

call plug#begin()

Plug 'https://github.com/dracula/vim'
Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
" Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'mhinz/vim-startify' 
Plug 'vimwiki/vimwiki'
Plug 'https://github.com/junegunn/limelight.vim'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/mattn/calendar-vim'

call plug#end()

" airline settings
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" vim-devicons airline and nerdtree both need a nerdfont installed on the system
" vim-devicons needs 


" use markdown with vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]


" Start limeligt when entering goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Dimmed text color in limelight
let g:limelight_conceal_ctermfg = 240

" use template file to generate diary page
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.config/nvim/templates/generate-vimwiki-diary-template '%'


set nocompatible
filetype plugin on
syntax on
