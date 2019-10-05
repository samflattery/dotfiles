# dotfiles
My vim, tmux and zsh dotfiles

## installation instructions

Download and install oh-my-zsh and the Vundle package manager for Vim. 

Install iTerm2 and activate the solarized dark colorscheme.

In your `.vimrc`, replace everything with `source ~/path/to/dotfiles/vimrc`

Do the same for `.zshrc`, `.tmux.conf` and `.tmux-status.conf`

For the zsh config to work, make a new file in the dotfiles folder called zshpath and put:
```export ZSH="path/to/.oh-my-zsh"```
in it

If the dotfiles folder is not in your home directory, you will need to change line 30 to the correct path

Install one of the fonts from NerdFonts (https://github.com/ryanoasis/nerd-fonts) to get powerline status bar icons and icons for the nerdTREE plugin.  The FiraCode font has cool ligatures.
