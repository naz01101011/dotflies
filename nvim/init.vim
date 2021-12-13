"buffers My sets first
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set scrolloff=17
set incsearch
set signcolumn=yes
set nowrap
set clipboard+=unnamedplus

" Pluginng plug
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
call plug#end()

" Color scheme
colorscheme gruvbox

" Key remaps
let mapleader = " "

" FZF KEY REMAPS
nnoremap <leader>. :Files<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bc :bp<bar>sp<bar>bn<bar>bd<CR><CR>
nnoremap <leader>bk :bd!<CR>
nnoremap <leader>sp :Rg<CR>

" NERDTREE KEY REMAPS
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>c :NERDTreeCWD<CR>

" OTHER KEY REMAPS
nnoremap <leader>gd <Plug>(coc-definition)
nnoremap <leader>gr <Plug>(coc-references)
" Alt + j/k moves the current line down or up
nnoremap <C-A-j> :m .+1<CR>==
nnoremap <C-A-k> :m .-2<CR>==

" WINDOW NAVIGATION KEY REMAPS
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>ws :sp<CR>
nnoremap <leader>wv :vs<CR>
nnoremap <leader>wc :q<CR>
nnoremap <leader>3v :vertical resize 75<CR>
nnoremap <leader>2v :vertical resize 110<CR>
nnoremap <leader>3s :resize 15<CR>
nnoremap <leader>2s :resize 27<CR>

" TERMINAL KEY REMAPS
nnoremap <leader>t :term<CR>
tnoremap <Esc> <C-\><C-n>

" nnoremap <A-e> :Lex <bar> :vertical resize 30<CR>
" nnoremap <A-t> :term <bar> :vertical resize 45<CR>

" Trim the fucking white spaces on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ALEX
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Prettify with coc
command! -nargs=0 Pretty :CocCommand prettier.formatFile

filetype plugin on
