" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set termguicolors

set nocompatible                  " Must come first because it changes other options.
set mouse=a

set autoread
au CursorHold * checktime

" change leader key
let mapleader = ","

" 256-color terminal

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

" runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set noshowmatch

set noswapfile
set foldmethod=indent

" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins

function! g:FuckThatMatchParen ()
  if exists(":NoMatchParen")
    :NoMatchParen
  endif
endfunction

augroup plugin_initialize
  autocmd!
  autocmd VimEnter * call FuckThatMatchParen()
augroup END

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest,full    " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set nohlsearch                    " Highlight matches.

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

let g:auto_save = 1               " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
set updatetime=1000

set undodir=~/.vim/.undo//

set backupdir=~/.vim/.backup//

set directory=~/.vim/.swp//

let g:airline_theme='srcery'

set backupcopy=yes

" UNCOMMENT TO USE
set expandtab                    " Use spaces instead of tabs
set shiftwidth=2                 " And again, related.
set softtabstop=2                    " Global tab width.

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
" Or use vividchalk
let g:srcery_italic = 1
colorscheme srcery

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/Quramy/tsuquyomi.git'

Plug 'scrooloose/nerdtree'

Plug 'srcery-colors/srcery-vim'

"Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'mileszs/ack.vim'

Plug 'https://github.com/pangloss/vim-javascript.git'

Plug 'tpope/vim-fugitive'

Plug 'git://github.com/tpope/vim-speeddating.git'

Plug 'https://github.com/tpope/vim-git.git'

Plug 'git://github.com/tpope/vim-surround.git'

Plug 'mattn/emmet-vim'

Plug 'git://github.com/tpope/vim-commentary.git'

Plug 'mxw/vim-jsx'

Plug 'https://github.com/leshill/vim-json.git'

"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

Plug 'https://github.com/danro/rename.vim.git'

Plug 'https://github.com/elzr/vim-json.git'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'octol/vim-cpp-enhanced-highlight'

" React code snippets
Plug 'epilande/vim-react-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'w0rp/ale'

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'https://github.com/vim-scripts/vim-auto-save'

" Track the engine.
Plug 'SirVer/ultisnips'

Plug 'vim-scripts/vim-misc'

Plug 'https://github.com/xolox/vim-lua-ftplugin'

"TMUX / VIM Naviagor
Plug 'christoomey/vim-tmux-navigator'

Plug 'https://github.com/vim-syntastic/syntastic.git'

"RUST
Plug 'roxma/nvim-completion-manager'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'

Plug 'neomake/neomake'

"markdown
Plug 'https://github.com/shime/vim-livedown.git'

"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

"Plug 'honza/vim-snippets'
Plug 'jceb/vim-orgmode'

" Initialize plugin system
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:racer_experimental_completer = 1
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"

au BufNewFile,BufRead,BufReadPost *.rc set syntax=rust

" RUST
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

let g:rustfmt_autosave = 1

nmap <leader>r :! cargo run<CR>

" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw')

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let g:neomake_javascript_enabled_makers = ['eslint']

" neomake
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

let g:deoplete#enable_at_startup = 1

" Set bin if you have many instalations
let g:deoplete#sources#ternjs#tern_bin = '/Users/carmanbabin/.nvm/versions/node/v10.1.0/bin/ternjs'
let g:deoplete#sources#ternjs#timeout = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

let g:deoplete#auto_completion_start_length = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some
" heuristics to try and return some properties anyway. Set this to 0 to
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 1

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 1

" Whether to ignore the properties of Object.prototype unless they have been
" spelled out by at least to characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 1

" Uncomment to use Jamis Buck's file opening plugin
" map <Leader>t :FuzzyFinderTextMate<Enter>
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

"folding
" set foldmethod=syntax
" set foldlevel=20

"javaScript
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'
set completeopt-=preview

" Give a shortcut key to NERD Tree
map <F8> :NERDTreeToggle<CR>
