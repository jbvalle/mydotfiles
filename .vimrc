call plug#begin('~/.vim/plugged')

" PLANT UML PLUGINS
Plug 'https://github.com/aklt/plantuml-syntax'
Plug 'https://github.com/jbvalle/plantuml-previewer.vim'
Plug 'https://github.com/jbvalle/open-browser.vim'

" Vim Status line
Plug 'https://github.com/jbvalle/lightline.vim'

" Nerdtree
Plug 'https://github.com/jbvalle/nerdtree'

" Surround
Plug 'https://github.com/jbvalle/vim-surround'

"Autopairs
Plug 'https://github.com/jbvalle/auto-pairs'

Plug 'vim-scripts/gtk-mode'

" Git
Plug 'https://github.com/jbvalle/vim-fugitive'

Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'

Plug 'https://github.com/vim-scripts/AutoComplPop'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'vim-latex/vim-latex'

Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()


nnoremap <C-p> :Files ~/Coding<CR>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree <bar> set relativenumber <CR>
nnoremap <C-t> :NERDTreeToggle <bar> set relativenumber <CR>
nnoremap <C-f> :NERDTreeFind <bar> set relativenumber <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
"
" Escape Key mapping
inoremap kj  <Esc>

"----------------------------------------------------------------------------------

" Go to tab by number
noremap <C-n><C-t> :tabnew<CR>
noremap <C-r><C-t> :tabclose<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt       
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
"""" Nerdtree Keybindings

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"""" Basic Behavior

set number              " show line numbers
set relativenumber
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping
set listchars=tab:\|\ 
set list

" Open Terminal in Current directoryjk
command T  lcd %:h | below terminal 

"""" Key Bindings

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk


"""" Vim Appearance

" put colorscheme files in ~/.vim/colors/
colorscheme murphy      " good colorschemes: murphy, slate, molokai, badwolf, solarized

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on


"""" Tab settings

set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')


"""" Search settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches



"""" Miscellaneous settings that might be worth enabling

"set cursorline         " highlight current line
"set background=dark    " configure Vim to use brighter colors
"set autoread           " autoreload the file in Vim if it has been changed outside of Vim
packadd! gruvbox
syntax enable
colorscheme gruvbox

"set vim terminal transparency
autocmd VimEnter * hi Normal ctermbg=none



"---------------------------------------------------------------
" Git mappings
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gt :Git commit -v -q %<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>

" Markdown Preview configs
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

"----------------------------------------------------------------
" Markdown mappings 
nnoremap <C-s> :MarkdownPreview
nnoremap <C-S> :MarkdownPreviewStop

