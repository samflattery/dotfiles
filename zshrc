# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# export TERM="screen-256color"
export TERM="xterm-256color"

#cd with just directory name
setopt autocd
# Path to your oh-my-zsh installation.
source ~/dotfiles/zshpath

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="agnoster"
ZSH_THEME=""

plugins=(git zsh-autosuggestions z zsh-syntax-highlighting)
# DEFAULT_USER=$(whoami)
# DEFAULT_USER=$USER

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

source $ZSH/oh-my-zsh.sh
if [[ -n "$SSH_CLIENT"] || [ -n "$SSH_TTY" ]]; then
	fpath+=("$HOME/dotfiles/pure")
fi

autoload -U promptinit; promptinit
prompt pure

# User configuration
source ~/dotfiles/aliases.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
