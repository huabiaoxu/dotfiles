#/usr/bin/env zsh

PROFILENAME=${PROFILENAME:=`hostname -s`}

# hb, 20170125: this is wrong:
#ln -s common ~/dotfiles/${PROFILENAME}

mkdir -p ~/.dotfiles/zsh
mkdir -p ~/.dotfiles/bash
ln -s ~/dotfiles/${PROFILENAME}/profile ~/.dotfiles/profile
ln -s ~/dotfiles/common/tmux            ~/.dotfiles/tmux
ln -s ~/dotfiles/common/vim             ~/.dotfiles/vim

echo "export DOTFILES_DIR=~/dotfiles/${PROFILENAME}

. \${DOTFILES_DIR}/zsh/zshrc" > ~/.dotfiles/zsh/zshrc


echo "export DOTFILES_DIR=~/dotfiles/${PROFILENAME}

. \${DOTFILES_DIR}/bash/bashrc" > ~/.dotfiles/bash/bashrc

echo "export DOTFILES_DIR=~/dotfiles/${PROFILENAME}

. \${DOTFILES_DIR}/bash/bash_profile" > ~/.dotfiles/bash/bash_profile

ln -s .dotfiles/profile/profile ~/.profile
ln -s .dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s .dotfiles/vim/vimrc ~/.vimrc
ln -s .dotfiles/zsh/zshrc ~/.zshrc
ln -s .dotfiles/bash/bashrc ~/.bashrc
ln -s .dotfiles/bash/bash_profile ~/.bash_profile

mkdir -p ~/.hist/vim_swp

pushd ~/dotfiles/common/vim
git clone https://github.com/Shougo/neobundle.vim.git bundle/neobundle.vim
popd
