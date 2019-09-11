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

Install the Menlo font from nerdFonts to get the powerline status icons and for icons in nerdTREE
