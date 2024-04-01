(import-macros
 {: exec!} :hibiscus.vim
 {: lazy-spec
  : lazy-key} :macros)

[; Allows for horizontal navigation - f/F
 (lazy-spec :jinh0/eyeliner.nvim
            {:opts {:highlight_on_key false
                    :enabled true
                    :dim false}
             :init (fn []
                     (exec!
                       [hi! EyeLinerPrimary cterm=underline guisp=#0000ff gui=underline]
                       [hi! EyeLinerSecondary  cterm=underline  guisp=#78a8ff gui=underline]))})


 (lazy-spec :folke/flash.nvim {:event "VeryLazy"
                               :opts {:modes {:char {:jump_labels true}}
                                      (lazy-key "s"
                                                (λ [] (. (require :flash) :jump))
                                                {:desc "Flash"
                                                 :mode [:n :x :o]})

                                      (lazy-key "r"
                                                (λ [] (. (require :flash) :remote) (print "testing"))
                                                {:desc "Remote Flash"
                                                 :mode [:o]})

                                      (lazy-key "R"
                                                (λ [] (. (require :flash) :treesitter_search))
                                                {:desc "Treesitter Search"
                                                 :mode [:x :o]})

                                      (lazy-key "S"
                                                (λ [] (. (require :flash) :treesitter))
                                                {:desc "Flash Treesitter"
                                                  :mode [:n :x :o]})}})]


