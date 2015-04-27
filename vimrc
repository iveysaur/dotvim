set nocompatible
set encoding=utf-8

" Style
set background=dark
colorscheme jellybeans
set guifont=Inconsolata-dz\ for\ Powerline:h10
set backspace=2
" Highlight current line
set cursorline

" No more optionsbar
set guioptions=

" Disable sounds
set visualbell
set t_vb = 
set visualbell t_vb=
au GuiEnter * set visualbell t_vb=

" General settings
set number " show line numbers
set relativenumber
set guioptions-=T " no toolbar
let mapleader = ","

" No swp files
set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.
set nobackup " DIE FOUL BEAST
set noswapfile

" Use powerline fonts on airline.
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Remap command+h and command+l to switch buffers
nnoremap <D-h> :bprev<CR>
nnoremap <D-l> :bnext<CR>

" Esc unhighlights!!
nnoremap \ :nohl<CR>

" Enter will enter a new line without insert mode c:
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" Remap K to Ag under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Vundle + Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Git(hub) integration
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'

" Tools
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'iveysaur/vim-buffergator'
Plugin 'rking/ag.vim'

" Syntax stuff
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()

syntax on
filetype plugin on
filetype plugin indent on

set clipboard=unnamed

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

" Statusline
set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" Searching
set showmatch                   " Show matching brackets/parenthesis
set matchtime=0
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

" CTRL-S
nnoremap <silent> <C-S> :<C-u>Update<CR>
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk
	
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
set autoindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cinkeys=0{,0},:,0#,!^F

" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1
let g:DisableAutoPHPFolding = 1

set undolevels=400  " Vim setting

let g:NERDShutUp=1

" Color the cursor line number?
hi CursorLineNr   term=bold ctermfg=Gray gui=bold guifg=#c5c5c5

" Nodejs dictionary
au FileType javascript set dictionary+=$HOME/vimfiles/bundle/vim-node/dict/node.dict

" gcc compile C files
autocmd filetype c nnoremap <Leader>c :w <CR>:!gcc % -o %:r && %:r<CR>

" Shortcuts 
nnoremap <leader>gs :Gstatus<CR>

" Powerline stuff
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_symbols = 'unicode'

let g:Powerline_symbols_override = {
        \ 'BRANCH': '|',
        \ 'LINE': 'LN',
        \ }

" Netrw remote transfers
let g:netrw_silent = 1

source ~/.vim/secret.vim

