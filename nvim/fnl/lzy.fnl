 (import-macros {: lazy-spec} :macros)

 (let [(ok? lazy) (pcall require :lazy)]
  (when ok?
    (lazy.setup {
                 :lockfile (.. (vim.fn.stdpath "config") "/lazy-lock.json")
                 :spec [
                        (lazy-spec :udayvir-singh/tangerine.nvim
                          {:lazy false :priority 10001})
                        (lazy-spec :udayvir-singh/hibiscus.nvim
                          {:lazy false :priority 10000})
                        :nvim-lua/popup.nvim
                        :nvim-lua/plenary.nvim
                        :nvim-telescope/telescope-fzf-native.nvim
                        {:import "plugins"}]
                 :performance {
                               :reset_packpath false
                               :rtp { :reset true
                                     :paths [(.. (vim.fn.stdpath "data") "/tangerine")]}}})))



;; Maybes
;; https://github.com/cbochs/portal.nvim
;; https://github.com/danielfalk/smart-open.nvim
;https://github.com/stevearc/oil.nvim
; https://github.com/lewis6991/satellite.nvim
; https://github.com/utilyre/barbecue.nvim
  ;https://github.com/renerocksai/telekasten.nvim



;; Navigators
;
;
