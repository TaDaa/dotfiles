set termguicolors
set guifont=OperatorMono\ Nerd\ Font
nmap <Leader>ci gc
vmap <Leader>ci gc
vmap <Leader>cs gc
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set nowrap
filetype on
filetype plugin on
filetype indent on
set number
set relativenumber
set signcolumn=yes
set nowrap
set ic!
set background=dark
set lsp=1
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set incsearch
set hlsearch
set smartindent
set autoindent
set cot=menu,preview,noselect
set encoding=utf-8
set laststatus=2
set ambiwidth=single
" vim.cmd('set statusline+=%#warningmsg#')
" vim.cmd('set statusline+=%*')
set statusline=[%.n]%m\ %f%=%<%P
set signcolumn=yes
command! Bd bd

function! FinishSetup()
  colorscheme onedark
endfunction

au! User LazyDone call FinishSetup()
au! VimEnter * call FinishSetup()
