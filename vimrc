" BASIC SETTINGS
set nocompatible
filetype off

" remove trailing whitespace
autocmd FileType javascript,js,html,python,scala autocmd BufWritePre <buffer> %s/\s\+$//e
noremap <C-m> :%s/\s\+$//e<CR>

" Custom Key mappings
set encoding=UTF-8
noremap <S-l> gt
noremap <S-h> gT
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
set pastetoggle=<F3>

" resize vertical 
nnoremap <C-r> :vertical resize 


" PLUGIN SETTINGS
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Tree Explorer
Plugin 'scrooloose/nerdtree'

" Fuzzy File Search
Plugin 'kien/ctrlp.vim'

" Syntax Highlighting
Plugin 'sheerun/vim-polyglot'

" Solarized
Plugin 'altercation/vim-colors-solarized.git'

" Surround
Plugin 'tpope/vim-surround'

" Status Line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" For Airline to access Git Branch
Plugin 'tpope/vim-fugitive'

" Comments
Plugin 'tpope/vim-commentary'

" AutoComplete
Plugin 'ajh17/VimCompletesMe'

" Pair Parens, Brackets, etc...
Plugin 'jiangmiao/auto-pairs'

" Linting
Plugin 'w0rp/ale'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" BASICS
" ------------
set number
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" SYNTAX HIGHLIGHTING
" --------------------
syntax on
set background=light
let g:solarized_termcolors=256
colorscheme solarized


" NERDTREE CONFIG
" ---------------
"autocmd vimenter * NERDTree   " auto open
map <C-n> :NERDTreeToggle<CR> " Ctrl-N to open
" close if only NerdTree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" CTRLP
" ----------
"  use The Silver Searcher
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " ignore files
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' " custom ignore
"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path_mode = 'r' " current git directory

" AIRLINE
" -------
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='solarized'
let g:airline_theme_bg='light'
let g:airline_powerline_fonts = 1
set t_Co=256

" AutoComplete
let b:vcm_tab_complete = 1

" Linting
let g:ale_fixers = {
\   'javascript': ['prettier-eslint'],
\   'css': ['csslint'],
\   'scss': ['prettier'],
\   'python': ['autopep8'],
\}
let g:ale_fix_on_save = 1

