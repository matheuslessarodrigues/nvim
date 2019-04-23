scriptencoding utf-8
set encoding=utf-8

" plugin manager
call plug#begin()
" Plug 'mhartington/oceanic-next'

Plug 'justinmk/vim-sneak'
Plug 'matze/vim-move'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" settings
"colorscheme OceanicNext

set noexpandtab
set copyindent
set preserveindent
set sts=0 ts=4 sw=4

set list
set listchars=trail:.,extends:>,precedes:<,nbsp:~,tab:.\ "
set wrap
set showbreak=~\ "
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
:autocmd VimResized * wincmd =

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax on
syntax enable
filetype plugin on

" search down into subfolders
" provides tab-completion for all file-related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

" tweaks for browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" keymaps
let mapleader="\<SPACE>"

nnoremap <C-d> :nohlsearch<CR>

nnoremap ; :

noremap <C-h> b
noremap <C-l> w
noremap <C-k> <C-u>
noremap <C-j> <C-d>

noremap <Leader>h ^
noremap <Leader>l g_
noremap <Leader>k gg
noremap <Leader>j G

nmap <Leader><TAB> <C-w>w
nnoremap <Leader>W :vsplit new<CR>
nnoremap <Leader>w :close<CR>
nnoremap <C-s> :write<CR>

inoremap <C-Space> <C-x><C-o>
inoremap <expr> j ((pumvisible())?('\<C-n>'):('j'))
inoremap <expr> k ((pumvisible())?('\<C-p>'):('k'))

nnoremap <Leader>p :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" plugin configs

" sneak
let g:sneak#prompt = 'Sneak >'
let g:sneak#target_labels = "sftunqSFGHLTUNRMQZ0"
let g:sneak#s_next = 1
map <expr> n ((sneak#is_sneaking())?'<Plug>Sneak_;':'n')
map <expr> N ((sneak#is_sneaking())?'<Plug>Sneak_,':'N')
