set tabstop=4
set softtabstop=4
set shiftwidth=4

" neobundle settings {{{
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'
" ↓こんな感じが基本の書き方

" C++用カラースキーマ
NeoBundle 'morhetz/gruvbox'

" NERDTree
NeoBundle 'scrooloose/nerdtree'

" Unite
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1

" YouCompleteMe
NeoBundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/cpp/ycm/.ycm_extra_conf.py'

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

set t_Co=256
syntax on
colorscheme gruvbox
set background=dark
