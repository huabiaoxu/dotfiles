#/usr/bin/env zsh

hostname=$(hostname)

ln -s common ~/dotfiles/${hostname}

mkdir ~/.dotfiles/zsh
ln -s ~/dotfiles/${hostname}/profile ~/.dotfiles/profile
ln -s ~/dotfiles/common/tmux ~/.dotfiles/tmux
ln -s ~/dotfiles/common/vim ~/.dotfiles/vim

echo "export DOTFILES_DIR=~/dotfiles/${hostname}

. \${DOTFILES_DIR}/zsh/zshrc" > ~/.dotfiles/zsh/zshrc

ln -s .dotfiles/profile/profile ~/.profile
ln -s .dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s .dotfiles/vim/vimrc ~/.vimrc
ln -s .dotfiles/zsh/zshrc ~/.zshrc

mkdir -p ~/.hist/vim_swp

pushd ~/dotfiles/common/vim
git clone https://github.com/Shougo/neobundle.vim.git bundle/neobundle.vim
popd
