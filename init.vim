call plug#begin()
" Themes
Plug 'mhartington/oceanic-next'

" Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-sensible'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'bash install.sh'}
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
call plug#end()

" Theme
if (has("termguicolors"))
 set termguicolors
endif

syntax on
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

set autoindent
set list
set listchars=tab:>-,trail:\~
set autowrite
set equalalways
set clipboard=unnamed
set runtimepath^=~/AppData/Local/nvim/ctrlp.vim/
let g:rustfmt_autosave = 1

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
