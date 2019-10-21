# aliases
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
alias aliases="vim ~/dotfiles/aliases.sh"

# verbose commands
alias mv="mv -v"
alias cp="cp -v"
alias rm="rm -v"

# misspellings
alias cl="clear"
alias clera="clear"
alias clearl="clear"
alias clears="clear"
alias clearls="clear"
alias sl="ls"
alias l="ls"
alias lsa="ls -a"

# git stuff
alias ga="git add ."
alias gca="git commit -a"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gs="git status"
alias gd="git diff"

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

# open programs
alias ubuntu="open -a VMware\ Fusion"
alias chrome="open -a Google\ Chrome"
alias google="open -a Google\ Chrome"
alias prev="open -a Preview"
alias finder="open -a Finder"
alias twothirteen="open https://www.cs.cmu.edu/~213/schedule.html"
alias babybuggyros="open https://github.com/AtlasBuggy/BabyBuggyROS"
alias dunebuggyros="open https://github.com/AtlasBuggy/DuneBuggyROS"

# random stuff
alias wttr="curl 'wttr.in?format=3'"
alias tmux="tmux -2"
alias sml="rlwrap sml"
alias pip="pip3"
alias duls="du -h -d1 | sort -hr"
alias :wq="exit"
alias :q="exit"
alias rick="curl -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"
