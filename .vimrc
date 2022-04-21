syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set guifont=Monaco:h200
set number relativenumber

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Enable true colors if available
set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'unblevable/quick-scope'
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
" Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'psliwka/vim-smoothie'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

" goyo padding
let g:goyo_margin_top = 5
let g:goyo_margin_bottom = 5

" quickscope, trigger a highlight in the appropriate direction
" when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
let g:qs_max_chars=80

" ctrlp
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" Splits
set splitbelow splitright

" Windown resize
noremap <silent> <Up> <Esc>:resize -3 <CR>
noremap <silent> <Down> <Esc>:resize +3 <CR>
noremap <silent> <Right> <Esc>:vertical resize +3 <CR>
noremap <silent> <Left> <Esc>:vertical resize -3 <CR>

" Automaticlly delete all trailing whitespace on save.
" autocmd BufWritePre * %s/\s\+$//e

" Backspace in INSERT mode
set backspace=indent,eol,start

" Open terminal
noremap <Leader>t : botright vertical terminal <CR>

" Open nerdtree
noremap <Leader>n : NERDTreeToggle <CR>

" Insert empty new line below current line
noremap <Leader>o m`o<Esc>0D``

" Insert empty new line above current line
noremap <Leader>O m`O<Esc>0D``

" Move line down
nnoremap ∆ :m .+1<CR>

" Move line up
nnoremap ˚ :m .-2<CR>

" FZF mapping
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Ag<CR>

" Copy to end of line
nnoremap Y y$

" Center when searching for next or prev match
nnoremap n nzz
nnoremap N Nzz

" W for writing
command! W  write
