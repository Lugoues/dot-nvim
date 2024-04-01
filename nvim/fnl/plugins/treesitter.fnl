
 (import-macros {: lazy-spec} :macros)

 (let [filetypes [:bash
                  :c_sharp
                  :clojure
                  :comment
                  :commonlisp
                  :dockerfile
                  :dot
                  :elixir
                  :erlang
                  :fennel
                  :gitignore
                  :gleam
                  :go
                  :gomod
                  :gowork
                  :json
                  :lua
                  :markdown
                  :norg
                  :proto
                  :pug
                  :python
                  :regex
                  :rust
                  :toml
                  :typescript
                  :yaml]]

  (lazy-spec :nvim-treesitter/nvim-treesitter
               {:build ":TSUpdate"
                :opts {:auto_install true
                          :ensure_installed filetypes
                           :highlight {:enable true}
                           :rainbow {:enable true
                                     :extended_mode true}
                           :context_commentstring {:enable true
                                                   :config {:fennel ";; %s"}}
                           :indent {:enable true}
                          :playground {:enable true}}}))
