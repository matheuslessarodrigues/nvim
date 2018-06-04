set autoindent
syntax on
set list
set listchars=tab:>-,trail:\~
set autowrite
set equalalways

" Plugins
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'bash install.sh'}
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
