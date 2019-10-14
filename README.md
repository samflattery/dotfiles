# dotfiles
My vim, tmux and zsh dotfiles

## installation instructions

Download and install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), the [Vundle](https://github.com/VundleVim/Vundle.vim) package manager for Vim, and `tmux` (`brew install tmux`).

Install [iTerm2](https://www.iterm2.com/) and activate the solarized dark colorscheme.

Clone this directory locally: 

`git clone https://github.com/samflattery/dotfiles`

In your `~/.vimrc`, replace everything with `source ~/path/to/dotfiles/vimrc` and run `vim +PluginInstall +qall`

Similarly, replace your `~/.zshrc`, `~/.tmux.conf` and `~/.tmux-status.conf` with `source ~/path/to/dotfiles/<file>`

Install one of the fonts from [NerdFonts](https://github.com/ryanoasis/nerd-fonts) to get powerline status bar icons and icons for the nerdTREE plugin.  The FiraCode font has cool ligatures.

I use the [Pure Prompt](https://github.com/sindresorhus/pure) for oh-my-zsh.

## highlights

Coming soon
