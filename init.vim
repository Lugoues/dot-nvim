
" set rtp+=$HOME/.config/nvim

" General {{{
  let g:mapleader = "\<Space>"

  set clipboard=
  set number         " show line numbers
  set relativenumber " use relative lines numbering by default
  set noswapfile     " disable creating of *.swp files
  set hidden         " hide buffers instead of closing
  set lazyredraw     " speed up on large files
"  set mouse=         " disable mouse
  set scrolloff=5   " Pad cursor bounds by 10
"  set scrolloff=999       " always keep cursor at the middle of screen
 " set virtualedit=onemore " allow the cursor to move just past the end of the line
  set undolevels=5000     " set maximum undo levels

  " ! save global variables that doesn't contains lowercase letters
  " h disable the effect of 'hlsearch' when loading the viminfo
  " f1 store marks
  " '100 remember 100 previously edited files
  set viminfo=!,h,f1,'100

  set foldmethod=manual       " use manual folding
  set diffopt=filler,vertical " default behavior for diff

  " ignore pattern for wildmenu
  set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp
  set wildmode=list:longest,full

  set list " show hidden characters
  set listchars=tab:»·,trail:·,nbsp:· "Display extra whitespaces

  set laststatus=2 " always show status line
  set showcmd      " always show current command

  set nowrap        " disable wrap for long lines
  set textwidth=0   " disable auto break long lines
  set showbreak=↪
  set formatoptions-=t formatoptions-=c formatoptions-=q  formatoptions-=r
  set diffopt=iwhite " Ignore whitepsace in diffs
  set cursorline " Highlight current line

  filetype plugin indent on
  set hlsearch       " Highlight Search matches
  set showmatch

  " Send new splits to the lower right
  set splitbelow
  set splitright

  " cursor a pipe in insert-mode, and a block in normal-mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " Disable Ex Mode
  nnoremap Q <nop>

  " Switch syntax highlighting on, when the terminal has colors
  " Also switch on highlighting the last used search pattern.
  if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
  endif
 "}}}

" Load plugins {{{
  if filereadable(expand("~/.config/nvim/bundles.vim"))
    source ~/.config/nvim/bundles.vim
  endif
"}}}


" AutoCmd {{{
  " Reload vimrc on save
  augroup reload_vimrc
    autocmd!
    autocmd bufwritepost init.vim,init.local.vim,bundles.vim,bundles.local.vim nested source $MYVIMRC | redraw! |  echom "Reloaded " . $MYVIMRC
  augroup END

  " Cleanup Whitespaces
  autocmd BufWritePre * :%s/\s\+$//e
"}}


" Indentation {{{
  filetype indent on
  set nowrap
  set expandtab     " replace <Tab with spaces
  set tabstop=2     " number of spaces that a <Tab> in the file counts for
  set softtabstop=2 " remove <Tab> symbols as it was spaces
  set shiftwidth=2  " indent size for << and >>
  set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
  set autoindent
  set smartindent
"}}}


" Search {{{
  set ignorecase " ignore case of letters
  set smartcase  " override the 'ignorecase' when there is uppercase letters
  set gdefault   " when on, the :substitute flag 'g' is default on
"}}}


" Colors & Highlighting {{{
  colorscheme Tomorrow-Night " silence errors so we don't bomb out
  set guifont=Operator\ Mono\ Book:h18

  " Italics or Operator font
  highlight Comment gui=italic
  highlight Comment cterm=italic
  highlight htmlArg gui=italic
  highlight htmlArg cterm=italic
"}}}


" Key Mappings {{{
  " Quick Save
  nnoremap <leader>w :w<CR>

  " Keep search results at the center of screen
  nmap n nzz
  nmap N Nzz
  nmap * *zz
  nmap # #zz
  nmap g* g*zz
  nmap g# g#zz

  "Disable & clear search highlighting
  nnoremap <silent> <Esc><Esc> :nohlsearch<CR>:let @/ = ""<CR><Esc>

