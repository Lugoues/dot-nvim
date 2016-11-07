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
"Plug 'jceb/vim-orgmode'
Plug 'kassio/neoterm' " Resuse existing terminal

Plug 'justinmk/vim-dirvish'              " File Explorer

" GUI Tweaks {{{
  Plug 'justinmk/vim-sneak'
  Plug 'machakann/vim-highlightedyank'     " Show highlighted area around what wvis yanked
  Plug 'itchyny/lightline.vim'             " StatusBar
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
"}}}

" Git {{{
  Plug 'lambdalisue/vim-gita'       " Git commands
  Plug 'airblade/vim-gitgutter'     " Add git gutter ala sublime
  Plug 'lambdalisue/vim-gista'      " Gist support
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
"}}}

" Clojure {{{
"  Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['clojure'] }
"  Plug 'tpope/vim-fireplace, { 'for': ['clojure'] }'
"  Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
"  Plug 'guns/vim-clojure-highlight', { 'for': ['clojure'] }
"  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': ['clojure'] }
"  Plug 'guns/vim-sexp', { 'for': ['clojure'] }
"  Plug 'kassio/neoterm'
"  Plug 'hkupty/acid.nvim', { 'for': ['clojure'] } "Not ready yet
"  Plug 'kovisoft/paredit', { 'for': ['clojure'] }
"}}}

" Python {{{
  Plug 'hdima/python-syntax'
" }}}


" Load Local Plugins {{{
  if filereadable(expand("~/.config/nvim/vimrc.bundles.local"))
    source ~/.config/nvim/vimrc.bundles.local
  endif
"}}}

call plug#end()
