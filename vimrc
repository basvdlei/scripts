set nocompatible
set noautochdir
set colorcolumn=80
set history=1000

filetype off                   " required by Vundle!
autocmd FileType ruby set re=1 " Ruby syntax really slow with new re engine.

syntax on

" Downloaded from: http://www.vim.org/scripts/download_script.php?src_id=23147 "colorscheme github      
" http://cocopon.me/app/vim-color-gallery/
" https://github.com/nanotech/jellybeans.vim/tree/master/colors
colorscheme jellybeans


"""
" Vundle magic
"""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'vim-scripts/ZoomWin'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'wincent/command-t'
call vundle#end()
filetype plugin indent on     " required!
set nobackup
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"
"
"""
" END Vundle magic
"""

let g:go_fmt_command = "goimports"

fixdel
set number
set relativenumber
set backspace=2
set whichwrap+=<,>,h,l
set mouse=a
set clipboard=unnamedplus
set noerrorbells
set vb
set ruler

" Make the GUI pretty
if has("gui_running")
	set guioptions-=T
	set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
	set columns=100
	set lines=40
else
	set background=dark
endif

" Create an extra status line with Git branch info
set statusline=%{fugitive#statusline()}  " Add git info
set statusline+=%f                       " Path to the file
set statusline+=%=                       " Switch to the right side
set statusline+=%l                       " Current line
set statusline+=/                        " Separator
set statusline+=%L                       " Total lines
set laststatus=2                         " Always display status bar
