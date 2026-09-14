" ========================================
" Options
" ========================================

set encoding=UTF-8
set spelllang=en_us,de_de,es_es
set nohlsearch " Disable highlight on search
set number " Enable line numbers
set mouse=a " Enable mouse mode
set breakindent " Enable break indent
set undofile " Save undo history
set ignorecase " Case-insensitive searching unless \C or capital in search
set smartcase " Enable smart case
set signcolumn=no " Keep signcolumn on by default
set updatetime=250 " Decrease update time
set timeoutlen=300 " Time to wait for a mapped sequence to complete (in milliseconds)
set nobackup " Don't create a backup file
set nowritebackup " Don't write backup before overwriting
set completeopt=menuone,noselect " Better completion experience
set whichwrap+=<,>,[,],h,l " Allow certain keys to move to the next line
set nowrap " Display long lines as one line
set linebreak " Don't break words when wrapping
set scrolloff=8 " Keep 8 lines above/below cursor
set sidescrolloff=8 " Keep 8 columns to the left/right of cursor
set relativenumber " Use relative line numbers
set numberwidth=4 " Number column width
set shiftwidth=4 " Spaces per indentation
set tabstop=4 " Spaces per tab
set softtabstop=4 " Spaces per tab during editing ops
set expandtab " Convert tabs to spaces
set nocursorline " Don't highlight the current line
" set cursorline " highlight the current line
set splitbelow " Horizontal splits below current window
set splitright " Vertical splits to the right
set noswapfile " Don't use a swap file
set smartindent " Smart indentation
set showtabline=2 " Always show tab line
set backspace=indent,eol,start " Configurable backspace behavior
set pumheight=10 " Popup menu height
set conceallevel=0 " Make `` visible in markdown
set fileencoding=utf-8 " File encoding
set cmdheight=1 " Command line height
set autoindent " Auto-indent new lines
set shortmess+=c " Don't show completion menu messages
set iskeyword+=- " Treat hyphenated words as whole words
set showmatch " show the matching part of pairs [] {} and ()
set laststatus=2 " Show status bar
set statusline=%f " Path to the file
set statusline+=%= " Switch to the right side
set statusline+=%l " Current line
set statusline+=/ " Separator
set statusline+=%L " Total lines

" Set line colors
highlight LineNr       ctermfg=244 guifg=#5c6370
highlight CursorLineNr ctermfg=220 cterm=bold guifg=#e5c07b


" ========================================
" Keymaps
" ========================================

" Set leader key
let mapleader = " "
let maplocalleader = " "

" Disable the spacebar key's default behavior in Normal and Visual modes
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>

" Allow moving the cursor through wrapped lines with j, k
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" clear highlights
nnoremap <Esc> :noh<CR>

" save file
nnoremap <C-s> :w<CR>

" save file without auto-formatting
nnoremap <leader>sn :noautocmd w<CR>

" quit file
nnoremap <C-q> :q<CR>

" delete single character without copying into register
nnoremap x "_x

" Vertical scroll and center
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Select all content
nnoremap <C-a> ggVG

" Find and center
nnoremap n nzzzv
nnoremap N Nzzzv

" Resize with arrows
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Navigate buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>sb :buffers<CR>:buffer<Space>

" increment/decrement numbers
nnoremap <leader>+ <C-a>
nnoremap <leader>- <C-x>

" window management
nnoremap <leader>v <C-w>v
nnoremap <leader>h <C-w>s
nnoremap <leader>se <C-w>=
nnoremap <leader>xs :close<CR>

" Navigate between splits
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>

" tabs
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>

nnoremap <leader>x :bdelete<CR>
nnoremap <leader>b :enew<CR>

" toggle line wrapping
nnoremap <leader>lw :set wrap!<CR>

" Press jk fast to exit insert mode
inoremap jk <ESC>
inoremap kj <ESC>

" Stay in indent mode
" vnoremap < <gv
" vnoremap > >gv

" Keep last yanked when pasting
vnoremap p "_dP

" Explicitly yank to system clipboard (highlighted and entire row)
noremap <leader>y "+y
noremap <leader>Y "+Y

" Open file explorer
noremap <silent> <leader>e :Lex<CR>


" ========================================
" Other
" ========================================

" Syntax highlighting
syntax on

" Colorscheme
" colorscheme industry
" colorscheme wildcharm
set background=dark
" hi Normal ctermbg=NONE guibg=NONE
" hi NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
" hi VertSplit guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE

" Sync clipboard with OS
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" True colors
if !has('gui_running') && &term =~ '\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors

" Use a line cursor within insert mode and a block cursor everywhere else.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25 
" Use 'l' instead of <CR> to open files
augroup netrw_setup | au!
    au FileType netrw nmap <buffer> l <CR>
augroup END

call plug#begin('~/.vim/plugged')

" === Core ===
Plug 'junegunn/vim-plug'          " Plugin manager itself

" === Search & Navigation ===
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

" === Coding Tools ===
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" === Editing Helpers ===
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'jiangmiao/auto-pairs'

" === Git Integration ===
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" === UX Enhancements ===
" Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-obsession'
" Plug 'Yggdroot/indentLine'

" === Extras ===
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'

call plug#end()

let g:ale_warn_about_trailing_whitespace = v:false
