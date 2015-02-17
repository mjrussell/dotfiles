set nocompatible

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Tabs are 2 spaces
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Highlight search
set hlsearch

" Always show line numbers and current position
set ruler
set number

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
        \ if expand("<afile>:p:h") !=? $TEMP |
        \   if line("'\"") > 1 && line("'\"") <= line("$") |
        \     let JumpCursorOnEdit_foo = line("'\"") |
        \     let b:doopenfold = 1 |
        \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
        \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
        \        let b:doopenfold = 2 |
        \     endif |
        \     exe JumpCursorOnEdit_foo |
        \   endif |
        \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
        \ if exists("b:doopenfold") |
        \   exe "normal zv" |
        \   if(b:doopenfold > 1) |
        \       exe  "+".1 |
        \   endif |
        \   unlet b:doopenfold |
        \ endif
augroup END

" Fix backspace
set backspace=indent,eol,start

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Don't clutter my dirs up with swp and tmp files
set backupdir=~/.tmp
set directory=~/.tmp

let mapleader = ","

" map escape to something easier
imap ;; <Esc>

" clear search quickly
map <Leader><space> :noh<cr>

" Centers the next result on the page
map N Nzz
map n nzz

" Other remaps
noremap <Leader>n :set nopaste<cr>
noremap <Leader>p :set paste<cr>
noremap <Leader>vi :split ~/.vimrc<CR>

" Color scheme
if has('gui_running')
    set background=dark
    colorscheme solarized
endif

" Normal mode switch between tabs
nmap <silent> <Left> :tabp<CR>
nmap <silent> <Right> :tabn<CR>

" Tab helpers
noremap <Leader>s :split
noremap <Leader>v :vnew
noremap <Leader>t :tabe <C-R><CR>

" Disable quote hiding in json from https://github.com/elzr/vim-json
let g:vim_json_syntax_conceal = 0
" Always show the status line for airline
set laststatus=2
" Arline
let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1
set guifont=Inconsolata-g\ for\ Powerline:h11
