"buffers My sets first
set shell=/bin/zsh
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
set clipboard=unnamed

" Pluginng plug
call plug#begin('~/.vim/plugged')
" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'dikiaap/minimalist'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

call plug#end()

" Completion settings
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

" Color scheme
colorscheme gruvbox
highlight Normal ctermbg=none
" Key remaps
let mapleader = " "

" FZF KEY REMAPS
nnoremap <leader>. <cmd>Telescope find_files<CR>
nnoremap <leader>p <cmd>Telescope git_files<CR>
nnoremap <leader>bb <cmd>Telescope buffers<CR>
nnoremap <leader>bc :bp<bar>sp<bar>bn<bar>bd<CR><CR>
nnoremap <leader>bk :bd!<CR>
nnoremap <leader>sp <cmd>Telescope live_grep<CR>

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

" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

filetype plugin on

