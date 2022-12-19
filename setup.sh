git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Oh-my-zsh and packages
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/sindresorhus/pure.git "$HOME/dotfiles/pure"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Vundle for Vim.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Source everything in the dotfiles
echo "source ~/dotfiles/vimrc" > .vimrc
echo "source ~/dotfiles/zshrc" > .zshrc
echo "source ~/dotfiles/tmux.conf" > .tmux.conf
echo "source ~/dotfiles/tmux-status.conf" > .tmux-status.conf
