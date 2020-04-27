set shell=$COMSPEC

" plugin manager
call plug#begin()
Plug 'morhetz/gruvbox'
"Plug 'neovim/nvim-lsp'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" settings
let g:gruvbox_contrast_dark='hard'
set termguicolors
colorscheme gruvbox

set noexpandtab
set copyindent
set preserveindent
set sts=0 ts=4 sw=4

set list
set listchars=trail:.,extends:>,precedes:<,nbsp:~,space:.,tab:\|\ 
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
autocmd TermClose * bd!

command Sh call termopen("busybox bash")
command Verco :terminal verco<CR>

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
nnoremap <Esc> :<C-u>nohlsearch<CR>
nnoremap <C-c> :<C-u>nohlsearch<CR>
nnoremap <C-s> :<C-u>w<CR>
nnoremap bb :<C-u>b#<CR>
nnoremap bd :<C-u>%bd<CR>

map <Tab> <C-w><C-w>
map Q <Nop>
map r <Nop>
map gf <Nop>
nnoremap U <C-r>
nnoremap gv <C-v>
nnoremap gn *

nnoremap zj zb
nnoremap zk zt

nnoremap s /
nnoremap S <Nop>

vnoremap s /
vnoremap S <Nop>

nnoremap W b
nnoremap gj G
nnoremap gk gg

nnoremap H 0
nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>

vnoremap W b
vnoremap gj G
vnoremap gk gg

vnoremap H 0
vnoremap L $
vnoremap J <C-d>
vnoremap K <C-u>

onoremap W b
onoremap gj G
onoremap gk gg

onoremap H 0
onoremap L $
onoremap J <C-d>
onoremap K <C-u>

" lsp
"set omnifunc=v:lua.vim.lsp.omnifunc
"nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> gs <cmd>lua vim.lsp.buf.document_symbol()<CR>

"lua << EOF
"local nvim_lsp = require'nvim_lsp'
"local configs = require'nvim_lsp/configs'

"nvim_lsp.rust_analyzer.setup{}

"configs.omnisharp_lsp = {
"	default_config = {
"		cmd = {'omnisharp'};
"		filetypes = {'cs'};
"		root_dir = nvim_lsp.util.root_pattern('*.sln');
"		settings = {};
"	};
"}
"nvim_lsp.omnisharp_lsp.setup{}
"EOF

" fzf
nnoremap <C-p> :<C-u>Files<CR>
nnoremap <C-b> :<C-u>Buffers<CR>
nnoremap <C-f> :<C-u>Rg 

" coc
let g:coc_global_extensions=['coc-omnisharp', 'coc-rust-analyzer']

inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap gr <Plug>(coc-references)
nmap gd <Plug>(coc-definition)
nmap gs :<C-u>CocList outline<CR>
nnoremap gS :<C-u>CocList -I symbols<CR>
nmap gh :<C-u>call CocAction('doHover')<CR>

nmap rF :call CocAction('format')<CR>
nmap rr <Plug>(coc-rename):<C-u>wa<CR>
nmap ra <Plug>(coc-codeaction)
nmap rf <Plug>(coc-fix-current)
nmap rd <Plug>(coc-diagnostic-info)
nmap re <Plug>(coc-diagnostic-next-error) 

nmap gc :<C-u>CocCommand<CR>
nmap rD :<C-u>CocList diagnostics<CR>
nmap rc :<C-u>CocList commands<CR>

" session
function SaveSessionAndClose()
	:wall
	:mksession! session.vim
	:qall
endfunction

function TryRestoreSession()
	:if filereadable("session.vim")
		:source session.vim
		:call delete("session.vim")
	:endif
endfunction

nmap <C-z> :call SaveSessionAndClose()<CR>
call TryRestoreSession()
