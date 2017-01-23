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
" Plugin 'dleonard0/pony-vim-syntax'
"
" Git commands. e.g. :Gblame to blame a line, :GStatus for gs
" :Glog loads revisions and lets you iterate over them
" Plugin 'tpope/vim-fugitive'
" NERDTree is a better file explorer. Open with ,m (mine)
Plugin 'scrooloose/nerdtree'
" Press <c-t> (mine) for fuzzy search. Once there, <c-d> to cycle filename or path,
" ..<ENTER> to go up a directory, F5 to purge cache and get new files
Plugin 'ctrlpvim/ctrlp.vim'
" Autocomplete. You need to install via:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
Plugin 'Valloric/YouCompleteMe'
" Minibuffer explorer (set up below)
" Plugin 'fholgado/minibufexpl.vim'
"
Plugin 'sjl/badwolf'
"
Plugin 'vim-airline/vim-airline'
" I've got <leader>a to open this
" Plugin 'ggreer/the_silver_searcher'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========= LEADER =========
" save session so it's there next time you open vi
nnoremap <leader>s :mksession<CR>
" open ag.vim, Silver Searcher search
" nnoremap <leader>a :Ag

" ========= BINDINGS =========
noremap ; :
" Move to beginning and end of line in insert mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
" Use tab and shift-tab for indent in all modes
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Move between buffers
noremap <S-Left> :bp<cr>
noremap <S-Right> :bn<cr>

noremap <leader>ev :edit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

inoremap jk <esc>
vnoremap jk <esc>

" ========= COLORS =========
syntax on
colorscheme badwolf
" set background=dark
" silent! colorscheme default

" ========= TABS =========
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spacesi
set shiftwidth=2    " sets indent size

" ========= UI =========
set visualbell			    " no sounds
set number              " show line numbers
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

if has('mouse')
  set mouse=a             " enables mouse for all modes, alt-click over ssh
endif

" ========= SEARCHING =========
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase      	  " Ignore case when searching...
set smartcase       	  " ...unless we type a capital
" turn off search highlight by pressing <leader><SPACE>
nnoremap <leader><space> :nohlsearch<CR>

" The Silver Searcher
" if executable('ag')
"    " Use ag over grep
"    set grepprg=ag\ --nogroup\ --nocolor
" 
"    " Use ag in CtrlP for listing files. Lightning fast and respects
"    " .gitignore
"    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"    " ag is fast enough that CtrlP doesn't need to cache
"    let g:ctrlp_use_caching = 0
" endif

" ========= SURROUNDING =========
" surround word under cursor in quotes
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" surround last visual selection in quotes
:nnoremap <leader>' <esc>`<i"<esc>`>a"<esc>l

" ========= MOVEMENT =========
" move to beginning/end of line
nnoremap H ^
nnoremap L $

" ========= SCROLLING =========
set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" ========= MEMORY =========
set hidden
set history=1000

" ========= BUFFERS ==========
" Press tab at menu to autocomplete after :b etc.
" Keep pressing to cycle through.
set wildchar=<Tab> wildmenu wildmode=full
nnoremap ui :bd

" ========= NERDTREE =========
" Open nerdtree automatically if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open and close NERDTree with Ctrl-n
noremap <leader>m :NERDTreeToggle<CR>

" ======== CTRLP =============
let g:ctrlp_map='<c-t>'

" ======== MINIBUFEXPLORER ==========
" Use open to open or toggle to open/close.
" Use in conjunction with normal buffer commands:
"  :b3 open 3, :bd4 close 4, etc. 
" noremap <leader>o :MBEOpen<cr>
" noremap <leader>c :MBEClose<cr>
" noremap <leader>t :MBEToggle<cr>
" ======== AIRLINE ============
let g:airline#extensions#tabline#enabled = 1

" ======== PONY ==============
inoremap pf @printf[I32]("\n".cstring())<Esc>13<Left>i
inoremap ifj if   then<cr>  <cr><bs>end<esc>2<up>1<right>i
inoremap ifej if   then<cr>  <cr><bs>else<cr><cr><bs>end<esc>7<up>1<right>i
inoremap trj try<cr>  <cr><bs>end<esc>1<up><tab>i
inoremap trej try<cr>  <cr><bs>else<cr>  <cr><bs>end<esc>3<up><tab>i
