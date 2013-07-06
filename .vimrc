set smartindent      	  " Guess indent level, based on syntax.
set autoindent          " Automatic indentation while typing                  
set expandtab        	  " Set soft tabs (replace tabs with <tabstop> spaces).
set softtabstop=2    	  " A tab will be replaced with this amount of spaces.
set shiftwidth=2     	  " Same as tabstop, but for autoindents and >> indents.
set tabstop=2        	  " Real tabs will be this long and will show up, because of 
set nowrap              " we dont want any wrapping to happen
set virtualedit=all     " TOTAL FREEDOM 4 my curZ0r
syntax on               " Syntax highlighting

" Set leader to comma, which is easier to reach
let mapleader = ","

" Run Pathogen
execute pathogen#infect() 

" Convenient keymap for NERDTree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Always use MRU
let g:ctrlp_cmd = 'CtrlPMRU'
