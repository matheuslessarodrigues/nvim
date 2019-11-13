scriptencoding utf-8
set encoding=utf-8

" plugin manager
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" theme
let g:gruvbox_contrast_dark='soft'
colorscheme GruvBox

" settings
set cursorline
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
set clipboard+=unnamed
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
autocmd FocusGained * :silent! noautocmd checktime

function UploadSettings()
	let root = getcwd() 
	:execute 'cd ' . fnamemodify($MYVIMRC, ':p:h') 
	:execute '!git commit -a -m "update"' 
	:execute '!git push' 
	:execute 'cd ' . root
endfunction

function DownloadSettings()
	let root = getcwd() 
	:execute 'cd ' . fnamemodify($MYVIMRC, ':p:h') 
	:execute '!git pull' 
	:execute 'cd ' . root
endfunction

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
let g:netrw_fastbrowse=0
autocmd FileType netrw set nolist

" keymaps
let mapleader = "\<Space>"

nnoremap <ESC> :nohlsearch<CR>
nnoremap <C-s> :w<CR>
nnoremap s /
nnoremap S ?
nnoremap <Leader>ge :Ex.<CR>

" fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :Buffers<CR>
"nnoremap <C-f> :Rg<CR>
nnoremap <C-f> :Rg 

let g:coc_global_extensions=['coc-omnisharp']

nnoremap <C-t> :<C-u>CocList -I symbols<CR>

inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <Leader>cd :CocList diagnostics<CR>
nmap <Leader>cc :CocCommand<CR>

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gs :CocList outline<CR>

nmap <Leader>rr <Plug>(coc-rename):wa<CR>
nmap <Leader>ra <Plug>(coc-codeaction)
nmap <leader>rf <Plug>(coc-fix-current)
nmap <leader>rF :Format<CR>

nmap <Leader>di <Plug>(coc-diagnostic-info)
nmap <Leader>de <Plug>(coc-diagnostic-next-error) 
nmap <Leader>dE <Plug>(coc-diagnostic-previous-error) 
nmap <Leader>dh :call CocAction('doHover')<CR>

