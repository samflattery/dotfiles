# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export TERM="xterm-256color"

#cd with just directory name
setopt autocd
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="agnoster"
ZSH_THEME=""

plugins=(git zsh-autosuggestions z zsh-syntax-highlighting)

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

# Setup pure prompt
fpath+=("$HOME/dotfiles/pure")
autoload -U promptinit; promptinit
prompt pure

# Tab completion for vman
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
compdef vman="man"

# SMLNJ
export PATH=/usr/local/smlnj/bin:"$PATH"

# Aliases
source ~/dotfiles/aliases.sh

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
