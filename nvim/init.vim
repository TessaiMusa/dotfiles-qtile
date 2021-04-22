
" ===============
" Configs
" ===============

syntax on
set mouse=a
set termguicolors
set number relativenumber
set ignorecase
set smartcase

" Tab settings
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Clipboard
set clipboard+=unnamedplus

" Remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

" Spell Check
map <leader>s :setlocal spell! spelllang=en_us<CR>

" ===============
" Plugins
" ===============

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'

call plug#end()

" ================
" Plugin Config
" ================
colorscheme codedark

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" NERDTree toggle
nnoremap <c-t> :NERDTreeToggle<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
