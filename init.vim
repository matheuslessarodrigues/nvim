scriptencoding utf-8
set encoding=utf-8

call plug#begin()
" ================================================================== Themes
Plug 'mhartington/oceanic-next'

" ================================================================== Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-sensible'
Plug 'OmniSharp/omnisharp-vim'
"Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'powershell -executionpolicy bypass -File install.ps1'}
Plug 'justinmk/vim-sneak'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
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
set listchars=tab:»\ ,trail:·,space:·
set wrap
set showbreak=~\ 
set wrapscan
set autowriteall
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

" Python
let g:python3_host_prog = 'python'

" Rust
let g:rustfmt_autosave = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cs_checkers = ['code_checker']

" OmniSharp
filetype plugin on
let g:OmniSharp_server_path = 'OmniSharp.exe'
let g:OmniSharp_selector_ui = 'ctrlp'

if 0
" LanguageClient
let g:LanguageClient_serverCommands = { 'rust': ['rustup', 'run', 'nightly', 'rls'] }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loggingLevel = 'DEBUG'

autocmd FileType rust setlocal omnifunc=LanguageClient#complete
endif

" CtrlP
let g:ctrlp_working_path_mode = 0
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.meta,*.dll,*\\Library\\*,*\\obj\\*,*.d,*.pdb,*.csproj,*.sln,*.orig,*.mat,*.prefab,*.controller,*.colors

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

if 0
augroup language_client_commands
	autocmd FileType rust nnoremap <F5> :call LanguageClient_contextMenu()<CR>
	autocmd FileType rust nnoremap <silent> <Leader>o :call LanguageClient#textDocument_documentSymbol()<CR>
	autocmd FileType rust nnoremap <silent> <Leader>r :call LanguageClient#textDocument_rename()<CR>
	autocmd FileType rust nnoremap <silent> <Leader>d :call LanguageClient#textDocument_definition()<CR>
	autocmd FileType rust nnoremap <silent> <Leader>i :call LanguageClient#textDocument_references()<CR>
	autocmd FileType rust nnoremap <A-f> :call LanguageClient#textDocument_formatting()<CR>
augroup END
endif

augroup omnisharp_commands
	autocmd!

	" Synchronous build (blocks Vim)
	"autocmd FileType cs nnoremap <buffer> <F5> :wa!<CR>:OmniSharpBuild<CR>
	" Builds can also run asynchronously with vim-dispatch installed
	"autocmd FileType cs nnoremap <buffer> <Leader>b :wa!<CR>:OmniSharpBuildAsync<CR>
	" Automatic syntax check on events (TextChanged requires Vim 7.4)
	autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

	" Automatically add new cs files to the nearest project on save
	autocmd BufWritePost *.cs call OmniSharp#AddToProject()

	" Show type information automatically when the cursor stops moving
	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

	" The following commands are contextual, based on the cursor position.
	autocmd FileType cs nnoremap <buffer> <Leader>d :OmniSharpGotoDefinition<CR>
	"autocmd FileType cs nnoremap <buffer> <Leader>d :OmniSharpFindImplementations<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>t :OmniSharpFindSymbol<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>u :OmniSharpFindUsages<CR>

	" Finds members in the current buffer
	autocmd FileType cs nnoremap <buffer> <Leader>o :OmniSharpFindMembers<CR>

	" Cursor can be anywhere on the line containing an issue
	autocmd FileType cs nnoremap <buffer> <Leader>. :OmniSharpFixIssue<CR>
	"autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
	"autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
	"autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

	" Navigate up and down by method/property/field
	autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
	autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

	autocmd FileType cs nnoremap <Leader>r :OmniSharpRename<CR>
	autocmd FileType cs nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
	autocmd FileType cs nnoremap <A-f> :OmniSharpCodeFormat<CR>
augroup END

