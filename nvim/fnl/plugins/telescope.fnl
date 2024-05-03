(import-macros
  {: lazy-spec} :macros
  {: g!
   : color!
   : exec!
   : map! } :hibiscus.vim)

[
 ; (lazy-spec :nvim-telescope/telescope-fzf-native.nvim
 ;            {:priority 999
 ;             :build "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
 ;             :dependencies [:nvim-telescope/telescope.nvim]
 ;             :opts {}
 ;             :config (λ [_ opts]
 ;                        (let [tlscp (require :telescope)]
 ;                             (tlscp.setup opts)
 ;                             (tlscp.load_extension "fzf")))})

 (lazy-spec :debugloop/telescope-undo.nvim
            {:dependencies [:nvim-telescope/telescope.nvim]
             :opts {:extensions {:undo {:use_delta true
                                        :diff_context_lines 10
                                        :side_by_side true
                                        :layout_strategy :vertical
                                        :layout_config {:preview_height 0.8}}}}
             :config (λ [_ opts]
                        (let [tlscp (require :telescope)]
                             (tlscp.setup opts)
                             (tlscp.load_extension "undo")))})


 (lazy-spec :nvim-telescope/telescope.nvim
            {:tag "0.1.6"
             :dependencies [:nvim-lua/popup.nvim
                            :nvim-lua/plenary.nvim
                            :nvim-tree/nvim-web-devicons]})]
             ; :config (λ [_ opts])})]
                      ; (let [tlscp (require :telescope)
                      ;       oxocarbon (require :oxocarbon)]
                      ;   (tlscp.setup opts)
                      ;   (exec!
                      ;      [hi! TelescopeBorder guifg=oxocarbon.blend guibg=oxocarbon.blend]
                      ;      [hi! TelescopePromptBorder guifg=oxocarbon.base02 guibg=oxocarbon.base02]
                      ;      [hi! TelescopePromptNormal guifg=oxocarbon.base05 guibg=oxocarbon.base02]
                      ;      [hi! TelescopePromptPrefix guifg=oxocarbon.base08 guibg=oxocarbon.base02]
                      ;      [hi! TelescopeNormal guifg=oxocarbon.none guibg=oxocarbon.blend]
                      ;      [hi! TelescopePreviewTitle guifg=oxocarbon.base02 guibg=oxocarbon.base12]
                      ;      [hi! TelescopePromptTitle guifg=oxocarbon.base02 guibg=oxocarbon.base11]
                      ;      [hi! TelescopeResultsTitle guifg=oxocarbon.blend guibg=oxocarbon.blend])))})]
                      ;