" Switch between tabs
  nmap <leader>1 1gt
  nmap <leader>2 2gt
  nmap <leader>3 3gt
  nmap <leader>4 4gt
  nmap <leader>5 5gt
  nmap <leader>6 6gt
  nmap <leader>7 7gt
  nmap <leader>8 8gt
  nmap <leader>9 9gt

  " Useful mappings for managing tabs
  noremap <leader>tn :tabnew<cr>
  noremap <leader>to :tabonly<cr>
  noremap <leader>tc :tabclose<cr>
  noremap <leader>tm :tabmove

  " Navigate Easier
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Use jk for esc
  inoremap jk <Esc>
"}}}


" LightLine {{{
    let g:lightline = {'colorscheme': 'Tomorrow_Night'}

    let g:lightline.enable = {
            \ 'statusline': 1,
            \ 'tabline': 1
    \ }

    let g:lightline.tabline = {
            \  'left':  [ [ 'tabs' ] ],
            \  'right': [ [ 'git_branch', 'git_traffic', 'git_status', 'cmd'] ]
    \ }

    let g:lightline.active = {
            \ 'left':  [ [ 'mode', 'paste' ],
            \            [ 'filetype' ],
            \            [ 'readonly', 'absolutepath' ]],
            \ 'right': [ [ 'lineinfo', 'percent' ],
            \            [ 'fileencoding' ],
            \            [ 'git_branch', 'git_gutter' ]]
    \ }

    let g:lightline.inactive = {
            \ 'left':  [ [ 'filename' ] ],
            \ 'right': [ [ 'lineinfo', 'percent' ],
            \            [ 'fileencoding' ] ]
    \ }

    let g:lightline.component = {
      \ 'readonly': '%{&readonly?"":""}',
    \ }

    let g:lightline.component_function = {
      \ 'git_branch':  'LightLineGitaBranch',
      \ 'git_traffic': 'LightLineGitaTraffic',
      \ 'git_status':  'LightLineGitaStatus',
      \ 'git_gutter': 'LightLineGitGutter',
    \ }

    function! LightLineGitaBranch()
      return gita#statusline#format('%ln/%lb')
    endfunction

    function! LightLineGitaTraffic()
      return gita#statusline#preset('traffic_fancy')
    endfunction

    function! LightLineGitaStatus()
      return gita#statusline#preset('status')
    endfunction

    function! LightLineGitGutter()
      if ! exists('*GitGutterGetHunkSummary')
            \ || ! get(g:, 'gitgutter_enabled', 0)
            \ || winwidth('.') <= 90
        return ''
      endif
      let symbols = [
            \ g:gitgutter_sign_added,
            \ g:gitgutter_sign_modified,
            \ g:gitgutter_sign_removed
            \ ]
      let hunks = GitGutterGetHunkSummary()
      let ret = []
      for i in [0, 1, 2]
        if hunks[i] > 0
          call add(ret, symbols[i] . hunks[i])
        endif
      endfor
      return join(ret, ' ')
    endfunction
"}}}


" FZF {{{
  if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    let g:fzf_nvim_statusline = 1 " disable statusline overwritin
  endif

  " File preview using Highlight (http://www.andre-simon.de/doku/highlight/en/highlight.php)
  let g:fzf_files_options = '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'

  " Show hidden files and ignore errors
  let $FZF_DEFAULT_COMMAND = 'ag --silent --hidden --ignore .git -l -g ""'

  nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
  nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
  xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
  nnoremap <silent> <Leader>fb        :Buffers<CR>
  nnoremap <silent> <Leader><Enter>   :Buffers<CR>
  nnoremap <silent> <Leader>fc        :Colors<CR>
  nnoremap <silent> <Leader>ff        :Files<CR>
  nnoremap <silent> <Leader><Leader>  :Files<CR>
  nnoremap <silent> <Leader>fm        :Marks<CR>
  nnoremap <silent> <Leader>ft        :Filetypes<CR>
  nnoremap <silent> <Leader>fw        :Windows<CR>

  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  " Advanced customization using autoload functions
  inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"    command! Plugs call fzf#run({
