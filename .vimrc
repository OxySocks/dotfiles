set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle Plugins 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/solarized'

call vundle#end()
filetype plugin indent on

" Color scheme
syntax on
set background=light
colorscheme solarized 

" General settings
set autoindent 
set tabstop=8
set softtabstop=0
set expandtab
set smarttab
set shiftwidth=4

set ignorecase 
set smartcase

inoremap jj <ESC>

" Space toggle folds
nnoremap <space> za

" CtrlP mapping to <c-p>
nnoremap <silent> <C-t> :CtrlP<CR>

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>
