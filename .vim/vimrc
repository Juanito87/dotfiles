" Basic config
set nocompatible                                                               " No compatibility with vi
syntax enable                                                                  " Enable syntax highlight using file extension
set autoread                                                                   " If the file is changed outside of vim, it's read again
set number relativenumber                                                      " Turn hybrid line numbers on
set formatoptions=qln                                                          " Sets format options when pasting, q= comments can be formatted, l= long lines are not broken, n= recognize numbered list when formatting test. :h fo-table for reference
let mapleader =" "                                                             " Setting leader to space bar
set splitbelow splitright                                                      " Splits open at the bottom and right
set viminfo+=n~/.vim/viminfo

" Clipboard integration
set mouse=a                                                                    " Enable mouse use in all modes (n, v, i, c and h) helps with visual selection
set clipboard=unnamedplus                                                      " Vim buffer to system clipboard (requieres vim compiled with +clipboard)
"" Integration for wsl and clipboard
if system('uname -r') =~ "Microsoft"
    augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe ',@")
    augroup END
endif

" Undo files
"" Checking and setting needed directories and permission
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir                                                    " Setting dir for undo files
set undofile                                                                   " Enabling undo files

" Indentation config
filetype plugin indent on                                                      " When indenting with '>', use 4 spaces width
set tabstop=4                                                                  " When indenting with '>', use 4 spaces width
set shiftwidth=4                                                               " On pressing tab, insert 4 spaces
set expandtab                                                                  " Source a global configuration file if available
set smarttab                                                                   " Inserts or delete shift width worth of space
set backspace=indent,eol,start                                                 " Allows backspace to delete normally in insert mode
set smartindent                                                                " Allows auto indent
au FileType * set formatoptions-=c formatoptions-=r formatoptions-=o           " Disables automatic commenting with text width, on newline, or inserting with o. This config needs to execute after all file type plugin instances
au BufReadPost * if &modifiable | retab | endif                                " Retab when opening the document, if the file is modifiable

" Display options
set showmode                                                                   " Show the current mode in use in the last line
set showcmd                                                                    " Shows commands in the las line
set laststatus=2                                                               " Shows status line for windows
set ruler                                                                      " Show line and column number of the cursor
set wildmenu                                                                   " Improved command line completion
set display+=lastline                                                          " Show lines that do not fit the screen

" Folding options
set foldmethod=syntax                                                          " Folding method used, according to syntax
set foldnestmax=10                                                             " Set maximum nested foldings, up to 20
set nofoldenable                                                               " At open everything is normal, not folded
set foldlevel=2                                                                " Needs testing.

" Airline config
set t_Co=256                                                                   " Set terminal color options
let g:airline_powerline_fonts = 1                                              " Set powerline symbols
" packadd! dracula                                                               " Needed for dracula to start
" colorscheme dracula                                                            " Set color scheme to dracula plugin
colorscheme gruvbox                                                            " Set color scheme to gruvbox plugin
set background=dark                                                            " Set dark mode
let g:airline#extensions#tmuxline#enabled = 0                                  " Set vim theme in tmux status line
let g:airline#extensions#branch#enabled = 1                                    " Setting airline to show branches
let g:airline#extensions#fugitiveline#enabled = 1                              " Enable buffer line integration with fugitive
let g:airline#extensions#fzf#enabled = 1                                       " Enable fzf integration
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'                   " Configure title for quickfix buffers
let g:airline#extensions#quickfix#location_text = 'Location'                   " Configure title for location buffers
let g:airline#extensions#syntastic#enabled = 1                                 " Configure syntastic integration
let g:airline_detect_spell=1                                                   " Detect spelling in airline

" Search and autocomplete config
set path+=**                                                                   " Search subfolders, allow autocomplete
set wildmode=longest,list,full                                                 " Enable autocomplete longest match first, then list all matches
set wildmenu                                                                   " Display matching files when we tab complete
set showmatch                                                                  " Show matching brackets
set ignorecase                                                                 " Do case insensitive matching
set smartcase                                                                  " Do smart case matching
set incsearch                                                                  " Incremental search to highlight partial matches
set hlsearch                                                                   " Highlight partial search
set rtp+=~/.fzf                                                                " Setting fzf in runtime
function! s:update_highlights()                                                " Setting highlight to match theme
    hi CursorLine ctermbg=none guibg=none
    hi VertSplit ctermbg=none guibg=none
endfunction
autocmd User AirlineAfterTheme call s:update_highlights()

