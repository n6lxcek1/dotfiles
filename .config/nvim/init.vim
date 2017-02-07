"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/tiago/.cache/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/tiago/.cache/dein/')
  call dein#begin('/home/tiago/.cache/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/tiago/.cache/dein//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('xolox/vim-notes')		" for better notes management
  call dein#add('xolox/vim-misc')		" required for vim-notes
  call dein#add('vim-airline/vim-airline')	" to have buffers like tabs
  call dein#add('vim-airline/vim-airline')	" to have buffers like tabs
  call dein#add('roggan87/vim-bible')		" to insert bible texts with ease

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Plugins Options
"
" vim-bible
let g:BibleTranslation = "ESV"
let g:BibleFormat = " \\3. \\4"
let g:BibleLocale = "en"
nnoremap <leader>b 0v$hyI*A*0 :call Bible(@+)<CR>
vnoremap <leader>b y :call Bible(@+)<CR>

" Vim-Airline
set laststatus=2                             " to always display statusbar
let g:airline#extensions#tabline#enabled = 1 " to display buffers like tabs when only one tab exists
"let g:airline_powerline_fonts = 1            " to automaically populate g:airline_symbols

" Vim-Notes
:let g:notes_directories = ['~/Sync/Notizen', '~/Google Drive/Notizen']

" Clipboard
set clipboard+=unnamedplus " synchronize X11 and nvim clipboards

" Buffers
:set hidden   " Makes vim more liberal to buffers with unsaved changes

" More consistent copy... after all you already have yy
nnoremap Y y$

" Expanding the resources of the find command
set path=+** " For finding files recursively under subfolders
set wildmenu " Display all matching files when we tab complete

" Some key maps
" Buffers
:nmap <C-l> :bnext<CR>
:nmap <C-h> :bprev<CR>
:nmap <C-i> :b#<CR>
:nmap <C-x> :bd<CR>

" For saving folds and loading them automatically
"autocmd BufWritePost,BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

" Spell Checking
map <leader>s :set spell!<CR> 
set complete+=kspell 		" search on spell dictionary if spell is enabled

" Search
set ic                      " Case insensitive search
set smartcase               " ...except when something is capitalized

"Numbers
set relativenumber
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber     " Switch between relative and absolute line numbers depending on mode
