set tabstop=4
set softtabstop=4
set expandtab
set number
set cursorline
set wildmenu
set showmatch
set smartindent
set shiftwidth=4
set nowrap
set ignorecase
set smartcase
set laststatus=2
set ruler
set showcmd
set scrolloff=5

set incsearch

" Vim update files that are externally changed when returning to window
set autoread
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
"autocmd FileChangedShellPost *
"  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"---------------------------------
" Remaps
"---------------------------------
let mapleader = ','

" replace current word with yanked word
nnoremap <leader>s ciw<c-r>0<esc>
" paste and format
nnoremap <leader>p p=`]
" toggle highlight search
nnoremap <leader><leader> :set hlsearch!<CR>
" Go Back, for example after 'Goto Definition = gd' (sometimes ctrl-o is mapped to something else)
nnoremap gb <c-o>
noremap q: <nop>
" remap go to topic
noremap <c-l> <c-]> 
" find word under cursor number of occurences
map <leader>* *<C-O>:%s///gn<CR>

"--------------------------------
" File extensions
" -------------------------------
autocmd BufNewFile,BufRead *.ejs set syntax=html
autocmd BufNewFile,BufRead *.sensei set syntax=json

"---------------------------------
" Installing plugins
"---------------------------------
call plug#begin('~/.vim/plugged')

" expand abbreviations
Plug 'mattn/emmet-vim'
" surrounding tags, quotes etc manipulation 
Plug 'tpope/vim-surround'
" easily align equal signs
Plug 'junegunn/vim-easy-align'
" allows naviagtion between tmux and vim windows as if they were splits
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
" visible file tree on left side
Plug 'scrooloose/nerdtree'
" easily align .csv files with Leader tt
Plug 'dhruvasagar/vim-table-mode'
" configures vim status bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" branch info
Plug 'tpope/vim-fugitive'
" vim diffs and hunk navigation
Plug 'airblade/vim-gitgutter'
" comments with gc or gcc
Plug 'tpope/vim-commentary'
" Highlight trailing whitespace, fix with :FixWhitespace
Plug 'bronson/vim-trailing-whitespace'
"auto cloasing of delimiters in insert mode
Plug 'Raimondi/delimitMate'
" show indentation level with thin vertical lines
Plug 'Yggdroot/indentLine'
" language packs
Plug 'sheerun/vim-polyglot'
" copy to clipboard with cp
Plug 'christoomey/vim-system-copy'
" Json syntax highlighting
Plug 'elzr/vim-json'
" Searching in project on the fly with default tools
Plug 'wsdjeg/FlyGrep.vim'
" Restoring session (for restoring tmux sessions)
Plug 'tpope/vim-obsession'

call plug#end()

"---------------------------------
" CtrlN = open Nerd Tree
"---------------------------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" TODO:
" https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696

"---------------------------------
" VimEasyAlign
"---------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"---------------------------------
" Vim splits
"---------------------------------
" rebind vim splits
map <leader>\ :vsp<CR>
map <leader>- :sp<CR>
"" increase / decrease size of split pane
nnoremap <left> <c-w><
nnoremap <right> <c-w>>
nnoremap <up> <c-w>-
nnoremap <down> <c-w>+
set splitbelow
set splitright

"---------------------------------
" Vimux : shell commands without leaving Vim
"---------------------------------
" Prompt for a command to run
map <leader>vc :VimuxPromptCommand<CR>
" Run last comand executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

"---------------------------------
" vim-airline configuration
"---------------------------------
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"---------------------------------
" COLORS
"---------------------------------
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'light'
highlight Visual ctermbg=LightRed ctermfg=NONE
highlight VertSplit ctermfg=255 ctermbg=32


"---------------------------------
" gitgutter. :GitGutterToggle or :GitGutterSignsToggle
"---------------------------------
set updatetime=100
nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk


"---------------------------------
" FlyGrep: search project with SPC s /
"---------------------------------
nnoremap <Space>s/ :FlyGrep<cr>
