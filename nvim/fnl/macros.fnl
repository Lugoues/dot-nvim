;(local {: str? : nil?} (require :utils))


(lambda lazy-key [lhs rhs ?options]
  (let [options (or ?options {})]
    (doto options
      (tset 1 lhs)
      (tset 2 rhs))))

;(lambda lazy-spec [identifier ...]
;  "Helper for Lazy to work around mixed tables in Fennel"
;  {1 identifier ...})
 ; (let [options (pack (do ,...))]
  ;  (doto options (tset 1 idetifier)))))
 ; (let [options (pack (do ,...))]))
;     (doto options (tset 1 identifier))))

;#(pack# (do ,...))

(lambda lazy-spec [identifier ?options]
  "Helper for Lazy to work around mixed tables in Fennel"
  (let [options (or ?options {})]
    (doto options (tset 1 identifier))))

(lambda deepcopy [obj ?seen]
 (when (not= (type obj) :table) (lua "return obj"))
 (when (and ?seen (. ?seen obj))
   (let [___antifnl_rtn_1___ (. ?seen obj)]
     (lua "return ___antifnl_rtn_1___")))
 (let [s (or ?seen {})
       res {}]
  (tset s obj res)
  (each [k v (pairs obj)] (tset res (deepcopy k s) (deepcopy v s)))
  (setmetatable res (getmetatable obj))))

{: lazy-spec
 : lazy-key
 : deepcopy}
