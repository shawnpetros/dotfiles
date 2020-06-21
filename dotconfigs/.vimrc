" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" edge theme
" Plug 'sainnhe/edge'

" rigel theme
Plug 'Rigellute/rigel'

" nord theme
Plug 'arcticicestudio/nord-vim'

" lightline ??
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'rmolin88/pomodoro.vim'
Plug 'jiangmiao/auto-pairs'

" some extra stuff
Plug 'airblade/vim-gitgutter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'townk/vim-autoclose'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" for rigel theme
set termguicolors
colorscheme nord

filetype indent plugin on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" automatically set vim working dir to pwd when vim was called
" set autochdir
" set line numbers relatively
set number relativenumber

" remapps for fzf
map ; :Files<CR>

" remap for NerdTree
map <C-o> :NERDTreeToggle<CR>

set backspace=indent,eol,start

set laststatus=2

set ttimeout
set ttimeoutlen=100
set timeoutlen=3000
