(import-macros
  {: lazy-spec} :macros
  {: g!
   : color!
   : map! } :hibiscus.vim)

(lazy-spec :nvim-telescope/telescope.nvim
 {
;;  :opts {:defaults
;;          {:vimgrep_arguments ["rg" "--color=never" "--no-heading"
;;                             "--with-filename" "--line-number" "--column"
;;                             "--smart-case" "--hidden" "--follow"
;;                             "-g" "!.git/"]}}
   :dependencies [:nvim-lua/popup.nvim
                  :nvim-lua/plenary.nvim
                  :nvim-telescope/telescope-fzf-native.nvim]
   :config (λ []
            (map! [n] :<leader>ff "Telescope find_files hidden=true")
            (map! [n] :<leader>f- "Telescope file_browser")
            (map! [n] :<leader>fg "Telescope live_grep")
            (map! [n] :<leader>* "Telescope grep_string")
            (map! [n] :<leader>fb "Telescope buffers")
            (map! [n] :<leader>fH "Telescope help_tags")
            (map! [n] :<leader>fm "Telescope keymaps")
            (map! [n] :<leader>fM "Telescope marks")
            (map! [n] :<leader>fh "Telescope oldfiles")
            (map! [n] :<leader>ft "Telescope filetypes")
            (map! [n] :<leader>fc "Telescope commands")
            (map! [n] :<leader>fC "Telescope command_history")
            (map! [n] :<leader>fq "Telescope quickfix")
            (map! [n] :<leader>fl "Telescope loclist")
            (map! [n] :<leader>fsa "Telescope lsp_code_actions")
            (map! [n] :<leader>fsi "Telescope lsp_implementations")
            (map! [n] :<leader>fsr "Telescope lsp_references")
            (map! [n] :<leader>fsS "Telescope lsp_document_symbols")
            (map! [n] :<leader>fss "Telescope lsp_workspace_symbols"))})
