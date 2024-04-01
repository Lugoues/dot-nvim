(import-macros {: lazy-spec : lazy-spec } :macros)
(import-macros {: g! : color! : set+ } :hibiscus.vim)

[(lazy-spec :mnacamura/vim-fennel-syntax)
 (lazy-spec :baliestri/aura-theme
            {:lazy false
             :priority 9999})
;             :config (λ [p]
;                       (set+ rtp (.. p.dir "/packages/neovim"))
;                       (color! :aura-dark)})
 (lazy-spec :nyoom-engineering/oxocarbon.nvim
            {:lazy false
             :priority 9999
             :config (λ []
                      (color! :oxocarbon))})]
