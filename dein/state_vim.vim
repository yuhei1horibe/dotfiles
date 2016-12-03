let [plugins, ftplugin] = dein#load_cache_raw(['/home/yuhei_mobile/.vimrc', '/home/yuhei_mobile/.vim/rc/dein.toml', '/home/yuhei_mobile/.vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/yuhei_mobile/.cache/dein'
let g:dein#_runtime_path = '/home/yuhei_mobile/.cache/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/yuhei_mobile/.cache/dein/.cache/.vimrc'
let &runtimepath = '/home/yuhei_mobile/.cache/dein/repos/github.com/Shougo/dein.vim/,/home/yuhei_mobile/.vim,/home/yuhei_mobile/.cache/dein/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/home/yuhei_mobile/.vim/after,/home/yuhei_mobile/.cache/dein/.cache/.vimrc/.dein/after'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['YouCompleteMe'])