"      \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
"      \ 'options': '--delimiter / --nth -1',
"      \ 'down':    '~40%',
"      \ 'sink':    'Explore' })
"
"
  function! s:fzf_statusline()
    " " Override statusline as you like
    " highlight fzf1 ctermfg=161 ctermbg=251
    " highlight fzf2 ctermfg=23 ctermbg=251
    " highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction

  autocmd! User FzfStatusLine call <SID>fzf_statusline()

  " Esc & jk should close the fzf buffer
  au FileType fzf tnoremap <nowait><buffer> <esc> <c-g>
  au FileType fzf tnoremap <nowait><buffer> jk <c-g>
"}}}


" Gita {{{
  nnoremap <silent> <leader>ga :Gita add<CR>
  nnoremap <silent> <leader>gB :Gita blame<CR>
  nnoremap <silent> <leader>gb :Gita branch<CR>
  nnoremap <silent> <leader>gM :Gita chaperone<CR>
  nnoremap <silent> <leader>gc :Gita checkout<CR>
  nnoremap <silent> <leader>gC :Gita commit<CR>
  nnoremap <silent> <leader>gd :Gita diff<CR>
  nnoremap <silent> <leader>gD :Gita diff-ls<CR>
  nnoremap <silent> <leader>gg :Gita grep<CR>
  nnoremap <silent> <leader>gl :Gita ls-files<CR>
  nnoremap <silent> <leader>gL :Gita ls-tree<CR>
  nnoremap <silent> <leader>gm :Gita merge<CR>
  nnoremap <silent> <leader>gp :Gita patch<CR>
  nnoremap <silent> <leader>gr :Gita rebase<CR>
  nnoremap <silent> <leader>gR :Gita reset<CR>
  nnoremap <silent> <leader>gs :Gita rm<CR>
  nnoremap <silent> <leader>gS :Gita show<CR>
  nnoremap <silent> <leader>gs :Gita status<CR>
"}}}


" Git Gutter {{{
  let g:gitgutter_sign_column_always=1
  let g:gitgutter_map_keys = 0
  let g:gitgutter_max_signs = 200
  let g:gitgutter_realtime = 1
  let g:gitgutter_eager = 1
  let g:gitgutter_sign_removed = '–'
  let g:gitgutter_diff_args = '--ignore-space-at-eol'

  nmap <silent> ]h :GitGutterNextHunk<CR>
  nmap <silent> [h :GitGutterPrevHunk<CR>

  nnoremap <silent> <Leader>gu :GitGutterRevertHunk<CR>
  nnoremap <silent> <Leader>gp :GitGutterPreviewHunk<CR><c-w>j
  nnoremap cog :GitGutterToggle<CR>
  nnoremap <Leader>gt :GitGutterAll<CR>
"}}}


" Miniyank {{{
  map <leader>n <Plug>(miniyank-cycle)
  map <leader>p <Plug>(miniyank-startput)
  map <leader>P <Plug>(miniyank-startPut)
"}}}


" NeoTerm {{{
  nnoremap <Leader>cx           :TREPLSendLine
  nnoremap <Leader>cX           :TREPLSendSelection
"}}}


" After Object {{{
  autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
"}}}


" Easy Align {{{
  " Start interactive EasyANlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. Sgaip)
  nmap ga <Plug>(EasyAlign)
"}}


" Sneak {{{
  nmap s <Plug>Sneak_s
  nmap S <Plug>Sneak_S
"}}}


" Terminal {{{
  tnoremap jk    <C-\><C-n>
  tnoremap <Esc> <C-\><C-n>
  autocmd TermOpen * setlocal statusline=%{b:term_title}
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
"}}}


" Local config {{{
  if filereadable(expand("~/.config/nvim/init.local.vim"))
    source ~/.config/nvim/init.local.vim
  endif
"}}}
