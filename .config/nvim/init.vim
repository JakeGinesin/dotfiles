" Jake's NEOVIM settings
" main rc for generic keybindings, settings, and plugin loading

" plugins
call plug#begin("~/.vim/plugged")
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
   let g:UltiSnipsExpandTrigger = '<tab>'
   let g:UltiSnipsJumpForwardTrigger = '<tab>'
   let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'honza/vim-snippets'
" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
" Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'romgrk/barbar.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'github/copilot.vim'
Plug 'junegunn/goyo.vim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ggandor/leap.nvim'
Plug 'whonore/Coqtail'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'isti115/agda.nvim'
Plug 'lervag/vimtex'

 " Plug 'ashinkarov/nvim-agda'

 " markdown
 " Plug 'preservim/vim-markdown'

 " lean shit
 " Plug 'Julian/lean.nvim'
 Plug 'neovim/nvim-lspconfig'
 " Plug 'nvim-lua/plenary.nvim'
 " Plug 'hrsh7th/nvim-cmp'        " For LSP completion
 " Plug 'hrsh7th/vim-vsnip'       " For snippets
 " Plug 'andrewradev/switch.vim'  " For Lean switch support
 " Plug 'tomtom/tcomment_vim'     " For commenting motions
" end lean shit
  
 
 " CS3500 shit
 " Plug 'puremourning/vimspector'
 " end CS3500 shit
call plug#end()

lua require('leap').add_default_mappings() 

set nocompatible
filetype on
filetype plugin on
filetype indent on

" syntax on
syntax on

" num highlighting on
set number

" tab stuff
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set nobackup
set scrolloff=10
set incsearch
set ignorecase
set filetype=on
set smartcase
set nowrap
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

" don't give |ins-completion-menu| messages.
set shortmess+=c

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

" auto file wrap for certain types of files

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

augroup WrapLineInTexFile
  autocmd!
  autocmd FileType md setlocal wrap
augroup END

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

" move between panes to left/bottom/top/right
 nnoremap <C-j> <C-w>h 
 nnoremap <C-k> <C-w>j
 nnoremap <C-i> <C-w>k  
 nnoremap <C-l> <C-w>l 

" term toggle 
map <C-t> :term<CR>A

" exit terminal mode mapping
tnoremap <Esc> <C-\><C-n>

" nnoremap <silent> <C-q> <C-w>s<C-w>j:resize 20<CR>:terminal<CR><S-i>

" coq leader
let mapleader = ","

" Focus commands
nnoremap <C-a>z :Goyo 80<CR>
nnoremap <C-a>q :Goyo!<CR>

" mapping control h,l to move forward and backward an entire word
" nnoremap <C-h> b
" nnoremap <C-l> w

xnoremap <C-h> b
xnoremap <C-l> w



" vim wiki shit

" auto resize goyo
autocmd VimResized * if exists('#goyo') | exe "normal \<c-w>=" | endif

function! CustomGf()
  let filename = expand('<cfile>')

  if filename == ''
    return
  endif

  let output = system('/home/synchronous/.scripts/vimwiki/custom_gf.sh ' . shellescape(filename))
  " Execute gf
  " normal! gf
  " execute ':syntax on'
  " execute ':nnoremap gf :call CustomGf()<CR> | syntax match LinkPattern /[a-zA-Z0-9][a-zA-Z0-9]*\.md/ | highlight LinkPattern guifg=LightBlue gui=underline | set path+=/home/synchronous/Documents/Obsidian/Journal/abstract'
  " execute ':set wrap'
endfunction

fun! Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Start a new buffer ...
    enew

    " ... and set some options for it
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
        \ norelativenumber

    " Now we can just write to the buffer, whatever you want.
    " call append('$', "")
    for line in split(system('cat /home/synchronous/.config/nvim/startscreen.vimstart'), '\n')
        call append('$', '' . l:line)
    endfor

    " No modifications to this buffer
    setlocal nomodifiable nomodified

    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>

    set syntax=off
    "nmap <buffer> <ScrollWheelUp> <nop>
    "nmap <buffer> <S-ScrollWheelUp> <nop>
    "nmap <buffer> <C-ScrollWheelUp> <nop>
    "nmap <buffer> <ScrollWheelDown> <nop>
    "nmap <buffer> <S-ScrollWheelDown> <nop>
    "nmap <buffer> <C-ScrollWheelDown> <nop>
    nmap <buffer> <ScrollWheelLeft> <nop>
    nmap <buffer> <S-ScrollWheelLeft> <nop>
    nmap <buffer> <C-ScrollWheelLeft> <nop>
    nmap <buffer> <ScrollWheelRight> <nop>
    nmap <buffer> <S-ScrollWheelRight> <nop>
    nmap <buffer> <C-ScrollWheelRight> <nop>
    
    nmap <C-a> :enew <bar> startinsert <bar> :Goyo 80<CR>
