
" Init {{{
if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/config/nvim/bundles/repos/github.com/Shougo/dein.vim
set runtimepath+=/usr/local/opt/fzf

" }}}

" Definitions {{{
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
" }}}

" Bundles {{{
call dein#begin('~/dotfiles/config/nvim/bundles')

call dein#add('~/dotfiles/config/nvim/bundles/repos/github.com/Shougo/dein.vim')
" call dein#add('Shougo/deoplete.nvim')
" call dein#add('deoplete-plugins/deoplete-jedi')

call dein#add('ncm2/ncm2')
" call dein#add('ncm2/ncm2-bufword')
call dein#add('ncm2/ncm2-path')
call dein#add('ncm2/ncm2-jedi')
call dein#add('ncm2/ncm2-ultisnips')

call dein#add('airblade/vim-gitgutter')
call dein#add('AndrewRadev/linediff.vim')
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
call dein#add('davidhalter/jedi-vim')
call dein#add('easymotion/vim-easymotion')
call dein#add('edkolev/tmuxline.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('junegunn/fzf.vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('lifepillar/vim-solarized8')
call dein#add('matze/vim-move')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('scrooloose/nerdtree')
call dein#add('SirVer/ultisnips')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-sensible')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('w0rp/ale')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('yggdroot/indentline')

" NeoBundle 'christoomey/vim-tmux-navigator'
" NeoBundle 'idris-hackers/idris-vim.git'

call dein#add('roxma/nvim-yarp')

call dein#end()

filetype plugin indent on

" }}}

" Colors, Encodings and UI {{{
" -- Color Scheme {{{
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=light
colorscheme solarized8
syntax enable
" -- }}}

" -- UI {{{
" ---- Highlight 100th Column
set colorcolumn=100

set scrolloff=3 " Keep three lines between cursor and edge of screen

" ---- Highlight Tabs
set list
set listchars=tab:>-
highlight SpecialKey ctermfg=236 ctermbg=234 guibg=#242424

" ---- Highlight Spelling Mistakes
set spell
highlight SpellBad cterm=undercurl ctermbg=bg ctermfg=yellow
set lazyredraw

" ---- Always show signcolumns
set signcolumn=yes

" ---- Display Options {{{
set number
set showcmd
set ruler
set cursorline
set showmode
set matchpairs+=<:>
set laststatus=2
set showtabline=2
set cmdheight=1
set shortmess=atA
" ---- }}}
" -- }}}
" }}}

" Editing {{{
set backspace=2
set whichwrap+=<,>,h,l
set nowrap
set timeoutlen=1000
set ttimeoutlen=50
set foldmethod=marker
set pastetoggle=<F2>

" -- Tabs {{{
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set autoindent
set smartindent
set smarttab
" -- }}}
" }}}

" Search {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}

" Path {{{
set backupdir=~/.hist/nvim_swp//
set directory=~/.hist/nvim_swp//
set viminfo+=n~/.hist/nviminfo
" }}}

" Autocomplete {{{
set wildmenu
set wildmode=longest:full,list
set wildignore=*.o,*~,*.pyc,*.d,*/tmp/*,*.so,*.swp,*.gz,*.tar
set wildignore+=*.css,*.html
if has("wildignorecase")
    set wildignorecase
end

" -- Autocomplete Menu
" set completeopt=menu,menuone,longest
set completeopt=noinsert,menuone,noselect
set pumheight=15
" }}}

" Autocmds {{{
autocmd BufEnter * silent! lcd %:p:h
" }}}

" Plugin Options {{{

" -- Airline {{{
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1
" }}}

" -- Deoplete
" let g:deoplete#enable_at_startup=1

" Disable Jedi-vim autocompletion and enable call-signatures options {{{
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
" }}}

" -- Tex {{{
" autocmd Filetype tex setl updatetime=1000
" let g:livepreview_previewer='open -a Preview'
" let g:livepreview_previewer='open -a Skim'
" }}}

" -- LogiPat {{{
"let g:loaded_logipat = 1
" }}}

" -- IndentLine {{{
"let g:indentLine_setColors = 0
" }}}

" -- NCM2 {{{
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
augroup END

" use new fuzzy match
let g:ncm2#matcher = 'substrfuzzy'
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" }}}

" -- ALE {{{
" make sure the BG color matches the sign column:
highlight link ALEErrorSign   SignColumn
highlight link ALEWarningSign SignColumn
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_list_window_size = 4
" let g:ale_sign_column_always = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = '1'
"  }}}

" -- Language Server {{{
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}
if executable('pyls')
    let g:LanguageClient_serverCommands.python = ['pyls']
end

let g:LanguageClient_useVirtualText = 0 " linted text on every error/warning line

" let g:LanguageClient_windowLogMessageLevel = "Error"
let g:LanguageClient_rootMarkers = ['.git']
" }}}

" -- Haskell Vim {{{
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" }}}

" -- fzf.vim {{{
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \           fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)
" }}}

command! -nargs=* -range -bang Align <line1>,<line2>call easy_align#align(<bang>0, 0, 'command', <q-args>)

" }}}

" Mappings {{{
map Y y$

" -- Easy Motion {{{
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" map \ <Plug>(easymotion-prefix)
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

"  }}}

nnoremap <C-p> :ProjectFiles<CR>

" -- Easy Align {{{
xmap ga <Plug>(EasyAlign)   " Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)   " Start interactive EasyAlign for a motion/text object (e.g. gaip)
" }}}

let g:AutoPairsMapCR=0 

" -- NCM2 {{{
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new line.
inoremap <expr> <Enter> (pumvisible() ? "\<C-y>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"      " TAB goes down menu
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"  " S-TAB goes up menu
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>") " ENTER hides menu
" }}}

" -- UltiSnips {{{
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <Enter> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger       = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger      = "<S-Tab>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" }}}

" -- Language Server {{{
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F3> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <F4> :call LanguageClient#textDocument_references()<CR>
" }}}

" -- Move A-hjkl {{{
" let g:move_key_modifier = 'A'
let g:move_map_keys=0
" on Mac, need the actual unicode chars instead of alt modifier
vmap ∆ <Plug>MoveBlockDown
vmap ˚ <Plug>MoveBlockUp
vmap ˙ <Plug>MoveBlockLeft
vmap ¬ <Plug>MoveBlockRight

nmap ∆ <Plug>MoveLineDown
nmap ˚ <Plug>MoveLineUp
nmap ˙ <Plug>MoveCharLeft
nmap ¬ <Plug>MoveCharRight

" }}}

" -- NERD Tree {{{
map <C-n> :NERDTreeToggle<CR>
" }}}

" -- Tab navigation C-kjt {{{
nnoremap <C-k> :tabprevious<CR>
nnoremap <C-j> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>:Ex<CR>
" -- }}}

" -- Split Sizing HJKL {{{
nnoremap H :vertical resize +2<CR> " previously: home cursor - first line on screen
nnoremap L :vertical resize -2<CR> " previously:             - last line on screen
nnoremap K :resize +2<CR>
nnoremap J :resize -2<CR>
" }}}

" -- Leader <space>-wqh {{{
let mapleader = " " " Leader is the space key
let g:mapleader = " "
let maplocalleader = "`"
let g:maplocalleader = "`"
nnoremap <SPACE> <Nop>

" auto indent for brackets
" nmap <leader>w :w!<cr>
nmap <leader>q :lcl<cr>:q<cr>
nnoremap <leader>h :nohlsearch<Bar>:echo<CR>
" }}}

" -- Clipboard {{{
set clipboard=unnamed
" -- }}}

" -- Mouse {{{
set mouse=a
" -- }}}

" -- }}}

