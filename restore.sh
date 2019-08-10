#!/bin/sh

if [ -e ./backup ]; then
	rm ~/.cache/dein
	rm ~/.vim
	rm ~/.vimrc
	rm ~/.bash_profile
    rm ~/.gitconfig
    rm ~/.tmux.conf

	mv ./backup/dein ~/.cache/
	mv ./backup/.vim ~/
	mv ./backup/.vimrc ~/
	mv ./backup/.bash_profile ~/
    mv ./.tmux.conf ~/

	rm -rf ./backup
fi
