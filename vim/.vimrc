" .vimrc - VIM config

" Keep plugins in ~/.vim-plugins
call plug#begin('~/.vim-plugins')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'raimondi/delimitMate'
Plug 'vim-scripts/Gundo'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'gregsexton/MatchTag'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rodjek/vim-puppet'
Plug 'robbles/logstash.vim'

" Plug 'vim-scripts/javacomplete'
call plug#end()

filetype plugin on                        " use the file type plugins
filetype indent on                        " automatic indenting while typing
syntax enable                             " syntax highlighting
set modelines=0                           " CVE-2007-2438
set ai                                    " auto indenting
set history=1000                          " keep 1000 lines of history
set ruler                                 " show the cursor position
set nohlsearch                            " don't highlight the last searched term
set tabstop=4                             " tabs should only be 4 spaces!
set shiftwidth=4                          " indenting for reindent operations
set expandtab                             " only spaces!
set softtabstop=4                         " a tab = 4 spaces
set number                                " line numbers on
set laststatus=2                          " always show the status line
set background=dark                       " tell vim background color is dark
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅  " shows the respective signs if either tab, trail or nbsp
set showmode                              " show mode in status bar
set backspace=2                           " more powerful backspacing
set autochdir                             " always switch to the current file directory
set backup                                " always make backup files
set backupdir=~/.vim-backup               " where to store backup files
set directory=~/.vim-swp                  " keep swapfiles in one place.
set undofile                              " always make undo files
set undodir=~/.vim-undo                   " keep undo files in one place
set incsearch                             " incremental search
set nowrap                                " don't wrap lines
set hidden                                " manage multiple buffers effectivly
set wildmenu                              " tab completion options
set wildmode=list:longest                 " longest list
set scrolloff=3                           " more lines of context
set vb t_vb=                              " no bells
set ttyfast                               " send more data to the terminal
set t_Co=256                              " 256 colors in vim
set colorcolumn=80                        " Show marker at column 80
set encoding=utf-8
set termencoding=utf-8

" Change <Leader>
let mapleader = ","

" Indedentation for selected filetypes
autocmd FileType html setlocal sw=2 ts=2 sts=2
autocmd FileType htmldjango setlocal sw=2 ts=2 sts=2
autocmd FileType css setlocal sw=2 ts=2 sts=2
autocmd FileType scss setlocal sw=2 ts=2 sts=2
autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType js setlocal sw=2 ts=2 sts=2
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
autocmd FileType xml setlocal sw=2 ts=2 sts=2
autocmd FileType sql setlocal sw=2 ts=2 sts=2
autocmd FileType logstash setlocal sw=2 ts=2 sts=2

" Don't write backup file if vim is being called by 'crontab -e'
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by 'chpass'
au BufWrite /private/etc/pw.* set nowritebackup

" Make with `return` in normal mode
map <C-M> :make<CR>

" Stop help from not being helpful
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Filetype specific options for TeX
autocmd FileType tex setlocal fileencoding=utf-8
autocmd FileType tex setlocal makeprg=pdflatex\ '%'
autocmd FileType tex setlocal spell
autocmd FileType tex setlocal spelllang=da
" make sure vim-latex is loaded if the file is an empty .tex
let g:tex_flavor='latex'

" Filetype specific options for yml (yml for me = ansible)
autocmd FileType yaml setlocal filetype=ansible

" Omnicompletion for various languages
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango

" NERDTree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.class$', '\.aux$', '\.git$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
map <F3> :NERDTreeToggle<CR>

" Dont fold in markdown files
let g:vim_markdown_folding_disabled=1
autocmd FileType mkd setlocal wrap

" Gundo remap
nnoremap <F4> :GundoToggle<CR>

" Buffergator config
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_viewport_split_policy = "T"
let g:buffergator_split_size = 10
let g:buffergator_display_regime = "filepath"
map <F2> :BuffergatorToggle<CR>

" Tagbar config
noremap <silent> <F5> :TagbarToggle<CR>

" Syntastic config
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_python_checkers=['pylint', 'flake8']
let g:syntastic_go_checkers = ['golint', 'go', 'govet']
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "⚠"

let g:syntastic_mode_map={'mode': 'active',
        \ "active_filetypes": [],
        \ 'passive_filetypes': ['tex']}

" NERD commenter config
let g:NERDCustomDelimiters = {'python': { 'left': '# ' }}

" vim-easytags config
let g:easytags_async = 1

" YouCompleteMe config
let g:ycm_server_keep_logfiles = 1
" let g:ycm_path_to_python_interpreter = '/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7'
" let g:ycm_path_to_python_interpreter = '/usr/local/Frameworks/Python.framework/Versions/2.7/bin/python2.7'
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" UltiSnips config
let g:UltiSnipsExpandTrigger="<c-j>"

" vim-airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'

" ack config
let g:ackprg = 'ag --vimgrep'

" Viewport Controls i.e. moving between split panes
map <silent>,h <C-w>h
map <silent>,j <C-w>j
map <silent>,k <C-w>k
map <silent>,l <C-w>l

" Split correctly
set splitbelow
set splitright

" Ultisnips + Youcompleteme fixing
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

colorscheme hybrid
