scriptencoding utf-8
set encoding=utf-8

call plug#begin()
" ================================================================== Themes
Plug 'mhartington/oceanic-next'

" ================================================================== Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-sensible'
Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
call plug#end()

" ================================================================== Theme
if (has("termguicolors"))
	set termguicolors
endif

syntax on
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

set noexpandtab
set copyindent
set preserveindent
set sts=0 ts=4 sw=4

set list
set listchars=tab:�\ ,trail:�,space:�
set wrap
set showbreak=~\
set wrapscan
set autowriteall
set autoread
set equalalways
set clipboard=unnamed
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cs_checkers = ['code_checker']

" Sneak
let g:sneak#label = 1
let g:sneak#prompt = 'Sneak >'
let g:sneak#target_labels = "sftunqSFGHLTUNRMQZ0"

" ================================================================== Key Mappings
let mapleader="\<SPACE>"

" Use <C-d> to clear the highlighting of :set hlsearch.
nnoremap <C-d> :nohlsearch<CR>

nnoremap ; :
nnoremap Q @q

noremap <C-h> b
noremap <C-l> w
noremap <C-k> <C-u>
noremap <C-j> <C-d>

noremap <Leader>h ^
noremap <Leader>l g_

nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

nmap <Leader><TAB> <C-w>w
nnoremap <Leader>W :vsplit new<CR>
nnoremap <Leader>w :close<CR>
nnoremap <C-s> :write<CR>

map m <Plug>Sneak_;
map M <Plug>Sneak_,

inoremap <C-Space> <C-x><C-o>
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
