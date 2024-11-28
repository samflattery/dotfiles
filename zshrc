# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM="xterm-256color"

#cd with just directory name
setopt autocd
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="agnoster"

plugins=(git zsh-autosuggestions z zsh-syntax-highlighting macos)

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/keybindings.sh

# Source shell scripts
export PATH="$PATH:$HOME/dotfiles/scripts"

# 418-Specific Libraries
export PATH="/usr/local/depot/ispc-v1.9.1-linux/:$PATH"
export PATH="/usr/local/depot/cuda/bin/:$PATH"
export LD_LIBRARY_PATH="/usr/local/depot/cuda/lib64:$LD_LIBRARY_PATH"

# 440
export LD_LIBRARY_PATH="~/private/15440/p1/lib:$LD_LIBRARY_PATH"

# Setup pure prompt
fpath+=("$HOME/dotfiles/pure")
autoload -U promptinit; promptinit
prompt pure
RPROMPT='%{$fg[yellow]%}[%T]'
# RPROMPT="[%D{%f/%m/%y} | %D{%H:%M:%S}]"
# RPROMPT="%{$fg[yellow]%}[%D{%f/%m/%y} | %D{%H:%M:%S}]"


# Tab completion for vman
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
export PATH="$HOME/bin/mlton-install/bin:$PATH"
export PATH="$HOME/test/mlton-install/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.8/bin"
compdef vman="man"

# SMLNJ
export PATH=/usr/local/smlnj/bin:"$PATH"

# Aliases
source ~/dotfiles/aliases.sh

# Fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
