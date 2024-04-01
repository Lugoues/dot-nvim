(import-macros {: lazy-spec} :macros)
(import-macros {: exec!
                : set!
                : set+ } :hibiscus.vim)

(import-macros {: exec!
                : augroup! } :hibiscus.vim)

[(lazy-spec :echasnovski/mini.indentscope
            {:lazy false
             :opts {:symbol "│"}
             :init (fn [] (exec!
                            [hi! MiniIndentscopeSymbol guifg=#393939]
                            [hi! MiniIndentscopeSymbolOff guifg=#393939]))})
            ;; show intent lines
 (lazy-spec :echasnovski/mini.surround)
 (lazy-spec :echasnovski/mini.trailspace  ;; highlight and trim
   {:lazy false
     :config (fn []
               (let [mts (require :mini.trailspace)]
                 (augroup! :remove-whitespace
                   [[BufWritePre :desc "remove trailing whitespace"]
                    * #(mts.trim)
                    * #(mts.trim_last_lines)])))})]
