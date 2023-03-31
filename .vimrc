" tab settings
set tabstop=2
set shiftwidth=2
set expandtab

filetype plugin indent on

set encoding=utf-8
set fileencodings=utf-8,latin1

syn on

set number
set showmatch
set incsearch
inoremap jk <Esc>

nmap <up>    <nop>
nmap <down>  <nop>
nmap <left>  <nop>
nmap <right> <nop>

set mouse=a

nmap <c-s> :w<CR>
imap <c-s> <Esc>:<CR>a

colorscheme snazzy
