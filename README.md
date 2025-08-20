# <div align="center">vim no plugin configuration</div>
##### Copy to terminal, press Enter to run: 
```
mkdir -p ~/.vim/backup ~/.vim/undo;
curl https://raw.githubusercontent.com/Bound-2/vim-no-plugin-configuration/main/.vimrc >> ~/.vimrc
```
<img width="1920" height="1080" alt="vimrc" src="https://github.com/user-attachments/assets/162c393c-5af8-4c76-bee9-9401be07cb86" />

##### Better reading experience: https://github.com/Bound-2/vim-no-plugin-configuration/blob/main/README.md?plain=1
```
set mouse=a                                                                             "Enable mouse support
set scrolloff=1                                                                         "Enable drag selection
set fillchars+=eob:\                                                                    "Hide blank line marker style (Note the trailing space)
set rulerformat=%l,%c%=%p%%                                                             "Position percentage based on row number
set clipboard=unnamedplus,autoselectplus                                                "Share the system clipboard and select Automatic Copy

au FocusLost * silent! write!                                                           "Force auto-save when focus leaves
au BufWinLeave * silent! mkview                                                         "Save the state when you left
au BufWinEnter * silent! loadview                                                       "Restore the state where you left off

set backup                                                                              "Enable the backup function
set backupcopy=yes                                                                      "Backup method is copy
set backupdir=~/.vim/backup                                                             "Backup file storage directory
au BufWritePre * let &backupext = strftime("_%Y%m%d_%H%M%S")                            "The backup file suffix is the save time

set undofile                                                                            "Enable persistent undo files
set undolevels=100000000                                                                "The maximum number of undo steps
set undodir=~/.vim/undo                                                                 "Undo history file storage directory

set termguicolors                                                                       "Enable 24-bit color in terminal
highlight Normal ctermfg=15 guifg=#FFFFFF                                               "Set the terminal font to bright white

set number                                                                              "Turn on line numbers
hi CursorLineNr  ctermfg=15 guifg=#FFFFFF cterm=bold gui=bold                           "The focus row number is bright white
hi LineNr        ctermfg=8  guifg=#808080                                               "Non-focused row numbers are dark gray

set cursorline                                                                          "Enable highlighting of the cursor line
hi CursorLine    ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE cterm=NONE gui=NONE    "Clear the hi of the cursor line

set incsearch                                                                           "Enable incremental search
hi IncSearch     cterm=NONE gui=NONE                                                    "Clear incremental search style

set hlsearch                                                                            "Enable search result highlighting
hi CurSearch     ctermfg=0  ctermbg=15 guifg=#000000 guibg=#FFFFFF                      "Selected search results are black text on a white background
hi Search        ctermfg=15 ctermbg=8  guifg=#FFFFFF guibg=#808080                      "Unselected search results are gray with white text

map <silent> <C-Tab> :noh<CR>                                                           "Ctrl+Tab closes the search hi

set noshowmatch                                                                         "Turn off bracket matching flashing
hi MatchParen    ctermfg=0  ctermbg=15 guifg=#000000 guibg=#FFFFFF                      "Bracket matching is highlighted in white

hi Visual        ctermfg=0  ctermbg=15 guifg=#000000 guibg=#FFFFFF                      "The selected text color is black text on a white background

vnoremap <Tab> >gv | vnoremap <S-Tab> <gv                                               "Indent selected text towards unity in Visual mode
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 smartindent                          "Convert a Tab to 4 spaces and enable smart indentation

set shortmess+=c                                                                        "Simplify message prompts during completion
set completeopt=menu,menuone,noselect                                                   "Completion menu display and selection behavior
au TextChangedI * call feedkeys(match(getline('.')[:col('.')-2],'\k$')+1?"\<C-n>":'')   "Enter text and the completion menu will pop up automatically

inoremap <expr><Tab> pumvisible()?"\<C-n>":"\<Tab>"                                     "Press Tab to select candidates downward
inoremap <expr><S-Tab> pumvisible()?"\<C-p>":"\<S-Tab>"                                 "Press Shift+Tab to select candidates upward

hi Pmenu         ctermfg=15 ctermbg=8  guifg=#FFFFFF guibg=#808080                      "Unselected candidate are gray with white text
hi PmenuSel      ctermfg=0  ctermbg=15 guifg=#000000 guibg=#FFFFFF                      "Selected candidate are black text on a white background

hi WildMenu      ctermfg=15 ctermbg=0  guifg=#FFFFFF guibg=#000000                      "Wildmenu completion style is black background and white text

hi VertSplit     ctermfg=0  guifg=#000000                                               "Hide vertical dividing line
hi StatusLine    ctermfg=15 ctermbg=0  guifg=#FFFFFF guibg=#000000                      "The horizontal line of the focused window is black on a white background
hi StatusLineNC  ctermfg=8  ctermbg=15 guifg=#808080 guibg=#FFFFFF                      "The horizontal line of the non-focused window is white on a gray background

nnoremap ; :                                                                            "Normal mode maps "；" to ":"

nnoremap <F5> :w<CR>:!xterm -e "python3 %; read" &<CR><CR>                              "Press F5 in normal mode to save and run .py
inoremap <F5> :w<CR><ESC>:!xterm -e "python3 %; read" &<CR><CR>                         "Press F5 in insert mode to save and run .py

nnoremap <F6> :w<CR>:!xterm -e "g++ -o %:r % && ./%:r; read" &<CR><CR>                  "Press F6 in normal mode to save and run .cpp
inoremap <F6> :w<CR><ESC>:!xterm -e "g++ -o %:r % && ./%:r; read" &<CR><CR>             "Press F6 in insert mode to save and run .cpp
