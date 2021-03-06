set nobackup            " Don't make a backup before overwriting a file
set nowritebackup       " Don't write to backup files
set noswapfile          " Don't use swapfiles
set hidden              " Don't kill unwritten buffers when hidden

set tabstop=2           " Global tab width
set shiftwidth=2        " Global shift width
set expandtab           " Use spaces instead of tabs
set wrap                " Enable line wrapping

set formatoptions=t     " Prevent auto-commenting hard line wraps

set ttyfast             " Send more characters for redraws
set mouse=a             " Enable the mouse in all modes *gasp*

if has('mouse_sgr')
  set ttymouse=sgr
else
  set ttymouse=xterm2
endif

nnoremap H ^
nnoremap L $
nmap <Space>t :TagbarToggle<CR>
