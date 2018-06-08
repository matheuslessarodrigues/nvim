scriptencoding utf-8
set encoding=utf-8

call plug#begin()
" ================================================================== Themes
Plug 'mhartington/oceanic-next'

" ================================================================== Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-sensible'
if 0
Plug 'OmniSharp/omnisharp-vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'powershell -executionpolicy bypass -File install.ps1'}
endif
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
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

" Python
"g:python3_host_prog = 'python'

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if 0
" OmniSharp
filetype plugin on
let g:OmniSharp_server_path = 'OmniSharp.exe'
let g:OmniSharp_selector_ui = 'fzf'
let g:syntastic_cs_checkers = ['code_checker']

" LanguageClient
let g:LanguageClient_serverCommands = { 'rust': ['rustup', 'run', 'nightly', 'rls'], 'cs': ['omnisharp'] }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loggingLevel = 'DEBUG'

autocmd FileType rust setlocal omnifunc=LanguageClient#complete
endif

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

noremap <Leader>h ^
noremap <Leader>l g_

nnoremap <Leader>p :Files<CR>
nnoremap <Leader>f :Lines<CR>
nnoremap <Leader>b :Buffers<CR>

nnoremap <TAB> <C-w>w
nnoremap <Leader><TAB> :vsplit new<CR>
nnoremap <Leader>w :close<CR>
nnoremap <C-s> :write<CR>

let g:sneak#label = 1
let g:sneak#prompt = 'Sneak >'
map m <Plug>Sneak_,
map , <Plug>Sneak_;

inoremap <C-Space> <C-x><C-o>

if 0
augroup language_client_commands
	autocmd FileType rust nnoremap <F5> :call LanguageClient_contextMenu()<CR>
	autocmd FileType rust nnoremap <silent> <Leader>o :call LanguageClient#textDocument_documentSymbol()<CR>
	autocmd FileType rust nnoremap <silent> <Leader>r :call LanguageClient#textDocument_rename()<CR>
	autocmd FileType rust nnoremap <silent> <Leader>d :call LanguageClient#textDocument_definition()<CR>
	autocmd FileType rust nnoremap <silent> <Leader>i :call LanguageClient#textDocument_references()<CR>
	autocmd FileType rust nnoremap <A-f> :call LanguageClient#textDocument_formatting()<CR>
augroup END

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
	autocmd FileType cs nnoremap <buffer> <Leader>o :OmniSharpFindSymbol<CR>
	autocmd FileType cs nnoremap <buffer> <Leader>i :OmniSharpFindUsages<CR>

	" Finds members in the current buffer
	"autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

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
endif

