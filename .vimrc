" Jake's NEOVIM settings
" main rc for generic keybindings, settings, and plugin loading

" plugins
call plug#begin("~/.vim/plugged")
 Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
 Plug 'romgrk/barbar.nvim'
 Plug 'github/copilot.vim'
 " lean shit
 Plug 'Julian/lean.nvim'
 Plug 'neovim/nvim-lspconfig'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'hrsh7th/nvim-cmp'        " For LSP completion
 Plug 'hrsh7th/vim-vsnip'       " For snippets
 Plug 'andrewradev/switch.vim'  " For Lean switch support
 Plug 'tomtom/tcomment_vim'     " For commenting motions
 " end lean shit
  
 " latex shit
 Plug 'lervag/vimtex'
 " end latex shit
call plug#end()


set nocompatible
filetype on
filetype plugin on
filetype indent on

" syntax on
syntax on

" num highlighting on
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
set wildmode=longest,list
set cc=80
set colorcolumn=0
set t_Co=256
let s:fontsize = 12

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" update everything, faster completion
set updatetime=300

" auto signcolumn
set signcolumn=auto

" set terminal title to vim
set title
set titlestring=%(%{expand(\"%:~:h\")}%)#%(\ %t%)%(\ %M%)%(\ %)NVIM

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'

" Defualt Clipboard
set clipboard+=unnamedplus

" true colors, needs patched urxvt or st to work right
set termguicolors

" set mouse on
set mouse=a

" https://stackoverflow.com/questions/34675677/disable-highlight-matched-parentheses-in-vim-let-loaded-matchparen-1-not-w
let loaded_matchparen = 1
set noshowmatch

inoremap {<CR? {<CR>}<C-o>O}
set splitright
set splitbelow

" save file w/ ctrl+s
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>

" set relativenumber
set nu

" cursor blinkage
" set guicursor=v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait1700-blinkoff400-blinkon950-Cursor/lCursor,sm:block,n:block-blinkon0

" set relativenumber
set nu

set smarttab
set cindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

" always uses spaces instead of tab characters
set expandtab

" keep undos in a file
set undofile
set undodir=~/.local/share/nvim/cache

" lines to keep cursor vertically centered
set scrolloff=10

" remember cursor location
set viminfo='100,\"2500,:200,%,n~/.cache/.viminfo

" set encodings
set fileencodings=utf-8
set encoding=utf-8

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
imap <C-H> <C-W>

" color theming
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

let g:tokyonight_colors = {
  \ 'bg_dark': '#ff0000',
  \ 'bg': '#0d0d0d',
  \ 'fg': '#e3e1e1'
\ }

colorscheme tokyonight

map <C-t> :term<CR>
map <C-o> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" move between panes to left/bottom/top/right
 nnoremap <C-j> <C-w>h 
 nnoremap <C-k> <C-w>j
 nnoremap <C-i> <C-w>k  
 nnoremap <C-l> <C-w>l 

" exit terminal mode mapping
tnoremap <Esc> <C-\><C-n>

" terminal mode exit and close
" tnoremap <A-c> <C-\><C-n>:bd!<CR>

 " sourcing other rcs
source ~/.config/nvim/vimtex-rc.vim
source ~/.config/nvim/bufferline-rc.vim
