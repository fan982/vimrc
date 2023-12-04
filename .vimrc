" Set utf-8 as standard encoding
set encoding=utf-8

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Display line number
set number
set signcolumn=number

" Fast saving
nmap <leader>w :w!<cr>

" About TAB, 1 tab == 4 spaces
set smarttab
set tabstop=4
set shiftwidth=4

" Enable the mouse
set mouse=a

" Auto indent and smart indent
set ai
set si

" Line break on 500 characters
set lbr
set tw=500
set wrap

" No backup or swap file
set nobackup
set noswapfile
set nowb

" Background color scheme
set regexpengine=0

" Shift + Tab to switch to the next tab
nnoremap <S-Tab> :tabn<CR>

" Tab + Enter to build a new empty
nnoremap <Tab><CR> :call OpenFileInNewTab()<CR>
function! OpenFileInNewTab()
    let filename = input("Enter file path: ")
    execute ":tabedit " . filename
endfunction

" Tab + BackSpace to delete current tab
nnoremap <Tab><BS> :tabclose<CR>

colorscheme default

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set background=dark

" Add a bit extra margin to the left
set foldcolumn=0

" Enable file type plugins
filetype plugin on
filetype indent on

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Highlight search results and smart increment search
set incsearch
nnoremap <Leader>n :nohlsearch<CR>

" Enable syntax highlight
syntax enable

" Alawys show the status line
set laststatus=2
set statusline=%1*%F%m%r%h%w%=\ %2*\ %{GetTime()}\ \|\ %3*%{\"\".(\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}\ %4*[%l,%v]\ %5*%p%%\ \|\ %6*%LL

" Get current time
function! GetTime()
	let current_time = strftime('%H:%M')
	return '⌛️'.current_time
endfunction

" A timer to refresh the status line every 60s
let g:refresh_interval = 60000
let g:statusline_timer = timer_start(g:refresh_interval, 'UpdateStatusline', {'repeat': -1})

" Refresh Function
function! UpdateStatusline(timer_id)
	redrawstatus
endfunction
