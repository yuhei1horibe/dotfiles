set tabstop=4
set softtabstop=4
set shiftwidth=4


" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
	set nocompatible
endif

" dein.vim がなければ github から落としてくる
" if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
" endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" YouCompleteMe configuration
let s:rumtimepath = expand('/home/yuhei_mobile/.cache/dein/repos/github.com/Shougo')

" Color scheme
filetype plugin indent on
set t_Co=256
syntax on
colorscheme gruvbox
set background=dark


" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
" NeoBundleFetch 'Shougo/neobundle.vim'
" ↓こんな感じが基本の書き方

" C++用カラースキーマ
" NeoBundle 'morhetz/gruvbox'

" NERDTree
" NeoBundle 'scrooloose/nerdtree'

" Unite
" NeoBundle 'Shougo/unite.vim'
" let g:unite_enable_start_insert=1

" YouCompleteMe
" NeoBundle 'Valloric/YouCompleteMe'
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/cpp/ycm/.ycm_extra_conf.py'
