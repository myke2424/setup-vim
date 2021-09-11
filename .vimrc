set tabstop=4 softtabstop=4
set shiftwidth=5
set expandtab
set smartindent
set exrc
set nu
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set cursorline

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/mileszs/ack.vim.git'
Plug 'https://github.com/puremourning/vimspector.git'
Plug 'https://github.com/szw/vim-maximizer.git'
Plug 'https://github.com/Chiel92/vim-autoformat.git'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/dense-analysis/ale.git'
Plug 'junegunn/fzf'
call plug#end()

filetype plugin on
colorscheme gruvbox
set background=dark

"Ale Settings"
execute pathogen#infect()
let b:ale_linters = ['flake8']
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['yapf', 'isort']}
let g:ale_fix_on_save = 1

"leader key is spacebar"
let mapleader = " "
let g:vimspector_enable_mappings = 'HUMAN'
let g:python3_host_prog='/usr/bin/python3.8'

" <leader>cc -> comments out current line "
" <leader>c <space> -> comment toggle "

"Comment out block in visual mode"
nnoremap <leader>cb :NERDCommenterNested<CR>

"Jumps backwards file"
nnoremap <leader>b <C-O>

"Jumps foward file"
nnoremap <leader>f <C-I>

"Save and quit"
nnoremap <leader>wq :wq!<CR>

"Save"
nnoremap <leader>w :w<CR>

"Quit"
nnoremap <leader>q :q!<CR>

"Fuzzy file finder"
nnoremap <leader>p :FZF<CR>

"Switch to the left window"
nnoremap <leader><Left> :wincmd h<CR>

"Switch to the right window"
nnoremap <leader><Right> :wincmd l<CR>

"Open up new vim vertical window"
nnoremap <leader>vs :vsplit<CR>

"Horizontal window split"
nnoremap <leader>hs :split<CR>

"Presss space t space then n to open nerdtree"
nnoremap <leader>n :NERDTree<CR>

"Press space then t to toggle nerdtree"
nnoremap <leader>nt :NERDTreeToggle<CR>

"Go to <object> definition"
nnoremap <leader>g :YcmCompleter GoTo<CR>

"Find all references"
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

"Format my code"
nnoremap <leader>fc :Autoformat<CR>

"Format code when saving file"
"au BufWrite * :Autoformat

"Notes
" Ctrl + O Jumps backwards
" Ctrl + I Jumps forward
" Ctrp + P Search For Files
"
