" Created by Max Adamski

"--
"- Fixes
"--

"-- Disable vi compatibility
if &compatible
	set nocompatible
endif

"-- Use a POSIX shell
if &shell =~# 'fish$'
	set shell=bash
end

"-- Use truecolor
set t_Co=256
if has('termguicolors')
	set termguicolors
endif

"-- Don't use swap files
set noswapfile
set backupdir=~/.local/share/nvim/tmp/backups/
set undodir=~/.local/share/nvim/tmp/undo/

if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir), 'p')
endif

if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), 'p')
endif


"--
"- Plugins
"--

if has('nvim')
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim 
			\ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
		autocmd VimEnter * UpdateRemotePlugins
	endif
endif


call plug#begin('~/.local/share/nvim/plugged')

Plug 'shougo/denite.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'lervag/vimtex'
Plug 'gabrielelana/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Soares/fish.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/Oceanic-Next'

call plug#end()

"--
"- Basic settings
"--

filetype plugin indent on
syntax enable

set ignorecase
set smartcase
set showmatch

set autochdir
set wildmenu

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set cursorline
set relativenumber
set number
set ruler
set listchars=tab:▸\ ,eol:¬
set list

au VimEnter * :set showtabline=0

colorscheme zenburn
let g:airline_theme = 'minimalist'

"set background=dark
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

"make the background transparent
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
"hi NonText guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE

"--
"- Keybindings
"--

let maplocalleader = "_"

"-- Custom leader keys
nmap <leader>i :set list!<CR>
nmap <leader>cl :set cursorline!<CR>
nmap <leader>dh :Denite help<CR>
nmap <leader>db :Denite buffer<CR>
nmap <leader>rl :set relativenumber!<CR>
nmap <leader>nh :noh<CR>
nmap <leader>sc :setlocal spell! spelllang=en_us<CR>
nmap <localleader>mm :Neomake<CR>
nmap <localleader>sc :Neomake! proselint<CR> 
nnoremap <expr><silent> <leader>, &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>"

"-- Write with sudo
cmap w!! w !sudo tee % > /dev/null

"-- File type specific
autocmd FileType python nnoremap <silent> <leader>r :!clear;python3 %<CR>

"-- Easy window movement
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h

"-- Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"--
"- Plugin configuration
"--

"-- Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" hide ugly orange section
let g:airline_skip_empty_sections = 1
let g:airline_section_warning = ''
let g:airline_section_error = ''

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"

if g:airline_powerline_fonts == 1
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
else
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = '⎋'
	let g:airline_symbols.readonly = '✖︎'
end

"-- vim-pandoc/vim-pandoc
"let g:pandoc#modules#disabled = ["folding", "spell"]
let g:markdown_enable_spell_checking = 0

"-- deoplete
let g:deoplete#enable_at_startup = 1

"-- deoplete/clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/4.0.1/include/'

"-- vimtex
let g:vimtex_view_method = 'mupdf'

"-- markdown
"let g:vim_markdown_preview_hotkey='<localleader>lv'
let g:vim_markdown_preview_pandoc=1
"let g:vim_markdown_preview_toggle=3
"let g:vim_markdown_preview_github=1
let g:vim_markdown_preview_use_xdg_open=1
let g:vim_markdown_preview_browser='firefox'
