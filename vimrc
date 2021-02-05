"
"     ██▒   █▓ ██▓ ███▄ ▄███▓ ██▀███   ▄████▄
"    ▓██░   █▒▓██▒▓██▒▀█▀ ██▒▓██ ▒ ██▒▒██▀ ▀█
"     ▓██  █▒░▒██▒▓██    ▓██░▓██ ░▄█ ▒▒▓█    ▄
"      ▒██ █░░░██░▒██    ▒██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
"       ▒▀█░  ░██░▒██▒   ░██▒░██▓ ▒██▒▒ ▓███▀ ░
"       ░ ▐░  ░▓  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░ ░▒ ▒  ░
"       ░ ░░   ▒ ░░  ░      ░  ░▒ ░ ▒░  ░  ▒
"         ░░   ▒ ░░      ░     ░░   ░ ░
"          ░   ░         ░      ░     ░ ░
"         ░                           ░
set nocompatible

" --- Key Bindings ---

" Recognize dollar signs in LaTeX
:onoremap <silent> i$ :<c-u>normal! T$vt$<cr>
:vnoremap i$ T$ot$

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
"Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Add comma/semi colon with leader ;
nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)

" Make double<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Ctrl + arrow to navigate tabs
nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>

" Make navigating wrapped lines the same as normal
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> gk k
noremap <silent> gj j
noremap <silent> ^ g^
noremap <silent> g^ ^
noremap <silent> _ g_

" Change <space> from same as <l> to <leader>
map <space> <leader>

" Make vim open where left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

filetype off

" --- PLUGINS START ---
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- Airline ---
"  a status line for vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" --- Colorschemes ---
Plugin 'altercation/vim-colors-solarized'
Plugin 'rakr/vim-one'
Plugin 'arcticicestudio/nord-vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'drewtempelmeyer/palenight.vim'

" --- Text Editor Features ---
"  \t to open a file viewer
"  \s to enable and disable syntax checking
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ryanoasis/vim-devicons' " adds icons to status bar and nerdtree
Plugin 'vim-syntastic/syntastic'

" --- Easytags and tagbar ---
"  generates tag fields
"  compiled index of functions and variables
"  open with \a
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" --- ctrlp ---
" fuzzy finds files
" ctrl + P and type
" enter to open file, Ctrl + T to open new tab
Plugin 'ctrlpvim/ctrlp.vim'

" --- A.vim ---
" :AT opens alternate file (.c\.h)
Plugin 'vim-scripts/a.vim'

" --- Working with Git ---
" shows signs next to changes
" see list of commands (:Gwrite, ...)
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" --- Other text editing features ---
"  auto close parens, quotes, etc.
"  gc to comment out stuff in visual mode
"  trim whitespace on save
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'HTML-AutoCloseTag'
Plugin 'terryma/vim-smooth-scroll' " makes scrolling animated

" --- vim-surround ---
" in visual mode, S + char -> surround the selected with the character
" use cs<char><char'> to change surrounding of char to char'
" use ysiw<char> to surround a word with a char
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat' "use dot on surround commands

" --- easymotion ---
" navigate text more easily using <leader><motion>
" where command is either w, b, e, j, k, d, f
" d is bidirectional find, f is one direction
Plugin 'easymotion/vim-easymotion'

" --- Tmux ---
" Navigate windows easily
" < = C-h
" v = C-j, etc...
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim' " gives vim a nice tmux-like status bar

" --- Syntax Plugins ---
Plugin 'jez/vim-c0'
Plugin 'justinmk/vim-syntax-extra'

" --- SML ---
Plugin 'benmills/vimux'
Plugin 'jez/vim-better-sml'

" --- Goyo ---
" use :Goyo to enable distraction-free, :Goyo! to disable
Plugin 'junegunn/goyo.vim'

" --- Multiple Cursors ---
" Ctrl + N to select
" c changes
" I inserts at start
" A inserts at end
Plugin 'terryma/vim-multiple-cursors'

" --- Miscellaneous ---
Plugin 'jez/vim-superman' " view man pages in vim
Plugin 'jez/vim-ispc' " highlight ispc files
Plugin 'vim/killersheep' " :KillKillKill starts a fun game
Plugin 'https://github.com/lfilho/cosco.vim' " <leader>; to add ;/,

call vundle#end()

" --- PLUGINS END ---

" --- Colorscheme Settings
set t_Co=256
syntax enable
set encoding=UTF-8
let g:solarized_termtrans=1
let g:solarized_termcolors=16
colorscheme solarized
set background=dark

