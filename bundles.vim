" BUNDLE
" Automatically download vim-plug if it doesn't exist
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')

"Plug 'drmikehenry/vim-fixkey'      " maps alt to meta
"Plug 'tpope/vim-eunuch'            " *nix Commands
Plug 'jceb/vim-orgmode'

" GUI Tweaks {{{
  Plug 'kassio/neoterm'                " Resuse existing terminal
  Plug 'justinmk/vim-dirvish'          " File Explorer
  Plug 'machakann/vim-highlightedyank' " Show highlighted area around what was yanked
  Plug 'itchyny/lightline.vim'         " StatusBar
"}}}

" Navigation {{{
  Plug 'justinmk/vim-sneak'          " Adds a [s]neak motion
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
"}}}

" Text Manipulation {{{
  Plug 'bfredl/nvim-miniyank'        " killring-alike plugin
  Plug 'christoomey/vim-sort-motion' " Adds a [s]ort verb
  Plug 'junegunn/vim-after-object'   " Adds an [a]fter verb
  Plug 'junegunn/vim-easy-align'     " Adds [ga] verb to align
  Plug 'tpope/vim-commentary'        " Adds [gcc] comment line and [gc] comment verb
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'          " Adds [s]urround verb
  Plug 'wincent/ferret'              " Add find/replace functionality
  Plug 'justinmk/vim-sneak'          " alternative to f.
  Plug 'svermeulen/vim-easyclip'     " Better Clipboard
"}}}

" Git {{{
  Plug 'lambdalisue/vim-gita'       " Git commands
  Plug 'airblade/vim-gitgutter'     " Add git gutter ala sublime
  Plug 'lambdalisue/vim-gista'      " Gist support
  Plug 'chrisbra/vim-diff-enhanced' " Use git's paitence algorithm when diffing
"}}}

" Colors {{{
  Plug 'chriskempson/base16-vim'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'tomasr/molokai'
"}}}

"Syntax {{{
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'glench/vim-jinja2-syntax'
  Plug 'avakhov/vim-yaml'
"}}}

" Misc Languages {{{
  Plug 'scrooloose/syntastic'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " Async completion framework
  Plug 'neomake/neomake'
  Plug 'hkupty/iron.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim.
"}}}

" Clojure {{{
  Plug 'clojure-vim/async-clj-omni'
  Plug 'hkupty/acid.nvim'
"  Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['clojure'] }
"  Plug 'tpope/vim-fireplace, { 'for': ['clojure'] }'
"  Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
"  Plug 'guns/vim-clojure-highlight', { 'for': ['clojure'] }
"  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure'] }
"  Plug 'guns/vim-sexp', { 'for': ['clojure'] }
"  Plug 'kovisoft/paredit', { 'for': ['clojure'] }
"}}}

" Python {{{
  Plug 'hdima/python-syntax'
  Plug 'zchee/deoplete-jedi' " Autocomplete
"}}}


" Load Local Plugins {{{
  if filereadable(expand("~/.config/nvim/vimrc.bundles.local"))
    source ~/.config/nvim/vimrc.bundles.local
  endif
"}}}

call plug#end()