endfun

" Define a variable to keep track of the wrap state
let g:wrap_on = 0

" Define a function to toggle wrap on or off
function! ToggleWrap()
    if g:wrap_on
        set nowrap
        let g:wrap_on = 0
    else
        set wrap
        let g:wrap_on = 1
    endif
endfunction

" Bind Ctrl-w to the ToggleWrap function
nnoremap <C-w> :call ToggleWrap()<CR>

" Run after doing all the startup stuff
autocmd VimEnter * call Start()

let g:tex_fast = "bMpr"
let g:tex_conceal = ""


let g:UltiSnipsSnippetDirectories=[$HOME . "/.config/nvim/UltiSnips"]
autocmd FileType markdown CocDisable

function! SetupEnvironment()
  if (&ft == 'markdown' || &ft == 'txt' || &ft == 'tex' || &ft == 'bend')
    setlocal wrap 
    let b:coc_suggest_disable=1
    setlocal spell
    set spelllang=en_us
  endif

  if (&ft == 'tex')
    setlocal wrap
    let b:coc_suggest_disable=1
    " this doesn't work for some weird reason
    " let g:UltiSnipsExpandTrigger = '<tab>'
    " let g:UltiSnipsJumpForwardTrigger = '<ctrl-m>'
    " let g:UltiSnipsJumpBackwardTrigger = '<ctrl-n>'
    setlocal spell
    set spelllang=en_us
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
  else 
    inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  endif
endfunction


" nnoremap <leader>yl /\](<CR>vlT)y
nnoremap <leader>yl ?\](<CR>lvi)y:nohlsearch<CR>

nnoremap <leader>yb :call YankIfMatchesRegex()<CR>
function! YankIfMatchesRegex()
    " Get the word under the cursor
    let word = expand('<cword>')

    " Check if the word matches the regex pattern
    if word =~ 'http[s]\?://\S\+'
        " Yank the word
        normal! viw
        normal! y 
        echo "Link yanked!"
    else
        echo "Not a valid link."
    endif
endfunction

autocmd! BufReadPost,BufNewFile * call SetupEnvironment()
let g:python3_host_prog = '/usr/bin/python3'

" sourcing other rcs
source ~/.config/nvim/vimtex-rc.vim
" source ~/.config/nvim/bufferline-rc.vim
source ~/.config/nvim/vimspector-rc.vim
source ~/.config/nvim/coc-rc.vim
source ~/.config/nvim/nerdtree-rc.vim
source ~/.config/nvim/airline-rc.vim
source ~/.config/nvim/nerdcommenter-rc.vim
source ~/.config/nvim/copilot.vim
lua require'vimtree'
let g:barbar_auto_setup = v:false " disable auto-setup
lua << EOF
  require'barbar'.setup {

  }
EOF
source ~/.config/nvim/barbar.vim

" lua << EOF 
" require'nvim-treesitter.configs'.setup {
  " -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  " ensure_installed = { "markdown_inline", "bend" },

  " -- Install parsers synchronously (only applied to `ensure_installed`)
  " sync_install = false,

  " -- Automatically install missing parsers when entering buffer
  " -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  " auto_install = true,

  " -- List of parsers to ignore installing (or "all")
  " ignore_install = { "javascript" },

  " ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  " -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  " highlight = {
    " enable = true,

    " disable = { "c", "rust", "tex", "markdown"},
    " -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    " disable = function(lang, buf)
        " local max_filesize = 100 * 1024 -- 100 KB
        " local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        " if ok and stats and stats.size > max_filesize then
            " return true
        " end
    " end,

    " -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    " -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    " -- Using this option may slow down your editor, and you may see some duplicate highlights.
    " -- Instead of true it can also be a list of languages
    " additional_vim_regex_highlighting = false,
  " },
" }


" local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
" parser_config.bend = {
  " install_info = {
    " url = "https://github.com/HigherOrderCO/tree-sitter-bend",
    " files = { "src/parser.c", "src/scanner.c" },
    " branch = "main",
  " },
" }

" vim.filetype.add({
  " extension = {
    " bend = "bend",
  " },
" })

" vim.treesitter.language.register("bend", { "bend" })

" EOF

" lua require'nvim-lspconfig'
" lua dofile("~/.config/nvim/lua/barbar.lua")
" luafile ~/.config/nvim/lua/barbar.lua
