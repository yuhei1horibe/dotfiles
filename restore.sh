#!/bin/sh

if [ -e ./backup ]; then
	rm ~/.cache/dein
	rm ~/.vim
	rm ~/.vimrc
	rm ~/.bash_profile
    rm ~/.gitconfig

	mv ./backup/dein ~/.cache/
	mv ./backup/.vim ~/
	mv ./backup/.vimrc ~/
	mv ./backup/.bash_profile ~/
    mv ./.gitconfig ~/

	rm -rf ./backup
fi
