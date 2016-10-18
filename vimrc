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
" Plug
" Info: https://github.com/junegunn/vim-plug
" ----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'stephpy/vim-yaml' "Faster YAML syntax
Plug 'tpope/vim-fugitive' "Git magic
Plug 'scrooloose/nerdtree' "Directory tree
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-hclfmt'
Plug 'fatih/vim-go'
call plug#end()

" Extra plugin configuration.
source ~/.vimrc.d/airline.vim "Particular plugin configuration
source ~/.vimrc.d/nerdtree.vim "Particular plugin configuration

set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16
