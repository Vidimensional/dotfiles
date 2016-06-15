"
"

nnoremap <CR> :noh<CR>
map <F10> :set !wrap<CR>
" ----------------------------------------------------------------------------
" Colors
" ----------------------------------------------------------------------------
syntax enable

" ----------------------------------------------------------------------------
" Spaces & Tabs
" ----------------------------------------------------------------------------
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab " expand tabs to spaces
set nosmarttab " fuck tabs

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------
set autoindent " automatic indent new lines
set smartindent " be smart about it
set formatoptions+=n " support for numbered/bullet lists
"set textwidth=80 " wrap at 80 chars by default
set virtualedit=block " allow virtual edit in visual block ..
colorscheme desert
" Searching
set hlsearch
set incsearch
set cursorline
"set cursorcolumn
set nu

set mouse=a

" ----------------------------------------------------------------------------
" Vundle Requirements
" Info: https://github.com/gmarik/Vundle.vim#quick-start
" ----------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"""List of Plugins"""
Plugin 'stephpy/vim-yaml' "Faster YAML syntax
Plugin 'tpope/vim-fugitive' "Git magic
Plugin 'scrooloose/nerdtree' "Directory tree
Plugin 'kien/ctrlp.vim' "Search
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'b4b4r07/vim-hcl'
Plugin 'fatih/vim-hclfmt'


call vundle#end()            " required
filetype plugin indent on    " required

source ~/.vimrc.d/airline.vim "Particular plugin configuration
source ~/.vimrc.d/nerdtree.vim "Particular plugin configuration

set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
