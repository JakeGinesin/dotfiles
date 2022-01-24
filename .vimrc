" settings
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.png
set noswapfile
set fileencodings=utf-8
set encoding=utf-8


" https://stackoverflow.com/questions/34675677/disable-highlight-matched-parentheses-in-vim-let-loaded-matchparen-1-not-w
let loaded_matchparen = 1
set noshowmatch

inoremap {<CR? {<CR>}<C-o>O}


" 'zo' to open folds, 'zc' to close folds, 'zR' to open all folds, 'zM to
" close all folds'


call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

Plug 'preservim/nerdtree'

call plug#end()

nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

map <C-o> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
