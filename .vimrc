" Basic Vim configuration
set nocompatible
filetype off

" Display
set number
set relativenumber
set ruler
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set cursorline
set laststatus=2

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Editing
set backspace=indent,eol,start
set scrolloff=8
set sidescrolloff=8
set clipboard=unnamed
set mouse=a

" File handling
set autoread
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo//

" Create backup directories if they don't exist
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "p")
endif
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "p")
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p")
endif

" Key mappings
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Syntax highlighting
syntax enable
filetype plugin indent on

" Color scheme
if has('termguicolors')
    set termguicolors
endif

" Status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Plugins (uncomment if using vim-plug)
" call plug#begin('~/.vim/plugged')
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-fugitive'
" Plug 'preservim/nerdtree'
" call plug#end()