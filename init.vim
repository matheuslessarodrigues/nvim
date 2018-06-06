call plug#begin()
" Themes
Plug 'mhartington/oceanic-next'

" Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-sensible'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'bash install.sh'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
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
set listchars=tab:>\~,trail:\~
set autowrite
set equalalways
set clipboard=unnamed
set runtimepath^=~/AppData/Local/nvim/ctrlp.vim/
let g:rustfmt_autosave = 1
set expandtab sts=4 ts=4 shiftwidth=4
set tabstop=4
set showmatch
set showcmd
set splitbelow
set splitright
set ignorecase
set smartcase
set gdefault

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set hidden
cd C:/Workspace/

" Mappings
let mapleader="\<SPACE>"

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

nnoremap ; :
nnoremap Q @q

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPMRUFiles<CR>

nnoremap <TAB> <C-w>w
nnoremap <Leader>w :vsplit new<CR>

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-w)

