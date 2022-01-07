
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
" Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
" Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
" Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
" Plug 'mhinz/vim-startify' 

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
