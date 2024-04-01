(import-macros {: set! : rem! } :hibiscus.vim)

; enable clipboard for macos or X11
(when (= (vim.fn.executable :pbcopy) 1)
  (set! clipboard :unnamedplus)
)

;; Encoding
(set! fileencoding "utf-8")
;; (set! fileformats ["unix" "dos" "mac"])

;; Formatting
(rem! formatoptions "c")
(rem! formatoptions "q")
(rem! formatoptions "r")

;; Show relative line numbers
(set! number true)
(set! relativenumber true)

;; Show characters
(set! list true)
;; (set! listchars "tab:»·trail:·nbsp:·") - this fails to compile?
(set! :showbreak  "↪")

;; Better colors
(set! termguicolors true)

;; Text
(set! guifont  "OperatorMono Nerd Font Book:h18")
(set! textwidth  0) ; disable auto break long lines


;; Indent
(set! expandtab  true)
(set! tabstop  2)
(set! softtabstop  2)
(set! shiftwidth  2)
(set! shiftround  true)
(set! autoindent  true)
(set! smartindent  true)
(set! smarttab  true)
(set! expandtab  true)


;; Make this faster
(set! updatetime 750)

;; Panels
(set! splitbelow true)
(set! splitright true)

;; Find
(set! infercase true)
(set! ignorecase  true)
(set! smartcase  true)
(set! showmatch true)
(set! hlsearch true) ; Highlight Search matches
(set! inccommand :split)

;; Scrolling
(set! scrolloff 8)
(set! sidescrolloff 8)


;; Enable title
;; (set! title)
;; (set! titlestring "%t%m")

;; ;; formatoptions = vim.o.formatoptions .. "-=t formatoptions-=c formatoptions-=q  formatoptions-=r"


(set! diffopt  "iwhite") ; Ignore whitepsace in diffs
(set! cursorline  true) ; Highlight current line
;; (set! filetype plugin indent on  " Enable plugins)))
(set! autoread true) ; Reload Changes to file
(set! hidden true); hide buffers instead of closing
(set! lazyredraw true) ; speed up on large files

;; (set! ; :viminfo "!hf1'100"
;; (set! ; vim.o.foldmethod = "indent"
;; (set! ; vim.o.nofoldenable = true
;; (set! diffopt  "fillervertical")
 ; override the "ignorecase" when there is uppercase letters
(set! gdefault  true) ; when on the :substitute flag "g" is default on



(set! wildignorecase true)
(set! wildmode "longest:list:full")
(set! wildmode "longest:list:full")
