"==========================================
" @Author: runsheng
" @Time: 2016/03/24
" @Desc: simple vim config for server, mainly used for python
"==========================================
" syntax
syntax on


" history : how many lines of history VIM has to remember
set history=2000


" backup and swap off
set nobackup
set noswapfile


" tab for python
set tabstop=4
set shiftwidth=4
set softtabstop=4               " insert mode tab and backspace use 4
set smarttab                    " replace tab to space automatically
set expandtab                   " expand tabs to spaces
set shiftround
" indent
set autoindent smartindent shiftround


" filetype
filetype on
" Enable filetype plugins
filetype plugin on
filetype indent on


" base
set shortmess=atI
set magic                       " For regular expressions turn magic on
set title                       " change the terminal's title


" NOOOOOOOO BEEP AT ALL
set novisualbell                " turn off visual bell
set noerrorbells                " don't beep
set visualbell t_vb=            " turn off error beep/flash
set t_vb=
set tm=500

" movement
set scrolloff=7                 " keep 3 lines when scrolling


" show
set ruler                       " show the current row and column
set number                      " show line numbers
set nowrap
set showcmd                     " display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis


" search
set hlsearch                    " highlight searches
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present


" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set ffs=unix
set formatoptions+=m
set formatoptions+=B

" mouse on
" set mouse=a
" set mousehide

" select & complete
set selection=inclusive
set selectmode=mouse,key
set completeopt=longest,menu
set wildmenu                           " show a navigable menu for tab completion"
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.class


" ============================ theme and status line ============================

" theme
" set background=dark
" colorscheme desert

" set mark column color
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" ============================ specific file type ===========================

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown  set filetype=markdown.mkd

autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    " .sh
    if &filetype == 'sh'
        call setline(1, "\#!/usr/bin/env bash")
    endif

    " python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1,"\# -*- coding: utf-8 -*-")
        call append(2, "\#@Author: runsheng, runsheng.lee@gmail.com")
        call append(2, "\#@Date: " . strftime("%Y-%m-%d %H:%M:%S"))
    endif

    normal G
    normal o
    normal o
endfunc


" ============================ key map ============================
" use kj to replace esc
inoremap kj <Esc>


" split
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" F2 to F6
nnoremap <F2> :set number! number<CR>
