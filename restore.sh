#!/bin/sh

if [ -e ./backup ]; then
	rm ~/.cache/dein
	rm ~/.vim
	rm ~/.vimrc
	rm ~/.git
	rm ~/.bash_profile

	mv ./backup/dein ~/.cache/
	mv ./backup/.vim ~/
	mv ./backup/.vimrc ~/
	mv ./backup/.git ~/
	mv ./backup/.bash_profile ~/

	rm -rf ./backup
fi