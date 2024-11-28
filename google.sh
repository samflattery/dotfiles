# Not actually a shell script, but the diffs to add to
# vimrc/tmuxconf/aliases.sh/zshrc when working in the Google codebase.

#######################################
#               VIMRC                 #
#######################################

" --- Google Stuff ---
source /usr/share/vim/google/google.vim
Glug g4
Glug youcompleteme-google
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'ciderlsp',
  \     'cmdline': [ '/google/bin/releases/cider/ciderlsp/ciderlsp', '--noforward_sync_responses' ],
  \     'filetypes': [ 'java' ]
  \   },
  \ ]

" <leader>bb to blaze build
Glug blaze plugin[mappings]

" Let CtrlP not go all the way up to the root of the client. Instead, consider a
" METADATA file to delimit a project.
let g:ctrlp_root_markers = ['METADATA']
" Use rg for ctrl-p plugin
if executable('rg')
  set grepprg=rg\ --hidden\ --color=never
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'rg --files --hidden --color=never * %s'
endif

" Glug gtimporter
" " Import the work under the cursor
" nnoremap <leader>si :GtImporter<CR>
" " Sort the imports in the (java) file
" nnoremap <leader>ss :GtImporterSort<CR>

" Load the code formatting plugin. We first load the open-source version. Then,
" we load the internal google settings. Then, we automatically enable formatting
" when we write the file for Go, BUILD, proto, and c/cpp files.
" Use :h codefmt-google or :h codefmt for more details.
Glug codefmt
Glug codefmt-google auto_filetypes+=python,

" Wrap autocmds inside an augroup to protect against reloading this script.
" For more details, see:
" https://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup autoformat
  autocmd!
  " Autoformat BUILD files on write.
  autocmd FileType bzl AutoFormatBuffer buildifier
  " Autoformat go files on write.
  autocmd FileType go AutoFormatBuffer gofmt
  " Autoformat proto files on write.
  autocmd FileType proto AutoFormatBuffer clang-format
  " Autoformat c and c++ files on write.
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  " Autoformat java files on write.
  autocmd FileType java AutoFormatBuffer google-java-format
  " Autoformat javascript files on write.
  autocmd FileType javascript AutoFormatBuffer clang-format
augroup END"

" TODO maybe figure out login issue for this.
" Enable the corpweb plugin, which allows us to open codesearch from vim
Glug corpweb
" search in codesearch for the word under the cursor
nnoremap <leader>ws :CorpWebCs <cword> <CR>
" search in codesearch for the current file
nnoremap <leader>wf :CorpWebCsFile<CR>

" Load the Critique integration. Use :h critique for more details
Glug critique

" Load google-internal checkers for Syntastic
Glug syntastic-google plugin[autocmds] checkers=`{'proto': ['glint'], 'borg': ['borgcfg'], 'java': ['glint'], 'python': ['gpylint']}`

" Related files with <leader>r
" c for code file, b for build file, t for test file.
Glug relatedfiles plugin[mappings]

" Import class under cursor with :CsImporter, sort with :CsImporterSort
" or <leader>j/J
Glug google-csimporter
noremap <unique> <leader>ci :CsImporter<CR>
noremap <unique> <leader>cI :CsImporterSort<CR>

" Java filetype
Glug ft-java

" Code search
" :Csearch $arguments
" :Cs $arguments
source /google/src/head/depot/google3/tools/gsearch/contrib/csearch.vim
Glug csearch
" <leader>se to code search word under cursor.
nnoremap <leader>se :Csearch <C-R><C-W><CR><CR>
" <leader>cs to code search visual selection.
vnoremap <leader>cs "ny:<c-u>Csearch "<c-r>=substitute(@n, '\n', '', '')<cr>"<cr>

" Snippets
Glug ultisnips-google
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

#######################################
#               TMUXCONF              #
#######################################
set -g @yank_selection_mouse 'clipboard'
# set-option -g default-command "reattach-to-user-namespace -l $SHELL"

#######################################
#               ALIASES               #
#######################################
alias rpcreplay=/google/data/ro/teams/frameworks-test-team/rpcreplay-cli/live/rpcreplay
alias er=/google/data/ro/users/ho/hooper/er
alias fixjs=/google/src/files/head/depot/google3/third_party/java_src/jscomp/java/com/google/javascript/jscomp/lint/fixjs.sh
alias xl="hg xl"
alias loas_creds.sh='/google/src/head/depot/google3/identity/tools/creds/loas_creds.sh'

#######################################
#                ZSHRC                #
#######################################
# Google
source /etc/bash_completion.d/g4d
