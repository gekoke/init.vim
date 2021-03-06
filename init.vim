nnoremap <SPACE> <Nop>
let mapleader = " "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

syntax on

set clipboard+=unnamedplus
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set shortmess=I

call plug#begin("~/.config/nvim/autoload")

Plug 'easymotion/vim-easymotion' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
" Markdown plugin
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

colorscheme gruvbox
:hi Normal guibg=NONE ctermbg=NONE

" Make jj switch from insert mode to normal mode
inoremap jj <esc>

" Set hotkey to open init.vim
map <leader>rc :e $MYVIMRC<cr>

" Disable an annoying message
nnoremap <C-c> <silent> <C-c>


" fzf hotkeys


" Easymotion hotkeys
map <Leader> <Plug>(easymotion-prefix)


" Run python code in same buffer with a single keystroke
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
