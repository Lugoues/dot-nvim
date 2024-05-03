(import-macros {: lazy-spec} :macros)

(lazy-spec :lewis6991/gitsigns.nvim
  {:lazy false
   :config (λ []
            (let [gitsigns (require :gitsigns)]
              (gitsigns.setup)))})
