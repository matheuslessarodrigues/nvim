set signcolumn=yes
scriptencoding utf-8
set encoding=utf-8

" plugin manager
call plug#begin()
Plug 'mhartington/oceanic-next'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" settings
colorscheme OceanicNext

set noexpandtab
set copyindent
set preserveindent
set sts=0 ts=4 sw=4

set list
set listchars=trail:.,extends:>,precedes:<,nbsp:~,tab:.\ 
set wrap
set showbreak=~\ 
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
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
autocmd VimResized * wincmd =
autocmd VimEnter * GuiPopupmenu 0
autocmd VimEnter * GuiTabline 0

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
let g:netrw_liststyle=0
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" keymaps
let mapleader = "\<Space>"

nnoremap <ESC> :nohlsearch<CR>
nnoremap <C-s> :w<CR>
nnoremap s /
nnoremap S ?

" fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :Buffers<CR>

" coc
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <Leader>cd :CocList diagnostics<CR>
nmap <Leader>cc :CocCommand<CR>

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

command! -nargs=0 Format :call CocAction('format')

let g:coc_global_extensions=['coc-omnisharp']

nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>ca <Plug>(coc-codeaction)
nmap <Leader>di <Plug>(coc-diagnostic-info)
nmap <Leader>de <Plug>(coc-diagnostic-next-error) 
nmap <Leader>dE <Plug>(coc-diagnostic-previous-error) 
