scriptencoding utf-8
set encoding=utf-8

call plug#begin()
" ================================================================== Themes
Plug 'mhartington/oceanic-next'

" ================================================================== Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-sensible'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'powershell -executionpolicy bypass -File install.ps1'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'
call plug#end()

" ================================================================== Theme
if (has("termguicolors"))
 set termguicolors
endif

syntax on
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

set expandtab sts=4 ts=4 shiftwidth=4
set autoindent
set noexpandtab
set tabstop=4

set list
set listchars=tab:»\ ,trail:·,space:·
set autowrite
set autoread
set equalalways
set clipboard=unnamed
let g:rustfmt_autosave = 1
set showmatch
set showcmd
set splitbelow
set splitright
set ignorecase
set smartcase
set gdefault
set hidden

cd C:/Workspace/

" ================================================================== Plugin Configs

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" LanguageClient
let g:LanguageClient_serverCommands = { 'rust': ['rustup', 'run', 'nightly', 'rls'] }
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loggingLevel = 'DEBUG'

" Fzf
let g:fzf_layout = { 'down': '~30%' }

" ================================================================== Key Mappings
let mapleader="\<SPACE>"

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

nnoremap ; :
nnoremap Q @q

nnoremap <Leader>p :Files<CR>
nnoremap <Leader>f :Lines<CR>
nnoremap <Leader>b :Buffers<CR>

nnoremap <TAB> <C-w>w
nnoremap <Leader><TAB> :vsplit new<CR>
nnoremap <Leader>w :close<CR>

nmap s <Plug>(easymotion-overwin-w)
