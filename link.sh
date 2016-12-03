#!/bin/sh

CUR_PATH=`pwd`

echo $CUR_PATH

# 念の為バックアップを取る
if [ ! -e backup ]; then
	mkdir backup
fi

mv ~/.dein ./backup/
mv ~/.vim ./backup/
mv ~/.vimrc ./backup/
mv ~/.git ./backup/
mv ~/.bash_profile ./backup/

# .filesへのリンクを作る
ln -s $CUR_PATH/dein ~/.cache/dein
ln -s $CUR_PATH/.vim ~/
ln -s $CUR_PATH/.vimrc ~/
ln -s $CUR_PATH/.git ~/
ln -s $CUR_PATH/.bash_profile ~/

