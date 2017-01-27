" vim:foldmethod=marker
" mapleader needs to be set first, before plugins are loaded
let mapleader="\<space>"       " leader is comma

set modeline
set modelines=1

" ========= PLUGINS ========= {{{
set nocompatible              " be iMproved, required
filetype off                  " required

nnoremap <leader>pi :PluginInstall<cr>
nnoremap <leader>pl :PluginList<cr>
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
" Simpler session management (vim-misc is a requirement)
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
" 
Plugin 'ggreer/the_silver_searcher'
"
Plugin 'jtfmumm/pony-vim-expansions'
" Auto close parens, braces, etc. <leader>a toggles it off and on.
Plugin 'vim-scripts/AutoClose'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" ========= LEADER ========= {{{
" save session so it's there next time you open vi
nnoremap <leader>s :mksession<CR>
" open ag.vim, Silver Searcher search
""nnoremap <leader>SOMETHING :Ag
" }}}

" ========= COMPILER ========= {{{
" "nnoremap <leader>SOMETHING :cexpr system('stable fetch && stable env ponyc ' . shellescape(expand('%:r')))
" }}}

" ========= BINDINGS ========= {{{
" Ex and save
noremap <leader>; :
noremap <leader>s :w<cr>
noremap <leader>x :x<cr>

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

" edit and source $MYVIMRC
noremap <leader>ve :edit $MYVIMRC<cr>
noremap <leader>vs :source $MYVIMRC<cr>

" get to normal mode
inoremap jk <esc>
vnoremap jk <esc>

" quickly select text with shift up and down
nnoremap <S-Up> v<Up>
nnoremap <S-Down> v<Down>
vnoremap <S-Up> <Up>
vnoremap <S-Down> <Down>

"  use backspace to delete a line
nnoremap <bs> dd

" Toggle quick fix window on and off
nnoremap <leader>q :call QuickfixToggle()<cr>
nnoremap <leader>k :cprev<cr>
nnoremap <leader>j :cnext<cr>

" Close buffer without closing window
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>!d :bp<bar>sp<bar>bn<bar>bd!<CR>

" jump to line or end of file with \
nnoremap \ G

" searches (assume ag)
nnoremap <leader>f :grep ''<left>
nnoremap <leader>pf :grep '' -G .pony<S-left><S-left><S-left><right>

" call :normal
noremap <leader>n :normal 
" }}}

" ========= FILES ======== {{{
" Create file under cursor (but it will put it relative to pwd)
noremap <leader>c :e <cfile><cr>
" }}}

" ========= COLORS ========= {{{
syntax on
silent! colorscheme badwolf
" set background=dark
" silent! colorscheme default

" Highlight where characters go over 80 on a line.
set textwidth=80
set colorcolumn=+1
""let &colorcolumn=join(range(81,1999),",")
""let &colorcolumn="80,".join(range(120,1999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" }}}

" ========= TABS ========= {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spacesi
set shiftwidth=2    " sets indent size
" }}}

" ========= UI ========= {{{
set visualbell			    " no sounds
set number              " show line numbers
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

if has('mouse')
  set mouse=a             " enables mouse for all modes, alt-click over ssh
endif
" }}}

" ========= SEARCHING ========= {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase      	  " Ignore case when searching...
set smartcase       	  " ...unless we type a capital
" turn off search highlight by pressing <leader><SPACE>
nnoremap <leader><space> :nohlsearch<CR>

" The Silver Searcher
if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor

   " Use ag in CtrlP for listing files. Lightning fast and respects
   " .gitignore
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
   " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif
" }}}

" ========= SURROUNDING ========= {{{
" surround word under cursor in quotes
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" surround last visual selection in quotes
:nnoremap <leader>' <esc>`<i"<esc>`>a"<esc>l
" }}}

" ========= MOVEMENT ========= {{{
" move to beginning/end of line
nnoremap H ^
nnoremap L $
" }}}

" ========= SCROLLING ========= {{{
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
" }}}

" ========= MEMORY ========= {{{
set hidden
set history=1000
" }}}

" ========= BUFFERS ========== {{{
" Press tab at menu to autocomplete after :b etc.
" Keep pressing to cycle through.
set wildchar=<Tab> wildmenu wildmode=full
" }}}

" ========= NERDTREE ========= {{{
" Open nerdtree automatically if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open and close NERDTree with Ctrl-n
noremap <leader>m :NERDTreeToggle<CR>
" }}}

" ========= CTRLP ============= {{{
let g:ctrlp_map='<c-t>'
" }}}

" ========= MINIBUFEXPLORER ========== {{{
" Use open to open or toggle to open/close.
" Use in conjunction with normal buffer commands:
"  :b3 open 3, :bd4 close 4, etc. 
" noremap <leader>o :MBEOpen<cr>
" noremap <leader>c :MBEClose<cr>
" noremap <leader>t :MBEToggle<cr>
" }}}

" ========= AIRLINE ============ {{{
let g:airline#extensions#tabline#enabled = 1
" }}}

" ========= VIMSESSION ======== {{{
nnoremap <leader>gs :SaveSession 
nnoremap <leader>go :OpenSession 
nnoremap <leader>gr :RestartVim<cr> 
" Don't prompt for autosave on close
let g:session_autosave = 'no'
" }}}

" ========= FUNCTIONS =========== {{{
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}
