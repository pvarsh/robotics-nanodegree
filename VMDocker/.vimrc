" Vim settings for ROS & Gazebo
set nocompatible
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set clipboard=unnamedplus
set mouse=a
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set autoread
filetype plugin indent on
colorscheme desert

" Wrap XML-style files
autocmd FileType xml setlocal wrap linebreak

" ROS/Gazebo file types
autocmd BufRead,BufNewFile *.launch,*.xacro,*.urdf,*.sdf,*.world set filetype=xml
autocmd BufRead,BufNewFile *.msg,*.srv,*.action set filetype=ros
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" vim-plug section
call plug#begin('~/.vim/plugged')

" ROS support
Plug 'TAMU-VITA/ros.vim'

" Better XML/URDF/SDF syntax
Plug 'othree/xml.vim'

" Optional: nice statusline
Plug 'vim-airline/vim-airline'

call plug#end()

