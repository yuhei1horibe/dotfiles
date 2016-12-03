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
echo "ln -s $CUR_PATH/dein ~/.cache/dein"
echo "ln -s $CUR_PATH/.vim ~/"
echo "ln -s $CUR_PATH/.vimrc ~/"
echo "ln -s $CUR_PATH/.git ~/"
echo "ln -s $CUR_PATH/.bash_profile ~/"

