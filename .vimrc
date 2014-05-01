set smartindent      	  " Guess indent level, based on syntax.
set autoindent            " Automatic indentation while typing                  
set expandtab        	  " Set soft tabs (replace tabs with <tabstop> spaces).
set softtabstop=2    	  " A tab will be replaced with this amount of spaces.
set shiftwidth=2     	  " Same as tabstop, but for autoindents and >> indents.
set tabstop=2        	  " Real tabs will be this long and will show up, because of 
set listchars=tab:▸\ ,eol:¬
set nowrap              " we dont want any wrapping to happen
set virtualedit=all     " TOTAL FREEDOM 4 my curZ0r
set hidden              " Allows us to open new buffers while already working on something
set timeoutlen=250      " Timeout before vim interprets some keystrokes
set pastetoggle=<F2>    " F2 toggles paste mode
set exrc                " enable per-directory .vimrc files
set secure              " disable unsafe commands in local .vimrc files
syntax on               " Syntax highlighting

let $BASH_ENV = "~/.bash_aliases"

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

noremap ]q :cn<CR>
noremap [q :cp<CR>

" Let Ctrl+Q close the current buffer
" nnoremap <C-q> :bd<CR> DOESNT WORK

" Run make by pressing F9
map <F9> :make<CR>

" Stop search highlighting
" nmap <silent> ,/ :nohlsearch<CR>

" Allow superuser save using w!!
cmap w!! w !sudo tee % >/dev/null
    
" Some handy utilities
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR> " Convenient keymap for NERDTree
nmap <leader>l :set list!<CR>                           " Allow us to quickly enable list
nmap <leader>j :IH<CR>                                  " Jump to file under cursor
nmap <leader>J :A<CR>                                   " Jump to header file
nmap <leader>f :FufFile<CR> "DELETE THIS ONE??
nmap <leader>h :HolmesL!    "DELETE THIS ONE??
nmap <leader>p :CtrlP<CR>

" Always use MRU when Ctrl-P is pressed
let g:ctrlp_cmd = 'CtrlPMRU'

" Ignore some filetypes (to speed up ctrlp)
set wildignore+=*.o,*.so,*.tar.*,*.zip,*.pyc,*.class

" Ctrl+B will open the available buffers
nmap <C-B> :CtrlPBuffer<CR>

" Quickly cycle through buffers (May not be needed anymore because of CtrlP)
map <C-n> :bnext<CR>

" Prevent entering Ex mode with capital Q
noremap Q <Nop>

" Allow me to easily resize windows
" reize horzontal split window
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
" resize vertical split window
nmap <C-Left> <C-W><<C-W><
nmap <C-Right> <C-W>><C-W>>

" Use 256 colors
set t_Co=256

" The Silver Searcher for high speed grepping action
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind F to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" File type specific settings
if has("autocmd")
    filetype on
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType vim  setlocal ts=4 sts=4 sw=4 expandtab
endif

" Set color scheme
colorscheme holokai

" Required by vim-powerline
set encoding=utf-8
set laststatus=2
