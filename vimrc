execute pathogen#infect()
set t_Co=256
syntax on
filetype plugin indent on
set background=light

" --------- Ctrl-P ---------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\vnode_modules'
let g:ctrlp_custom_ignore = '\velm-stuff'

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if $TMUX == ''
  set clipboard+=unnamed
endif
set modelines=0
set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=80
set formatoptions=qrn1
set pastetoggle=<F2>
set mouse=a
set shell=bash
set tags+=gem-tags
let mapleader=","
" --------- File browsing -------------
let g:netrw_winsize = 25
let g:netrw_browse_split = 3
let g:netrw_banner = 0
let g:netrw_liststyle = 3

iabbrev bpry require 'pry'; binding.pry;
iabbrev destory destroy

" --------- Vim files ---------
" handle .un~ and .swp~ files
set backupdir=/private/tmp
set directory=/private/tmp
set undodir=/private/tmp

"-------- Highlighting ---------
" status bar on insert
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=8a8a8a
endif
" fold
hi Folded ctermbg=8a8a8a
" search terms
hi Search ctermbg=LightGrey
hi Search ctermfg=Green
" Not sure why this stopped working with Vim in Tmux
" hi Search ctermbg=585858
" hi Search ctermfg=8a8a8a

" ---------- Rspec -------------
" turn variable declaration into let statement in rpsec
let @l = "^ilet(:jkea)jkwr{A }jk"
" turn let statment in variable declaration in rspec
let @k = "^dwxxwxwr=$xx"

" ----------- Go ---------------
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go set tabstop=4 shiftwidth=4 softtabstop=4

" ----------- Elm --------------
nnoremap <leader>em :ElmMake<CR>
au FileType elm set tabstop=4 shiftwidth=4 softtabstop=4

" ----------- C/C++ ------------
au FileType c set tabstop=4 shiftwidth=4 softtabstop=4
au FileType cpp set tabstop=4 shiftwidth=4 softtabstop=4

" ------- Objective-C++ --------
au FileType objcpp set tabstop=4 shiftwidth=4 softtabstop=4

" --------- Markdown -----------
au BufRead,BufNewFile *.md set filetype=markdown

" ----------- Vue --------------
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" Mappings --------------------------
nnoremap E :%Eval<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>f :Vexplore<CR>
nnoremap <leader>dt :!bundle show --paths \| xargs ctags -R -f gem-tags<cr>
nnoremap <leader>pt :!ctags -R -f tags<cr>
nnoremap <leader><space> :noh<cr>
nnoremap / /\v
vnoremap / /\v
inoremap jj <ESC>
inoremap jk <ESC>
inoremap <C-d> <Del>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
nnoremap ; :
nmap <silent> <leader><CR> i<CR><ESC>
nmap <silent> <leader>o o<ESC>
nmap <silent> <leader>O O<ESC>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <leader><BS> kA<Esc>lmaj^d`ai<Space><Esc>
nnoremap <leader><CR> i<CR><Esc>
nnoremap <leader>v :vsp<CR><C-w>l
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s :!bundle exec rspec --color %<cr>
nnoremap <leader>l :exe '!bundle exec rspec --color %:'.line('.')<cr>
nnoremap <leader>t :call ToggleSyntax()<CR>
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

function! Save()
  :call TrimWhiteSpace()
  :retab
endfunction

function! ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
  else
    syntax on
  endif
endfunction

autocmd BufWritePre * call Save()
if exists(':RainbowParenthesesToggle')
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
endif
