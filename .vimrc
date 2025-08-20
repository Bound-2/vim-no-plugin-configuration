set mouse=a
set scrolloff=1
set fillchars+=eob:\ 
set rulerformat=%l,%c%=%p%%
set clipboard=unnamedplus,autoselectplus

au FocusLost * silent! write!
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

set backup
set backupcopy=yes
set backupdir=~/.vim/backup
au BufWritePre * let &backupext = strftime("_%Y%m%d_%H%M%S")

set undofile
set undolevels=100000000
set undodir=~/.vim/undo

set termguicolors
highlight Normal ctermfg=15 guifg=#FFFFFF

set number
hi CursorLineNr  ctermfg=15 guifg=#FFFFFF cterm=bold gui=bold
hi LineNr        ctermfg=8  guifg=#808080

set cursorline
hi CursorLine    ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=NONE gui=NONE

set incsearch
hi IncSearch     cterm=NONE gui=NONE

set hlsearch
hi CurSearch     ctermfg=0  ctermbg=15 guifg=#000000 guibg=#FFFFFF
hi Search        ctermfg=15 ctermbg=8  guifg=#FFFFFF guibg=#808080

map <silent> <C-Tab> :noh<CR>

set noshowmatch
hi MatchParen    ctermfg=0  ctermbg=15 guifg=#000000 guibg=#FFFFFF

hi Visual        ctermfg=0  ctermbg=15 guifg=#000000 guibg=#FFFFFF

vnoremap <Tab> >gv | vnoremap <S-Tab> <gv
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 smartindent

set shortmess+=c
set completeopt=menu,menuone,noselect
au TextChangedI * call feedkeys(match(getline('.')[:col('.')-2],'\k$')+1?"\<C-n>":'')

inoremap <expr><Tab> pumvisible()?"\<C-n>":"\<Tab>"
inoremap <expr><S-Tab> pumvisible()?"\<C-p>":"\<S-Tab>"

hi Pmenu         ctermfg=15 ctermbg=8  guifg=#FFFFFF guibg=#808080
hi PmenuSel      ctermfg=0  ctermbg=15 guifg=#000000 guibg=#FFFFFF

hi WildMenu      ctermfg=15 ctermbg=0  guifg=#FFFFFF guibg=#000000

hi VertSplit     ctermfg=0  guifg=#000000
hi StatusLine    ctermfg=15 ctermbg=0  guifg=#FFFFFF guibg=#000000
hi StatusLineNC  ctermfg=8  ctermbg=15 guifg=#808080 guibg=#FFFFFF

nnoremap ; :

nnoremap <F5> :w<CR>:!xterm -e "python3 %; read" &<CR><CR>
inoremap <F5> :w<CR><ESC>:!xterm -e "python3 %; read" &<CR><CR>

nnoremap <F6> :w<CR>:!xterm -e "g++ -o %:r % && ./%:r; read" &<CR><CR>
inoremap <F6> :w<CR><ESC>:!xterm -e "g++ -o %:r % && ./%:r; read" &<CR><CR>
