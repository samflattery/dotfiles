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
"  Ctrl + arrow to navigate tabs
nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>

" --- Make vim open where left off ---
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" --- Making Vim look good ----
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" --- Vim as text editor ---
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'

" --- Easytags and tagbar ---
"  generates tag fields
"  compiled index of functions and variables
"  open with \b
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
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary' "gc to comment out stuff in visual mode
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat' "use dot on surround commands
Plugin 'easymotion/vim-easymotion'

" --- Tmux ---
" Navigate windows easily
" < = C-h
" v = C-j, etc...
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'

" --- Syntax Plugins ---
Plugin 'jez/vim-c0'
Plugin 'justinmk/vim-syntax-extra'

" --- SML ---
Plugin 'benmills/vimux'
Plugin 'jez/vim-better-sml'

" --- Extras ---
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'HTML-AutoCloseTag'
Plugin 'junegunn/goyo.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'ryanoasis/vim-devicons'

" --- Multiple Cursors ---
" Ctrl + N to select
" c changes
" I inserts at start
" A inserts at end
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()


set t_Co=256
syntax enable
set encoding=UTF-8
let g:solarized_termtrans=1
let g:solarized_termcolors=16
set background=dark
colorscheme solarized

filetype plugin indent on
set tabstop=4
set shiftwidth=4

" --- General Settings ---
set backspace=indent,eol,start
set noruler
set noshowmode
set number
set showcmd
set incsearch
set hlsearch " :nohls
set clipboard=unnamed
set colorcolumn=80

"" syntax on
set mouse=a

" For syntastic
hi clear SignColumn

" -------- Plugin-Specific Settings -----------

" --- bling/vim-airline settings ---
" Always show status bar
set laststatus=2

let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='solarized'

let g:airline_section_b=''
let g:airline_section_y=''
let g:airline_section_error=''
let g:airline_section_warning=''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr=' ㏑'
" let g:airline_symbols.linenr='㏑'

" --- Tmuxline ---
let g:tmuxline_preset={
	\'a' : '#S',
	\'b' : '#W',
	\'c' : 'sam',
	\'win' : '#I #W',
	\'cwin' : '#I #W',
	\'x' : '%H:%M',
	\'y' : '#W',
	\'z' : ''}

let g:airline#extensions#tmuxline#enabled=0
let g:tmuxline_theme='iceberg'
let airline#extensions#tmuxline#snapshot_file="~.tmux-status.conf"

" --- nerdtree ---
" open and close with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" let g:nerdtree_tabs_open_on_console_startup=1

" --- Syntastic ---
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='▲'
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode''passive'
augroup end

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" close location list with :lclose
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" press \S to not automatically check for errors
nnoremap <Leader>s :SyntasticToggleMode<CR>

" --- xolox/easy tags ---
" where to look for tags files
set tags=./tags:,~/.vimtags
" defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>a :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" --- Git Settings ---
" only display of diff is non-zero
let g:airline#extensions#hunks#non_zero_only=1

" --- DelimitMate Settings ---
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" --- vim-better-sml Settings ---
augroup vimbettersml
  au!

  " ----- Keybindings -----

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

  " ----- Other settings -----

  " Uncomment to try out conceal characters
  " For some reason only works when conceallevel set globally
  au FileType sml setlocal conceallevel=2
  set conceallevel=2
  " Uncomment to try out same-width conceal characters
  let g:sml_greek_tyvar_show_tick = 1
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

" --- Extras ---
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=0
