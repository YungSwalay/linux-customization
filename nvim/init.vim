call plug#begin()    
Plug 'fatih/vim-go'    
Plug 'scrooloose/nerdtree'    
Plug 'WolfgangMehner/bash-support'    
Plug 'vim-airline/vim-airline'    
Plug 'vim-airline/vim-airline-themes'    
Plug 'tpope/vim-fugitive'    
Plug 'dracula/vim', { 'as': 'dracula' }    
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }    
call plug#end()    
    
let g:deoplete#enable_at_startup = 1    
    
" Open NERDTree when opening vim
autocmd vimenter * NERDTree    
    
" Set color to dracula
colorscheme dracula    
" Set background to transparent (like terminal)
hi Normal guibg=None ctermbg=None    
    
" Numbers in gutter
set number

" Shell scripts are treated as bash
let g:is_bash = 1
