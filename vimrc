set nocompatible
set colorcolumn=80
set history=1000

filetype off                   " required by Vundle!
autocmd FileType ruby set re=1 " Ruby syntax really slow with new re engine.

syntax on

" Colorscript from: http://www.vim.org/scripts/script.php?script_id=3529
colorscheme distinguished      


"""
" Vundle magic
"""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'Valloric/YouCompleteMe'
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

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


fixdel
set number
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
