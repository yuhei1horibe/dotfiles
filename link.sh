#!/bin/sh

CUR_PATH=`pwd`

echo $CUR_PATH

# 念の為バックアップを取る
if [ ! -e backup ]; then
	mkdir backup
fi

if [ -e ~/.cache/dein ]; then
	mv ~/.cache/dein ./backup/
fi

if [ -e ~/.vim ]; then
	mv ~/.vim ./backup/
fi

if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ./backup/
fi

if [ -e ~/.bashrc ]; then
	mv ~/.bashrc ./backup/
fi

if [ -e ~/.bash_profile ]; then
	mv ~/.bash_profile ./backup/
fi

if [ -e ~/.gitconfig ]; then
	mv ~/.gitconfig ./backup/
fi

if [ -e ~/.tmux.conf ]; then
	mv ~/.tmux.conf ./backup/
fi

# .filesへのリンクを作る
ln -s $CUR_PATH/.vim ~/
ln -s $CUR_PATH/.vimrc ~/
ln -s $CUR_PATH/.bashrc ~/
ln -s $CUR_PATH/.bash_profile ~/
ln -s $CUR_PATH/.gitconfig ~/
ln -s $CUR_PATH/.tmux.conf ~/

# deinその他をインストール
vim

# YouCompleteMeをインストール
#cd ~/.cache/dein/repos/github.com/Valloric/YouCompleteMe/
#python2 install.py --clang-completer

