" Set <leader> to space bar
let mapleader = " "

call plug#begin()    
Plug 'fatih/vim-go'    
Plug 'scrooloose/nerdtree'    
Plug 'WolfgangMehner/bash-support'    
Plug 'vim-airline/vim-airline'    
Plug 'vim-airline/vim-airline-themes'    
Plug 'guns/vim-sexp'
Plug 'tpope/vim-fugitive'    
Plug 'tpope/vim-fireplace'    
Plug 'tpope/vim-repeat'    
Plug 'tpope/vim-sexp-mappings-for-regular-people'    
Plug 'HiPhish/repl.nvim'
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

" HiPhish/repl.nvim configurations (not for clojure repl!)
let g:repl = {
			\ 'python': {
				\ 'bin': 'ipython',
				\ 'syntax': 'python',
				\ 'args': ['--no-autoindent']
				\ }
			\}

" HiPhish/repl.nvim keymappings
nmap <leader>rs  <Plug>(ReplSend)
nmap <leader>rss <Plug>(ReplSendLine)
nmap <leader>rs_ <Plug>(ReplSendLine)
vmap <leader>rs  <Plug>(ReplSend)

function! SpawnIPython()
	call repl#spawn(':below', g:repl['python'], 'python')
	exe "normal \<C-w>10-"
endfunction

command IPython call SpawnIPython()
