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
Plug 'vim-airline/vim-airline-themes'
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-hclfmt'
Plug 'fatih/vim-go'
Plug 'altercation/vim-colors-solarized'
call plug#end()

" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------
syntax enable
colorscheme solarized
set number "Show number lines. 
set cursorline "Higlights the line the cursor is.

" ----------------------------------------------------------------------------
" Spaces & Tabs
" ----------------------------------------------------------------------------
set tabstop=4 "How large is a "Tab".
set softtabstop=4 "
set shiftwidth=4 "Identation with << and >>.
set expandtab "Expand tabs to spaces.
set nosmarttab "Fuck tabs.

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------
set autoindent "Automatic indent new lines.
set smartindent "Be smart about it.
set formatoptions+=n "Support for numbered/bullet lists.
set virtualedit=block "Allow virtual edit in visual block.

" ----------------------------------------------------------------------------
" Searching
" ----------------------------------------------------------------------------
set hlsearch "Highlight search occurences.
set incsearch "Set incremental searches.

" ----------------------------------------------------------------------------
" 
" ----------------------------------------------------------------------------
nnoremap <CR> :noh<CR> "Removes the search higligh with a enter keystroke.
map <F10> :set !wrap<CR>
set backspace=indent,eol,start "Enables backspace usage as the rest of the editors.
set clipboard=unnamed "Shares the Vim clipboard with the OS X clipboard.
set mouse=a
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16


" ----------------------------------------------------------------------------
" Extra plugin configuration.
" ----------------------------------------------------------------------------
source ~/.vimrc.d/airline.vim "Particular plugin configuration
source ~/.vimrc.d/nerdtree.vim "Particular plugin configuration
