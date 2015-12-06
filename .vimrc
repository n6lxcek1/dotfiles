"Vundle told be to paste this bunch here:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'roggan87/vim-bible'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line








nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`

"Tabs
set listchars=tab:▸\ ,eol:¬
"set list                          " Visualize tabs and linebreaks
set tabstop=2 shiftwidth=2        " Tab is two spaces
set expandtab                     " Use spaces, not tabs
set backspace=indent,eol,start    " Backspace through everything
set linebreak                     " wrap at spaces and tabs

" Default Theme
color blackboard

" Markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md,*.txt  set ft=markdown     "Set markdown extension

"Numbers
set relativenumber
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber     " Switch between relative and absolute line numbers depending on mode

" Vimrc
if has("autocmd") " Source the vimrc file after saving it - automatically see the changes
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" easy edit vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Search
set ic                      " Case insensitive search
set smartcase               " ...except when something is capitalized
set hls                     " Higlhight search
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>   " Press Space to turn off highlighting and clear any message already displayed.

" Indentation
set autoindent

" Split in a more logical order
set splitbelow
set splitright

" Clipboard
if has("unnamedplus")
  set clipboard=unnamedplus "sincronize X11 and vim clipboards
endif

" Preloading registers
let @r=" A (v.)i"

" Buffers
:set hidden   " Makes vim more liberal to buffers with unsaved changes

" Shell autocomplete behavior
set wildmode=longest,list

" More consistent copy... after all you already have yy
nnoremap Y y$

" Variables for the vim-bible plugin
let g:BibleTranslation = "ESV"
let g:BibleFormat = "\\3. \\4"
"let g:BibleLocale = "en"
nnoremap <leader>b y :call Bible()<CR>
vnoremap <leader>b y :call Bible()<CR>
