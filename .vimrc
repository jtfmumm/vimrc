" mapleader needs to be set first, before plugins are loaded
let mapleader=","       " leader is comma

" ========= PLUGINS =========
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
Plugin 'jakwings/vim-pony'
"
Plugin 'sjl/badwolf'
" Git commands. e.g. :Gblame to blame a line, :GStatus for gs
" :Glog loads revisions and lets you iterate over them
Plugin 'tpope/vim-fugitive'
" NERDTree is a better file explorer. Open with ,m (mine)
Plugin 'scrooloose/nerdtree'
" Press <c-t> (mine) for fuzzy search. Once there, <c-d> to cycle filename or path,
" ..<ENTER> to go up a directory, F5 to purge cache and get new files
Plugin 'ctrlpvim/ctrlp.vim'
" Autocomplete. You need to install via:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
Plugin 'Valloric/YouCompleteMe'
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========= LEADER =========
" save session so it's there next time you open vi
nnoremap <leader>s :mksession<CR>
" open ag.vim, Silver Searcher search
nnoremap <leader>a :Ag

" ========= BINDINGS =========
map ; :
" Move to beginning and end of line in insert mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" ========= COLORS =========
colorscheme badwolf

" ========= TABS =========
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spacesi

" ========= UI =========
set visualbell			" no sounds
set number              " show line numbers
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" ========= SEARCHING =========
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase      	" Ignore case when searching...
set smartcase       	" ...unless we type a capital
" turn off search highlight by pressing <leader><SPACE>
nnoremap <leader><space> :nohlsearch<CR>

" ========= MOVEMENT =========
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" ========= SCROLLING =========
set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" ========= MEMORY =========
set hidden
set history=1000

" ========= NERDTREE =========
" Open nerdtree automatically if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open and close NERDTree with Ctrl-n
map <leader>m :NERDTreeToggle<CR>

" ======== CTRLP =============
let g:ctrlp_map='<c-t>'