" --- Indent Settings ---
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 2 spaces in C/C++ files
autocmd Filetype cpp,c setlocal expandtab
autocmd Filetype cpp,c setlocal tabstop=2
autocmd Filetype cpp,c setlocal softtabstop=2
autocmd Filetype cpp,c setlocal shiftwidth=2

autocmd Filetype sml setlocal expandtab
autocmd Filetype why3 setlocal expandtab

" --- General Settings ---
set backspace=indent,eol,start
set noruler
set noshowmode
set number
set showcmd
set incsearch
set hlsearch " :nohl to un-highlight
set clipboard=unnamed
set colorcolumn=80

autocmd Filetype cpp,c setlocal colorcolumn=100

set mouse=a
set splitright
set splitbelow
set ignorecase " case insensitive searching (specify lower with \c)
set smartcase " if upper case in string, case sensitive
hi clear SignColumn " For syntastic

" --- File Specific Settings ---
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.inl set filetype=cpp
au BufRead,BufNewFile *.cu_inl set filetype=cpp
autocmd FileType why3 setlocal commentstring=(*%s*)

" --- Relative Line Numbers ---
" set rnu
" function! ToggleRelativeOn()
"     set rnu!
" endfunction
" autocmd FocusLost * call ToggleRelativeOn()
" autocmd FocusGained * call ToggleRelativeOn()
" autocmd InsertEnter * call ToggleRelativeOn()
" autocmd InsertLeave * call ToggleRelativeOn()

" -------- Plugin-Specific Settings -----------

" --- Vim-Airline ---
" Always show status bar
set laststatus=2

let g:airline_powerline_fonts=0
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='solarized'

" turn off some sections I don't like
let g:airline_section_b=''
let g:airline_section_y=''
let g:airline_section_error=''
let g:airline_section_warning=''

" change the current line symbol
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr=' ㏑'

" --- Tmuxline ---
"  customize how the tmuxline bar looks
let g:tmuxline_preset={
	\'a' : '#S',
	\'b' : '#W',
	\'c' : 'sam',
	\'win' : '#I #W',
	\'cwin' : '#I #W',
	\'x' : '%H:%M',
	\'y' : '#W',
	\'z' : ''}

let g:tmuxline_powerline_separators=1
let g:airline#extensions#tmuxline#enabled=0
" let airline#extensions#tmuxline#snapshot_file="~/dotfiles/tmux-status.conf"

" --- Nerdtree ---
" open and close with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" let g:nerdtree_tabs_open_on_console_startup=1

" --- Syntastic ---
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='▲'
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode='passive'
  au FileType cpp let b:syntastic_mode='passive'
augroup end

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_compiler = 'g++-10'
let g:syntastic_cpp_compiler_options = ' -std=c++17'

" close location list with :lclose
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exe = 'python3'
" press \s to not automatically check for errors
nnoremap <Leader>s :SyntasticToggleMode<CR>

" --- EasyTags ---
" where to look for tags files
set tags=./tags:,~/.vimtags
" defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" --- Tagbar ---
" Open/close tagbar with \a
nmap <silent> <leader>a :TagbarToggle<CR>
" autocmd FileType c,cpp nested :TagbarOpen " open tagbar automatically for C

" don't sort the tagbar by name, but by location in file
let g:tagbar_sort = 0
" Uncomment to open tagbar automatically whenever possible
" autocmd BufEnter * nested :call tagbar#autoopen(0)

" --- Git ---
" only display of diff is non-zero
let g:airline#extensions#hunks#non_zero_only=1

" --- DelimitMate ---
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- vim-better-sml ---
augroup vimbettersml
  au!

  au FileType sml nnoremap <silent> <buffer> <leader>y :SMLTypeQuery<CR>
  au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>

  " open the REPL terminal buffer
  au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
  " close the REPL (mnemonic: k -> kill)
  au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
  " build the project (using CM if possible)
  au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
  " for opening a structure, not a file
  au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
  " use the current file into the REPL (even if using CM)
  au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
  " clear the REPL screen
  au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
  " set the print depth to 100
  au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>

  " For some reason only works when conceallevel set globally
  au FileType sml setlocal conceallevel=2
  set conceallevel=2
  au FileType tex setlocal conceallevel=0 " turn it off for latex documents
  " Uncomment to try out same-width conceal characters
  let g:sml_greek_tyvar_show_tick = 1
  let g:sml_auto_create_def_use = 'always'
augroup END

" --- easymotion ---
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>e <Plug>(easymotion-e)
map <Leader>f <Plug>(easymotion-f)
map <Leader>d <Plug>(easymotion-s)

" --- vim-smooth-scroll ---
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>

" --- vim-better-whitespace ---
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=0

" --- Extras ---
" Read binary files with \hr
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
" Write binary files with \hw
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>
