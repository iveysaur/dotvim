set nocompatible
set encoding=utf-8

" Style
set background=dark
colorscheme jellybeans
set guifont=Inconsolata-dz\ for\ Powerline:h9
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

" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Plugins

set undolevels=400  " Vim setting

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
au FileType php set omnifunc=phpcomplete#CompletePHP

        " Some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y><C-x><C-o>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " Automatically open and close the popup menu / preview window
        au InsertLeave * if pumvisible() == 0|silent! pclose|endif
		inoremap <C-c> <ESC> 
        set completeopt=menu,longest
		set completeopt-=preview
		
let g:NERDShutUp=1

hi CursorLineNr   term=bold ctermfg=Gray gui=bold guifg=#c5c5c5

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Nodejs dictionary
au FileType javascript set dictionary+=$HOME/vimfiles/bundle/vim-node/dict/node.dict

" Brolink
au BufWritePost */templates/*.html :BLReloadTemplate

map <C-\> :execute "Ag " . expand("<cword>") <CR>

" gcc compile C files
autocmd filetype c nnoremap <Leader>c :w <CR>:!gcc % -o %:r && %:r<CR>

" java stuff to make it compile and run
autocmd filetype java nnoremap <Leader>c :w <CR>:!javac airportmain/AirportMain.java && java airportmain/AirportMain<CR>

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
