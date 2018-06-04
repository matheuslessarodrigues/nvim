set autoindent
syntax on
set list
set listchars=tab:>-,trail:\~
set autowrite
set equalalways
set clipboard=unnamed
set runtimepath^=~/AppData/Local/nvim/ctrlp.vim/

" Plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'bash install.sh'}
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
call plug#end()
