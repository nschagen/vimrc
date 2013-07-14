set smartindent      	  " Guess indent level, based on syntax.
set autoindent          " Automatic indentation while typing                  
set expandtab        	  " Set soft tabs (replace tabs with <tabstop> spaces).
set softtabstop=2    	  " A tab will be replaced with this amount of spaces.
set shiftwidth=2     	  " Same as tabstop, but for autoindents and >> indents.
set tabstop=2        	  " Real tabs will be this long and will show up, because of 
set listchars=tab:▸\ ,eol:¬
set nowrap              " we dont want any wrapping to happen
set virtualedit=all     " TOTAL FREEDOM 4 my curZ0r
set hidden              " Allows us to open new buffers while already working on something
syntax on               " Syntax highlighting

" Run Pathogen
execute pathogen#infect() 

" Set leader to comma, which is easier to reach
let mapleader = ","

" Map ; to :
nnoremap ; :

" When wrapping is enabled, these allow you to easily move to the wrapped
" part of the line without having
" nnoremap j gj
" nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Switch buffers
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" Stop search highlighting
" nmap <silent> ,/ :nohlsearch<CR>

" Allow superuser save using w!!
cmap w!! w !sudo tee % >/dev/null

" Some handy utilities
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR> " Convenient keymap for NERDTree
nmap <leader>l :set list!<CR>                           " Allow us to quickly enable list
nmap <leader>j :IH<CR>                                  " Jump to file under cursor
nmap <leader>J :A<CR>                                   " Jump to header file
nmap <leader>f :FufFile<CR>

" Always use MRU when Ctrl-P is pressed
let g:ctrlp_cmd = 'CtrlPMRU'

" Ctrl+B will open the available buffers
nmap <C-B> :CtrlPBuffer<CR>

" Allow me to easily resize windows
" reize horzontal split window
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
" resize vertical split window
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>

" Use 256 colors
set t_Co=256


" File type specific settings
if has("autocmd")
    filetype on
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType vim  setlocal ts=4 sts=4 sw=4 expandtab
endif

" Set color scheme
colorscheme holokai

" Required by vim-powerline
set encoding=utf-8
set laststatus=2
