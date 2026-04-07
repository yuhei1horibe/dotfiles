set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set number
set hlsearch

if !has('nvim')
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

      if has('nvim')
          let s:nvim_toml = g:rc_dir . '/dein_nvim.toml'
          call dein#load_toml(s:nvim_toml, {'lazy': 0})
      endif

      " 設定終了
      call dein#end()
      call dein#save_state()
    endif

    " もし、未インストールものものがあったらインストール
    if dein#check_install()
      call dein#install()
    endif

    " YouCompleteMe configuration
    let s:rumtimepath = expand('/home/yuhei/.cache/dein/repos/github.com/Shougo')
else
lua << EOF
    vim.pack.add({
        { src = 'https://github.com/nielsmadan/harlequin'      },
        { src = 'https://github.com/morhetz/gruvbox'           },
        { src = 'https://github.com/scrooloose/nerdtree'       },
        { src = 'https://github.com/will133/vim-dirdiff'       },
        { src = 'https://github.com/nachumk/systemverilog.vim' },
        { src = 'https://github.com/airblade/vim-gitgutter'    },
        { src = 'https://github.com/ibhagwan/fzf-lua'          },
        { src = 'https://github.com/windwp/nvim-autopairs'     },
        { src = 'https://github.com/neovim/nvim-lspconfig'     }
    })
    require('nvim-autopairs').setup {}
    vim.o.termguicolors = false
EOF
    packadd termdebug
endif

" vim-gitgutter
let g:gitgutter_terminal_reports_focus=0

" Color scheme
filetype plugin indent on
set t_Co=256
set background=dark
syntax on

colorscheme harlequin
" colorscheme gruvbox

" Color scheme fix
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" Key map for NERDTree
silent! nmap <C-n> :NERDTreeToggle<CR>
silent! nmap <C-p> :FZF<CR>

let g:ctrlp_use_caching = 1
let g:ctrlp_working_path_mode = 'ra'

" This is for cscope
if has('cscope')
    source ~/.vim/plugin/cscope_maps.vim
    set cscopequickfix=s-,t-,e-,g-,c-,i-,d-,a-
endif

let g:termdebug_popup = 0
let g:termdebug_wide = 163

" Change the limit of ctrlp
let g:ctrlp_max_files=100000

if has('nvim')
    set completeopt=menu,menuone,noselect

" LSP related configuration
lua << EOF
-- local nvim_lsp = require('lspconfig')

-- Auto completion setup
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable code completion
  if client:supports_method('textDocument/completion') then
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '')}
      end,
    });
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'ccls', 'bashls', 'cmake', 'tsserver' }
for _, lsp in ipairs(servers) do
  vim.lsp.config[lsp] = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
  vim.lsp.enable(lsp)
end
vim.lsp.inlay_hint.enable()
vim.lsp.inline_completion.enable()
vim.diagnostic.config({ virtual_lines = true })
-- vim.diagnostic.config({ virtual_text = true })
EOF
endif

