(import-macros {: lazy-spec} :macros)

; auto remove search highlight and rehighlight when using n or N
(lazy-spec :nvimdev/hlsearch.nvim
  {:lazy false
   :event :BufRead
   :config (λ []
            (let [hls (require :hlsearch)]
              (hls.setup)))})

