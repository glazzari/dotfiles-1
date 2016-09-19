" vim: foldmethod=marker foldlevel=0

" ----------------------------------------------------------------------
" Plugins

" vim-plug, load plugins {{{

call plug#begin('~/.config/nvim/plugged')

" Browsing
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'                 " <C-p> to find files
Plug 'tpope/vim-unimpaired'               " [b, ]b, ]t, etc...
Plug 'mileszs/ack.vim'                    " :Ack [pattern] to search for pattern
Plug 'justinmk/vim-sneak'                 " s{char}{char} to move the cursor to {char}{char}

" Edit
Plug 'tpope/vim-commentary'               " comment stuff out (use gcc to comment and gcgc to uncomment)
Plug 'tpope/vim-endwise'                  " plugin that helps to end certain structures automatically
Plug 'tpope/vim-surround'                 " to change ( with {: cs({; wrapp word with ': ysiw'
Plug 'tpope/vim-repeat'                   " improve vim repeat feature '.'
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " <C-n> to toggle between number and relativenumber
Plug 'yggdroot/indentline'                " <leader>ig to toggle on/off
Plug 'itchyny/lightline.vim'
Plug 'ervandew/supertab'                  " improve <Tab> completion in insert mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'

" Colors
Plug 'chriskempson/base16-vim'
Plug 'junegunn/seoul256.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Languages
Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'      " vim-ruby needs 'gem install neovim' if you want code completion
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'tpope/vim-markdown', {'for' : 'markdown'}

" Lint
Plug 'scrooloose/syntastic'

" Add plugins to &runtimepath
call plug#end()

" }}}


" ----------------------------------------------------------------------
" Settings

" NeoVim {{{
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" }}}

" Mapleader {{{
let mapleader = ' '
" }}}

" Theme & Layout {{{
colorscheme base16-tomorrow-night
set guifont=Hack:h14
" }}}

" Local directories {{{
set undodir=~/.config/nvim/undo
" }}}

" Editor layout {{{
set cmdheight=2                 " use a status bar that is 2 rows high
set colorcolumn=100             " highlight certain column(s)
set completeopt=menuone,preview
set cursorline                  " highlight the current line, for quick orientation
set listchars=tab:▸\
set listchars+=space:∙
set listchars+=trail:∙
set listchars+=extends:#
set listchars+=eol:¬
set listchars+=nbsp:_
set foldenable                  " enable folding
set foldcolumn=0                " column to show folds
set foldlevel=5                 " open all folds by default
set foldmethod=syntax           " syntax are used to specify folds
set foldminlines=0              " allow folding single lines
set foldnestmax=5               " set max fold nesting level
set formatoptions=
set formatoptions+=c            " format comments
set formatoptions+=o            " make comment when using o or O from comment line
set formatoptions+=q            " format comments with gq
set formatoptions+=n            " recognize numbered lists
set formatoptions+=2            " use indent from 2nd line of a paragraph
set formatoptions+=l            " don't break lines that are already long
set formatoptions+=1            " break before 1-letter words
set noerrorbells                " don't beep
set nolist                      " don't show unprintable characters by default
set number                      " always show line numbers
set ruler                       " show cursor position
set scrolloff=5                 " keep 5 lines off the edges of the screen when scrolling
set shortmess=aIT               " avoid a series of prompts caused by file messages
set showcmd                     " show (partial) command in the last line of the screen
set showtabline=2               " always show tab bar
set sidescrolloff=5             " start scrolling five columns before vertical border of window
set splitbelow                  " open new split panes to right...
set splitright                  " ... and bottom, which feels more natural
set termguicolors               " true colors
set title                       " change the terminal's title
set undofile                    " persistent undo
set virtualedit=block           " allow the cursor to go in to invalid places
set visualbell                  " don't beep
" }}}

" Editing {{{
set autoread                    " automatically reload files changed outside of Vim
set autowrite                   " automatically save before :next, :make etc.
set clipboard=unnamed           " normal OS clipboard interaction
set esckeys                     " allow cursor keys in insert mode
set expandtab                   " expand tabs to spaces (overloadable per file type)
set nostartofline               " don't reset cursor to start of line when moving around
set nowrap                      " by default don't wrap line
set shiftwidth=2                " number of spaces to use for autoindenting
set showmatch                   " set show matching parenthesis
set smartindent                 " always set smartindenting on
set tabstop=2                   " a tab is two spaces
" }}}

" diff-mode (nvim -d file1 file2) {{{
set diffopt=filler              " add vertical spaces to keep right and left aligned
set diffopt+=iwhite             " ignore whitespace changes (focus on code changes)
" }}}

" Searching {{{
set ignorecase                  " ignore case when searching
set magic                       " enable extended regexes
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set wrapscan                    " searches wrap around end of file
" }}}

" Performance {{{
set hidden                      " hide buffers instead of closing them
set lazyredraw                  " don't update the display while executing macros
set nobackup                    " do not keep backup files
set noshowmode                  " do not put mode message in last line
set noswapfile                  " do not write annoying intermediate swap files
set shada='20,\"80              " read/write a .viminfo file, don't store more than 80 lines of registers
set switchbuf=useopen           " reveal already opened files from the quickfix window instead of opening new buffers
set undolevels=1000             " use many levels of undo
set wildmode=list:full          " show a list when pressing tab and complete first full match
" }}}


" ----------------------------------------------------------------------
" General Configurations and Mappings