" Spell check, adding usability to autocomplete
setlocal spell spelllang=en,es                                                 " Setting dictionaries languages
highlight SpellBad cterm=underline ctermfg=12 ctermbg=0                        " Setting highlight options
highlight SpellCap cterm=underline ctermfg=9 ctermbg=0                         " Setting highlight options
highlight SpellRare cterm=underline ctermfg=10 ctermbg=0                       " Setting highlight options
highlight SpellLocal cterm=underline ctermfg=11 ctermbg=0                      " Setting highlight options

" Expanding % functionality load matchit.vim, but only if the user hasn't installed a newer version
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Display different types of white spaces.
set list
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Improving git integration
if executable('rg')
    let g:rg_derive_root='true'
endif

" Automatically deletes all trailing white space and newlines at end of file on save
au BufWritePre * %s/\s\+$//e
au BufWritepre * %s/\n\+\%$//e

" Netrw config
"" Toggle function to work more like nerdtree
function! ToggleVimExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
"" Remap for toggle
nmap <leader>e :call ToggleVimExplorer()<cr>
"" Set netrw for all calls to netrw
function! NetrwMapping()
    let g:netrw_banner = 0                " Remove the banner at the top
    let g:netrw_liststyle = 3             " Default directory view. Cycle with i
    let g:netrw_browse_split = 0          " New files are opened in a new vertical
    let g:netrw_altv = 1                  " Files are opened to the right of netrw
    let g:netrw_winsize = 25              " Window size
    let g:netrw_sort_sequence = '[\/]$,*' " Default config
    let g:netrw_list_hide= '.*.swp$,
                \ *.pyc$,
                \ *.log$,
                \ *.o$,
                \ *.xmi$,
                \ *.swp$,
                \ *.bak$,
                \ *.pyc$,
                \ *.class$,
                \ *.jar$,
                \ *.war$,
                \ *__pycache__*'
endfunction
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

" Mappings
"" Adding remap for to manage splits. Moving, closing, resizing, opening splits.
map <silent> <C-h> WinMoveLeft
map <silent> <C-j> WinMoveDown
map <silent> <C-k> WinMoveUp
map <silent> <C-l> WinMoveRight
nnoremap <C-C> <C-W><C-C>
if bufwinnr(1)
    map <S-K> <C-W>+
    map <S-J> <C-W>-
    map <S-H> <c-w><
    map <S-L> <c-w>>
endif
" Move to the window in the direction shown, or create a new window
function s:WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'<esc>'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
" Call to function definition
" Navigate to pane to the left, or create a new pane
nnoremap WinMoveLeft :<C-U>call <SID>WinMove('h')<CR>
" Navigate to pane to below, or create a new pane
nnoremap WinMoveDown :<C-U>call <SID>WinMove('j')<CR>
" Navigate to pane above, or create a new pane
nnoremap WinMoveUp :<C-U>call <SID>WinMove('k')<CR>
" Navigate to pane to the right, or create a new pane
nnoremap WinMoveRight :<C-U>call <SID>WinMove('l')<CR>

" syntastic options
let g:syntastic_always_populate_loc_list = 1                    " Always put detected error in the loclist
let g:syntastic_auto_jump = 1                                   " Jumps directly to first error on open
let g:syntastic_auto_loc_list = 1                               " Opens error windows if errors are detected
let g:syntastic_check_on_open = 1                               " Check for syntax errors on open
let g:syntastic_check_on_wq = 0                                 " Do not check files if quitting
let g:syntastic_error_symbol = "✗"                              " Mapping error symbol
let g:syntastic_warning_symbol = "⚠"                            " Mapping warning symbol
let g:syntastic_json_checkers = ["jsonlint"]                    " Setting json linter
let g:syntastic_yaml_checkers = ["jsyaml"]                      " Setting yaml linter
let g:syntastic_php_checkers = ["php","phpcs"]                  " Setting php linter
let g:syntastic_css_checkers = ["phpcs"]                        " Setting css linter
let g:syntastic_dockerfile_checkers = ["dockerfile-lint"]       " Setting dockerfile linter
let g:syntastic_html_checkers = ["w3"]                          " Setting html linter
let g:syntastic_filetype_map = {"Dockerfile": "dockerfile"}     " Map dockerfiles with lower case as dockerfiles
au FileType qf wincmd L                                         " Setting quickfix/loclist to the right side of the screen
au FileType qf vertical resize 80                               " Resize quickfix/loclist to 80 lines
"" Mappings for allowing quick jump to errors, closing and opening loclist
map <leader>n :lnext<CR>
map <leader>p :lprevious<CR>
map <leader>c :lclose<CR>
map <leader>o :lopen <bar>

" Enabling use of alias from vim
let $BASH_ENV = "~/.vim/bash_env"
