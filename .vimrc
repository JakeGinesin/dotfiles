" Disable compatibility with vi
set nocompatible

" Enable type file detection
filetype on

" enable plugins and load plugin for the detected filetype

filetype plugin on

filetype indent on

syntax on

set number

" set cursorline

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

set wildmenu

set wildmode=list:longest

set wildignore=*.docx,*.jpg,*.png,*gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.png

let g:loaded_matchparen=1

inoremap {<CR? {<CR>}<C-o>O

map <C-o> :NERDTreeToggle<CR>

" 'zo' to open folds, 'zc' to close folds, 'zR' to open all folds, 'zM to
" close all folds'

" PLUGINS -------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'

Plug 'preservim/nerdtree'

call plug#end()

" }}}

" MAPPINGS ------------------------- {{{

" mapping jj to escape 
" inoremap jj <Esc>

" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
"  Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or
" CTRL+l.
" nnoremap <c-k> <c-w>k 
" nnoremap <c-i> <c-w>i 
" nnoremap <c-j> <c-w>j 
" nnoremap <c-l> <c-w>l  

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
 nnoremap <F3> :NERDTreeToggle<cr>

"  Have nerdtree ignore certain files and directories.
 let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT ------------------------ {{{

" this will enable code folding
" use the marker method of folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" more vimscript goes here:

" }}}

" STATUSLINE ------------------------ {{{
"
" status bar goes here!
"
" }}}
