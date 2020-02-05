# cdl changes directory and ls's
function cdl {
	builtin cd "$@" && ls -F
}

# easier navigation
alias cdd="cdl .."
alias cddd="cdl ../.."
alias cdddd="cdl ../../.."
alias cddddd="cdl ../../../.."

# easily access files
alias vimrc="vim ~/dotfiles/vimrc"
alias zshrc="vim ~/dotfiles/zshrc"
alias tmuxconf="vim ~/dotfiles/tmux.conf"
alias aliases="vim ~/dotfiles/aliases.sh"

# verbose commands
alias mv="mv -v"
alias cp="cp -v"
alias rm="rm -v"

# misspellings
# i have a problem with typing clear ls after every command
alias cl="clear"
alias clera="clear"
alias clearl="clear"
alias clears="clear"
alias claer="clear"
alias claer="clear"
alias clearls="clear"
alias clea="clear"
alias cear="clear"
alias cearl="clear"
alias sl="ls"
alias rls="ls"
alias l="ls"
alias s="ls"
alias lsa="ls -a"
alias mkae="make"
alias maek="make"
alias gpp="g++"

# git stuff
alias ga="git add ."
alias gca="git commit -a"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gs="git status"
alias gd="git diff"

# credits to github.com/jez for these
GIT_PRETTY_FORMAT="--pretty=\"%C(bold green)%h%Creset%C(auto)%d%Creset %s\""
GIT_PRETTY_FORMAT_AUTHOR="--pretty=\"%C(bold green)%h%Creset %C(yellow)%an%Creset%C(auto)%d%Creset %s\""
# pretty Git log
alias gl="git log --graph $GIT_PRETTY_FORMAT"
# pretty Git log, all references
alias gll='gl --all'
# pretty Git log, show authors
alias gla="git log --graph $GIT_PRETTY_FORMAT_AUTHOR"
# pretty Git log, all references, show authors
alias glla='gla --all'

# ssh
alias andrew="ssh andrew"
alias shark="ssh shark"
alias buggy="ssh buggy"
alias buggylocal="ssh buggylocal"
alias atlas="ssh buggy"
alias atlaslocal="ssh buggylocal"

# open programs
alias ubuntu="open -a VMware\ Fusion"
alias chrome="open -a Google\ Chrome"
alias google="open -a Google\ Chrome"
alias prev="open -a Preview"
alias finder="open -a Finder"
alias babybuggyros="open https://github.com/AtlasBuggy/BabyBuggyROS"
alias dunebuggyros="open https://github.com/AtlasBuggy/DuneBuggyROS"

# spotify stuff from osx plugin for zsh
alias sp="spotify"
alias spn="spotify next"
alias spp="spotify play"
alias sps="spotify status"
alias sppp="spotify pause"

# random stuff
alias wttr="curl 'wttr.in?format=3'" # get the current weather
alias tmux="tmux -2" # for better colors
alias sml="rlwrap sml"
alias pip="pip3"
alias duls="du -h -d1 | sort -hr" # list disk usage for current folder
alias :wq="exit"
alias :q="exit"
alias quit="exit"
alias please="sudo"
alias rick="curl -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
alias m="mac"
alias python="python3" # rip

if [[ "$(uname)" == "Darwin" ]]; then
	alias find="mdfind" # better find for mac
	alias time='gtime -f "%U user, %S system, %e real, %MkB mem -- %C"'
	alias decomp='~/dev/util/retdec/bin/retdec-decompiler.py'
fi

# remove auto generated files
alias rmswp='rm .*.swp'
alias rmtag='rm tags:'
