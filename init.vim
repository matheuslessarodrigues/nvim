scriptencoding utf-8
set encoding=utf-8

" plugin manager
call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" settings
set noexpandtab
set copyindent
set preserveindent
set sts=0 ts=4 sw=4

set list
set listchars=trail:.,extends:>,precedes:<,nbsp:~,space:.,tab:.\ 
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
set completeopt=longest,menuone,preview
set previewheight=5

filetype indent plugin on

autocmd VimLeave * set guicursor=a:block-blinkon1
autocmd VimResized * wincmd =
autocmd FocusGained * :silent! noautocmd checktime
autocmd TermOpen * startinsert

command Sh call termopen("pwsh")
function UploadSettings()
	let root = getcwd()
	:execute 'cd ' . fnamemodify($MYVIMRC, ':p:h')
	:execute '!git commit -a -m "update"'
	:execute '!git push'
	:execute 'cd ' . root
endfunction
command UploadSettings call UploadSettings()
function DownloadSettings()
	let root = getcwd()
	:execute 'cd ' . fnamemodify($MYVIMRC, ':p:h')
	:execute '!git pull'
	:execute 'cd ' . root
endfunction
command DownloadSettings call DownloadSettings()

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
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_fastbrowse=0
autocmd FileType netrw set nolist|setl bufhidden=wipe
autocmd FileType netrw nnoremap <buffer> s /|nnoremap <buffer> S ?

" keymaps
let mapleader="\<Space>"

nmap <C-z> <Nop>
nnoremap <Esc> :<C-u>nohlsearch<CR>
nnoremap <C-c> :<C-u>nohlsearch<CR>
nnoremap <C-s> :<C-u>w<CR>
nnoremap <Leader>e :<C-u>Ex.<CR>
nnoremap <Leader>b :<C-u>b#<CR>
nnoremap <Leader>0 :<C-u>%bd<CR>

nnoremap U <C-r>
nnoremap s /
nnoremap S ?

vnoremap s /
vnoremap S ?

nnoremap gh 0
nnoremap gl $
nnoremap gj G
nnoremap gk gg

vnoremap gh 0
vnoremap gl $
vnoremap gj G
vnoremap gk gg

" fzf
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-b> :<C-u>Buffers<CR>
nnoremap <C-f> :<C-u>Rg 

" coc
let g:coc_global_extensions=['coc-omnisharp']

inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <Leader>cd :<C-u>CocList diagnostics<CR>
nmap <Leader>cc :<C-u>CocCommand<CR>

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap gr <Plug>(coc-references)
nmap gd <Plug>(coc-definition)
nmap gs :<C-u>CocList outline<CR>
nnoremap gS :<C-u>CocList -I symbols<CR>

nmap <Leader>rr <Plug>(coc-rename):<C-u>wa<CR>
nmap <Leader>ra <Plug>(coc-codeaction)
nmap <leader>rf <Plug>(coc-fix-current)
nmap <leader>rF :call CocAction('format')<CR>
nmap <leader>rc :<C-u>CocList commands<CR>

nmap <Leader>di <Plug>(coc-diagnostic-info)
nmap <Leader>de <Plug>(coc-diagnostic-next-error) 
nmap <Leader>dh :<C-u>call CocAction('doHover')<CR>
