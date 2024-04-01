(import-macros {: lazy-spec} :macros)

(lazy-spec :numToStr/Comment.nvim
  {:lazy false
   :config (λ []
            (let [cmt (require :Comment)]
              (cmt.setup)))})
