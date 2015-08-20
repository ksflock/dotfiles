"vim:fdm='marker' 
"
" General "{{{
let mapleader=" " " default is \ ^[[29~ or something is windows popup


" TODO:
" http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/225852#225852
 set nocompatible " disable vi compatibility.
 set history=256 " Number of things to remember in history.
 set autowrite " Writes on make/shell commands
 set autoread
 set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
 set clipboard+=unnamed " Yanks go on clipboard instead.
 set pastetoggle=<F10> " toggle between paste and normal: for 'safer' pasting from keyboard
 set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags
 " Modeline
 set modeline
 set modelines=5 " default numbers of lines to read for modeline instructions
 " Backup
 set nowritebackup
 set nobackup
 set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
 " Buffers
 set hidden " The current buffer can be put to the background without writing to disk
 " Match and search
 set hlsearch " highlight search
 set ignorecase " Do case in sensitive matching with
 set smartcase " be sensitive when there's a capital letter
 set incsearch "
 " "}}}
 " Formatting "{{{
 set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
 set fo-=r " Do not automatically insert a comment leader after an enter
 set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)
 set nowrap
 set textwidth=0	" Don't wrap lines by default
 set wildmode=longest,list " At command line, complete longest common string, then list alternatives.
 set backspace=indent,eol,start " more powerful backspacing
 set tabstop=2 " Set the default tabstop
 set softtabstop=2
 set shiftwidth=2 " Set the default shift width for indents
 set expandtab " Make tabs into spaces (set by tabstop)
 set smarttab " Smarter tab levels
 set autoindent
 set cindent
 set cinoptions=:s,ps,ts,cs
 set cinwords=if,else,while,do,for,switch,case
 syntax on " enable syntax
 filetype plugin indent on " Automatically detect file types.
 " "}}}
 " Visual "{{{
 set nonumber " Line numbers off
 set showmatch " Show matching brackets.
 set matchtime=5 " Bracket blinking.
 set novisualbell " No blinking
 set noerrorbells " No noise.
 set laststatus=2 " Always show status line.
 set vb t_vb= " disable any beeps or flashes on error
 set ruler " Show ruler
 set showcmd " Display an incomplete command in the lower right corner of the Vim window
 set shortmess=atI " Shortens messages
 set nolist " Display unprintable characters f12 - switches
 set listchars=tab:?\ ,eol:?,trail:?,extends:?,precedes:? " Unprintable chars mapping
 set foldenable " Turn on folding
 set foldmethod=marker " Fold on the marker
 set foldlevel=100 " Don't autofold anything (but I can still fold manually)
 set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
 set mouse-=a " Disable mouse
 set mousehide " Hide mouse after chars typed
 set splitbelow
 set splitright
 " "}}}
 " Command and Auto commands " {{{
 " Sudo write
 comm! W exec 'w !sudo tee % > /dev/null' | e!
 "Auto commands
 au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
 au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=markdown
 au BufRead,BufNewFile {COMMIT_EDITMSG} set ft=gitcommit
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif " restore position in file
 " " }}}
 " Key mappings " {{{
 nnoremap <silent> <LocalLeader>rs :source ~/.vimrc<CR>
 nnoremap <silent> <LocalLeader>rt :tabnew ~/.vim/vimrc<CR>
 nnoremap <silent> <LocalLeader>re :e ~/.vim/vimrc<CR>
 nnoremap <silent> <LocalLeader>rd :e ~/.vim/ <CR>
 " Tabs
 nnoremap <silent> <LocalLeader>[ :tabprev<CR>
 nnoremap <silent> <LocalLeader>] :tabnext<CR>
 " Duplication
 vnoremap <silent> <LocalLeader>= yP
 nnoremap <silent> <LocalLeader>= YP
 " Buffers
 nnoremap <silent> <LocalLeader>- :bd<CR>
 " Split line(opposite to S-J joining line)
 nnoremap <silent> <C-J> gEa<CR><ESC>ew
 " map <silent> <C-W>v :vnew<CR>
 " map <silent> <C-W>s :snew<CR>
 nnoremap # :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
 nnoremap * #
 map <S-CR> A<CR><ESC>
 "
 " Control+S and Control+Q are flow-control characters: disable them in your terminal settings.
 " $ stty -ixon -ixoff
 noremap <C-S> :update<CR>
 vnoremap <C-S> <C-C>:update<CR>
 inoremap <C-S> <C-O>:update<CR>
 "
 " show/Hide hidden Chars
 map <silent> <F12> :set invlist<CR>
 "
 " generate HTML version current buffer using current color scheme
 map <silent> <LocalLeader>2h :runtime! syntax/2html.vim<CR>
 " " }}}
" Plugins configuration "{{{
set nocompatible
filetype off "Why is this a Vundle requirement?
" Set runtimepath to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is supposed to be a commented line
" But I tend to forget toi put the comment tags in
" So what to do? 

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'drmingdrmer/xptemplate'
Plugin 'octave.vim--'              "octave syntax and omnicomplete
Plugin 'baruchel/vim-notebook'     "Integrate octave, maxima, R and others with vim.

"Plugin 'Xolox/vim-misc'
"Plugin 'Xolox/vim-notes'


call vundle#end()             " required
filetype plugin indent on     " required


let NERDTreeDirArrows=0

if isdirectory(expand("~/.vim/bundle/nerdtree"))
	map <leader>e :NERDTreeToggle<CR>

	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
	let NERDTreeChDirMode=0
	let NERDTreeQuitOnOpen=1
	let NERDTreeMouseMode=2
	let NERDTreeShowHidden=1
	let NERDTreeKeepTreeInNewTab=1
	let g:nerdtree_tabs_open_on_gui_startup=0
	autocmd vimenter * NERDTree
endif
" "}}}
"let g:notes_directory = ['~/VimNotes']
let g:xptemplate_minimal_prefix=1
let g:xptemplate_always_show_pum=1

" Octave syntax and omnicomplete
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup end

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype octave
        \ if &omnifunc=="" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif
filetype plugin on


