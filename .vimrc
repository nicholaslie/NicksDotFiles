set number
set autoindent
set laststatus=2


autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'

" Add plugins here
Plugin 'artur-shaik/vim-javacomplete2'

call vundle#end()
filetype plugin indent on

