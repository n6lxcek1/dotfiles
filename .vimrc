"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'roggan87/vim-bible'
Plugin 'flazz/vim-colorschemes'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'edkolev/tmuxline.vim'

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

"Plugins Options

" vim-bible
let g:BibleTranslation = "ESV"
let g:BibleFormat = " \\3. \\4"
let g:BibleLocale = "en"
nnoremap <leader>b 0v$hyI**A**0 :call Bible(@+)<CR>
vnoremap <leader>b y :call Bible(@+)<CR>

" CtrlP
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_show_hidden = 1

"vim-airline
set laststatus=2                             " to always display statusbar
let g:airline#extensions#tabline#enabled = 1 " to display buffers like tabs when only one tab exists
let g:airline_powerline_fonts = 1            " to automaically populate g:airline_symbols

" vim-markdown
let g:vim_markdown_toc_autofit = 1

"Tabs
set listchars=tab:▸\ ,eol:¬
set list                      " Visualize tabs and line breaks
set tabstop=2 shiftwidth=2    " Tab is two spaces
set expandtab                 " Use spaces, not tabs
set linebreak                 " wrap at spaces and tabs
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`

" Backspace
set backspace=indent,eol,start    " Backspace through everything
:imap <C-BS> <C-W>

" Default Theme
syntax enable
colorscheme badwolf
set t_Co=256        " 256 colors

" Markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md,*.txt  set ft=markdown " Set markdown extension
" autocmd FileType markdown setlocal spell                                               " Spell-check Markdown files
nmap <leader>s :set spell!<CR>                                                           " Shortcut to rapidly toggle `set spell`

"Numbers
set relativenumber
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber     " Switch between relative and absolute line numbers depending on mode

" Vimrc

" Source the vimrc file after saving it and refresh Airline
if !exists("*SourceAndRefresh")
  function SourceAndRefresh()
    source $MYVIMRC
    AirlineRefresh
  endfunction
endif

" Automatically see the changes
if has("autocmd")
  autocmd bufwritepost .vimrc call SourceAndRefresh()
endif

" easy edit vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>
"
" Search
set ic                      " Case insensitive search
set smartcase               " ...except when something is capitalized
set hls                     " Highlight search
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>   " Press Space to turn off highlighting and clear any message already displayed.

"=====[ Highlight matches when jumping to next ]=============
 nnoremap <silent> n n:call HLNext(0.4)<CR>
 nnoremap <silent> N N:call HLNext(0.4)<CR>

"=====[ Highlight the match in red ]=============
function! HLNext (blinktime)
  highlight WhiteOnRed ctermfg=white ctermbg=red
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" Indentation
" set autoindent

" Split in a more logical order
set splitbelow
set splitright

" Clipboard
if has("unnamedplus")
  set clipboard=unnamedplus " synchronize X11 and vim clipboards
endif

" Preloading registers
" let @r=' A (v.)i'

" Buffers
:set hidden   " Makes vim more liberal to buffers with unsaved changes

" Shell autocomplete behavior
set wildmode=longest,list

" More consistent copy... after all you already have yy
nnoremap Y y$

" Mouse
set mouse=a

" Some key maps
" Buffers
:nmap <C-k> :bnext<CR>
:nmap <C-j> :bprev<CR>
:nmap <C-i> :b#<CR>
:nmap <C-x> :bd<CR>

:nmap <leader>t :Tabularize /
:nmap <leader>o :Toc<CR>

" For saving folds and loading them automatically
autocmd BufWritePost,BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
"set viewoptions=cursor,folds,slash,unix     " for not saving to the working directory

" Things to do on first install

" sudo pacman -S the_silver_searcher #for :Ag functionality

" Vundle installation:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim +PluginInstall +qall
"
" Airline
" Font Installation
"
" wget https://github.com/powerline/fonts/archive/master.zip
" unzip master.zip
" mv 'SomeFont for Powerline.otf'/valid/font/path/indicated/by/$xset q
" fc-cache -vf /valid/font/path/indicated/by/$xset q
" restart terminal emulator and X