" General {{{
augroup general_config
  autocmd!

  " Speed up viewport scrolling {{{
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>
  " }}}

  " Remap :W to :w {{{
  command! W w
  " }}}

  " Toggle show tabs and trailing spaces (<space>c) {{{
  nnoremap <silent> <leader>c :set nolist!<CR>
  " }}}

  " Clear last search {{{
  nnoremap <silent> <Esc> <Esc>:noh<CR>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Insert newline {{{
  map <leader><Enter> o<ESC>
  " }}}

  " Search and replace word under cursor (<space>*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Toggle folds (,) {{{
  nnoremap <silent> , :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

  " Save with <C-s> or <space>w {{{
  inoremap <C-s>     <C-O>:update<cr>
  nnoremap <C-s>     :update<cr>
  nnoremap <leader>w :update<cr>
  " }}}

  " Terminal {{{
  tnoremap <Esc><Esc> <C-\><C-n>
  " }}}

  " Enforce purity {{{
  nnoremap <Left>   <Nop>
  nnoremap <Right>  <Nop>
  nnoremap <Up>     <Nop>
  nnoremap <Down>   <Nop>
  " }}}

  " <tab> / <s-tab> | Circular windows navigation {{{
  nnoremap <tab>   <c-w>w
  nnoremap <S-tab> <c-w>W

  " Or using ctrl to jump directly to a window
  nnoremap <C-j> <C-w><C-j>
  nnoremap <C-k> <C-w><C-k>
  nnoremap <C-l> <C-w><C-l>
  nnoremap <C-h> <C-w><C-h>
  " Note: for <C-h> to work you may need to set kbs=\117 in your
  " terminal's terminfo/termcap:
  "   $ infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
  "   $ tic $TERM.ti
  " }}}

  " Strip trailing whitespace (<space>ss) {{{
  function! StripWhitespace () " {{{
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction " }}}
  noremap <leader>ss :call StripWhitespace ()<CR>
  " }}}

  " Other mappings {{{
  nnoremap <Leader><Leader> :e#<CR>                   " quickly move between current and last files
  nnoremap <leader>s :source $MYVIMRC<CR>             " reload vimrc
  " }}}

  " Close Quickfix window (<space>qq) {{{
  map <leader>qq :cclose<CR>
  " }}}

  " <F10> | NERD Tree {{{
  nnoremap <F10> :NERDTreeToggle<cr>
  " }}}

augroup END
" }}}

" Highlight Interesting Words {{{
augroup highlight_interesting_word
  autocmd!
  " This mini-plugin provides a few mappings for highlighting words temporarily.
  "
  " Sometimes you're looking at a hairy piece of code and would like a certain
  " word or two to stand out temporarily.  You can search for it, but that only
  " gives you one color of highlighting.  Now you can use <leader>N where N is
  " a number from 1-6 to highlight the current word in a specific color.
  function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
  endfunction " }}}

  " Mappings {{{
  nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
  nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
  nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
  nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
  nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
  nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
  " }}}

  " Default Highlights {{{
  hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
  hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
  hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
  hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
  hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
  hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
  " }}}
augroup END
" }}}


" ----------------------------------------------------------------------
" Plugin Configuration

" NERDTree {{{
augroup nerdtree_config
  autocmd!

  " Show hidden files, too
  let NERDTreeShowFiles=1
  let NERDTreeShowHidden=1
  " Highlight the selected entry in the tree
  let NERDTreeHighlightCursorline=1
  " Use a single click to fold/unfold directories and a double click to open files
  let NERDTreeMouseMode=2

  " In order to open NERDTree when starting vim with a directory,
  " since we configured it to load on-demand, we use the hack below.
  augroup NERDTreeLoaderHack
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer    " clear netrw autocmd group
    autocmd BufEnter,BufNew *
          \   if isdirectory(expand('<amatch>'))
          \|    call plug#load('nerdtree')
          \|    execute 'autocmd! NERDTreeLoaderHack'
          \|  endif
  augroup END
augroup END
" }}}

" syntastic {{{
augroup syntastic_config
  autocmd!

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  let g:syntastic_enable_elixir_checker = 1
  let g:syntastic_elixir_checkers = ['elixir']
augroup END
"}}}

" lightline {{{
augroup lightline_config
  autocmd!

  let g:lightline = {
        \ 'colorscheme': 'seoul256',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'syntastic', 'lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
        \ },
        \ 'component_function': {
        \   'fugitive': 'LightLineFugitive',
        \   'readonly': 'LightLineReadonly',
        \   'filename': 'LightLineFilename'
        \ },
        \ 'component_expand': {
        \   'syntastic': 'SyntasticStatuslineFlag'
        \ },
        \ 'component_type': {
        \   'syntastic': 'error'
        \ },
        \ }

  function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? '' : ''
  endfunction

  function! LightLineFugitive()
    if exists('*fugitive#head')
      let branch = fugitive#head()
      return branch !=# '' ? ' ' . branch : ''
    endif
    return ''
  endfunction

  function! LightLineFilename()
    let fname = expand('%:t')
    return fname =~ 'NERD_tree' ? '' : '' != fname ? fname : '[No Name]'
  endfunction

  augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost * call s:syntastic()
  augroup END
  function! s:syntastic()
    SyntasticCheck
    call lightline#update()
  endfunction
augroup END
" }}}

" ack.vim {{{
augroup ack_vim_config
  autocmd!

  " Use The Silver Searcher in case it is present
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
augroup END
" }}}

" vim-json {{{
augroup vim_json_config
  autocmd!

  let g:vim_json_syntax_conceal = 0
augroup END
" }}}

" indentline {{{
augroup indentline_config
  autocmd!

  let g:indentLine_char = '┊'

  " <Leader>ig toggles indent lines
  nnoremap <Leader>ig :IndentLinesToggle<CR>
augroup END
" }}}

" vim-gitgutter {{{
augroup vim_git_gutter_config
  autocmd!

  " Always show the sign column
  let g:gitgutter_sign_column_always = 1
augroup END
" }}}

