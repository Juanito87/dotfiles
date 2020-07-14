" Basic config
set nocompatible                                                               " No compatibility with vi
syntax enable                                                                  " Enable syntax highlight using file extension
set autoread                                                                   " If the file is changed outside of vim, it's read again
set number relativenumber                                                      " Turn hybrid line numbers on
set formatoptions=qln
let mapleader =" "                                                             " Setting leader to space bar
set splitbelow splitright                                                      " Splits open at the bottom and right

" Indentation config
filetype plugin indent on                                                      " When indenting with '>', use 4 spaces width
set tabstop=4                                                                  " When indenting with '>', use 4 spaces width
set shiftwidth=4                                                               " On pressing tab, insert 4 spaces
set expandtab                                                                  " Source a global configuration file if available
set smarttab                                                                   " Inserts or delete shiftwidth worth of space
set backspace=indent,eol,start                                                 " Allows backspace to delete normally in insert mode
set smartindent                                                                " Allows auto indent
au FileType * set formatoptions-=c formatoptions-=r formatoptions-=o           " Disables automatic commenting with text width, on newline, or inserting with o. This config needs to execute after all filetype plugin instances

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

" " Airline config
set t_Co=256                                                                   " Set terminal color options
let g:airline_powerline_fonts = 1                                              " Set powerline symbols
colorscheme gruvbox                                                            " Set colorscheme to gruvbox plugin
set background=dark                                                            " Set dark mode

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
let g:netrw_winsize = 15        " Window size

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
        " After switching to netwr buff, lets resize to 45
        vertical resize 45
        let t:expl_buf_num = bufnr("%")
    endif
endfunction

nmap <leader>e :call ToggleVimExplorer()<cr>

function! NetrwMapping()

    let g:netrw_banner = 0                " Remove the banner at the top
    let g:netrw_liststyle = 3             " Default directory view. Cycle with i
    let g:netrw_browse_split = 2          " New files are opened in a new vertical
    let g:netrw_altv = 1                  " Files are opened to the right of netrw
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

" Adding mappings
"" Adding remap for moving between windows more naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" This mappings are for syntastic, to allow quick jump to errors, closing and opening loclist
map <leader>n :lnext<CR>
map <leader>p :lprevious<CR>
map <leader>c :lclose<CR>
map <leader>o :lopen <bar>

" syntastic options
let g:airline#extensions#syntastic#enabled = 1                  " Set statusline in airline
let g:syntastic_always_populate_loc_list = 1                    " Always put detected error in the loclist
let g:syntastic_auto_jump = 1                                   " Jumps directly to first error on open
let g:syntastic_auto_loc_list = 1                               " Opens error windows if errors are detected
let g:syntastic_check_on_open = 1                               " Check for syntax errors on open
let g:syntastic_check_on_wq = 0                                 " Do not check files if quiting
let g:syntastic_error_symbol = "✗"                              " Mapping error symbol
let g:syntastic_warning_symbol = "⚠"                            " Mapping warning symbol
let g:syntastic_json_checkers = ["jsonlint"]                    " Setting json linter
let g:syntastic_yaml_checkers = ["jsyaml"]                      " Setting yaml linter
let g:syntastic_php_checkers = ["php","phpcs"]                  " Setting php linter
let g:syntastic_css_checkers = ["phpcs"]                        " Setting css linter
let g:syntastic_dockerfile_checkers = ["dockerfile-lint"]       " Setting dockerfile linter
let g:syntastic_html_checkers = ["w3"]                          " Setting html linter
let g:syntastic_filetype_map = {"Dockerfile": "dockerfile"}     " Map dockerfiles with lower case as dockerfiles
au FileType qf wincmd L                                         " Seting quickfix/loclist to the right side of the screen
au FileType qf vertical resize 80                               " Resize quickfix/loclist to 80 lines
