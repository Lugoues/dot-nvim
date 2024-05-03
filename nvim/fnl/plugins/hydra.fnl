(import-macros {: lazy-spec} :macros
               {: exec!
                : set!
                : b! } :hibiscus.vim)

(lambda hint [lines]
  (table.concat lines "\n"))

(lazy-spec :nvimtools/hydra.nvim
  {:dependencies [:nvim-telescope/telescope.nvim]

   :config (λ []
            (let [hydra (require :hydra)
                  {: cmd } (require :hydra.keymap-util)]
             (hydra {:name "Telescope"
                     :hint (hint ["_f_: files       _m_: marks"
                                  "_o_: old files   _g_: live grep"
                                  "_p_: projects    _/_: search in file"
                                  "_b_: buffers"
                                  "                                     "
                                  "_r_: resume      _u_: undotree       "
                                  "_h_: vim help    _c_: execute command"
                                  "_k_: keymaps     _;_: commands history"
                                  "_O_: options     _?_: search history"
                                  "                                      "
                                  "_<Enter>_: Telescope           _<Esc>_"])
                     :config {
                              ; :buffer true
                               :color "teal"
                               :invoke_on_body true
                               :hint {
                                       :position "middle"}}
                     :mode "n"
                     :body "<Leader>f"
                     :heads [["b" (cmd "Telescope buffers")]
                             ["f" (cmd "Telescope find_files hidden=true")]
                             ["g" (cmd "Telescope live_grep")]
                             ["o" (cmd "Telescope oldfiles") {:desc "recently opened files"}]
                             ["h" (cmd "Telescope help_tags") {:desc "vim help"}]
                             ["m" (cmd "MarksListBuf") {:desc "marks"}]
                             ["k" (cmd "Telescope keymaps")]
                             ["O" (cmd "Telescope vim_options")]
                             ["r" (cmd "Telescope resume")]
                             ["p" (cmd "Telescope projects") {:desc "projects"}]
                             ["/" (cmd "Telescope current_buffer_fuzzy_find") {:desc "search in file"}]
                             ["?" (cmd "Telescope search_history")  {:desc "search history"}]
                             [";" (cmd "Telescope command_history") {:desc "command-line history"}]
                             ["c" (cmd "Telescope commands") {:desc "execute command"}]
                             ; ["u" (cmd "silent! %foldopen! | UndotreeToggle") {:desc "undotree"}]
                             ["u" (cmd "Telescope undo") {:desc "undotree"}]
                             ["<Enter>" (cmd "Telescope") {:exit true :desc "list all pickers"}]
                             ["<Esc>" nil {:exit true :nowait true}]]}))
            (let [hydra (require :hydra)
                  {: cmd } (require :hydra.keymap-util)
                  gitsigns (require :gitsigns)
                  bufnr (vim.api.nvim_get_current_buf)]
              (hydra {:name "Git"
                      :hint (hint ["_S_: prev hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line"
                                   "_R_: next hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full"
                                   "^ ^              _X_: stage buffer      ^ ^                 _/_: show base file"
                                   "^"
                                   "^ ^              _<Enter>_: Neogit      _q_: exit)"])
                      :config {:buffer bufnr
                               :color "pink"
                               :invoke_on_body true
                               ; :hint {:border "rounded"}
                               :on_enter (λ []
                                           (let [bufnr (vim.api.nvim_get_current_buf)]
                                             (exec!
                                                [mkview]
                                                [silent! %foldopen!])
                                             (= vim.bo.modifiable false)
                                             (gitsigns.toggle_signs true)
                                             (gitsigns.toggle_linehl true)))
                               :on_exit (λ []
                                          (let [cursor-pos (vim.api.nvim_win_get_cursor 0)]
                                            (exec! [loadview])
                                            (vim.api.nvim_win_set_cursor 0 cursor-pos)
                                            (exec! [normal zv])
                                            (gitsigns.toggle_signs false)
                                            (gitsigns.toggle_linehl false)
                                            (gitsigns.toggle_deleted false)))}
                      :mode ["n" "x"]
                      :body "<Leader>g"
                      :heads [["R" (λ []
                                      (if vim.wo.diff
                                        "]c"
                                        (do
                                           (vim.schedule #(gitsigns.next_hunk))
                                           "<Ignore>"))
                                     {:expr true
                                          :desc "next hunk"})]
                              ["S" (λ []
                                      (if vim.wo.diff
                                        "[c"
                                        (do
                                          (vim.schedule #(gitsigns.prev_hunk))
                                          "<Ignore>")))
                                   {:expr true
                                    :desc "prev hunk"}]
                              ["s" (cmd "Gitsigns stage_hunk")
                                   {:silent true
                                    :desc "stage hunk"}]
                              ["u" gitsigns.undo_stage_hunk
                                   {:desc "undo last stage"}]
                              ["X" gitsigns.stage_buffer
                                    {:desc "stage buffer"}]
                              ["p" gitsigns.preview_hunk
                                    {:desc "preview hunk"}]
                              ["d" gitsigns.toggle_deleted
                                    {:nowait true
                                     :desc "toggle deleted"}]
                              ["b" gitsigns.blame_line
                                    {:desc "blame"}]
                              ["B" #((gitsigns.blame_line)
                                     {:full true
                                      :desc "blame show full"})]
                              ["/" gitsigns.show
                                   {:exit true
                                    :desc "show base file"}]
                              ["<Enter>" (cmd "Neogit")
                                         {:exit true
                                          :desc "Neogit"}]
                              ["q" nil
                                   {:exit true
                                    :desc "exit"}]]})))})



                                  ; (map! [n] :<leader>f- "Telescope file_browser")
                                  ; (map! [n] :<leader>* "Telescope grep_string")
                                  ; (map! [n] :<leader>fH "Telescope help_tags")
                                  ; (map! [n] :<leader>fm "Telescope keymaps")
                                  ; (map! [n] :<leader>ft "Telescope filetypes")
                                  ; (map! [n] :<leader>fc "Telescope commands")
                                  ; (map! [n] :<leader>fC "Telescope command_history")
                                  ; (map! [n] :<leader>fq "Telescope quickfix")
                                  ; (map! [n] :<leader>fl "Telescope loclist")
                                  ; (map! [n] :<leader>fsa "Telescope lsp_code_actions")
                                  ; (map! [n] :<leader>fsi "Telescope lsp_implementations")
                                  ; (map! [n] :<leader>fsr "Telescope lsp_references")
                                  ; (map! [n] :<leader>fsS "Telescope lsp_document_symbols")
                                  ; (map! [n] :<leader>fss "Telescope lsp_workspace_symbols"))})]
