
;; Keywords
(("return"   @keyword) (#set! conceal ""))

(("local"    @keyword) (#set! conceal "~"))

(("if"       @keyword) (#set! conceal "?"))
(("else"     @keyword) (#set! conceal "!"))
(("elseif"   @keyword) (#set! conceal "¿"))
;; (("function" @keyword) (#set! conceal "ﬦ"))
(("function" @keyword) (#set! conceal ""))
(("for"      @keyword) (#set! conceal ""))

(("and"      @keyword) (#set! conceal "▼"))
(("end"      @keyword) (#set! conceal "–"))
(("then"     @keyword) (#set! conceal "↙"))
(("do"       @keyword) (#set! conceal ""))

(("comment_start"    @comment) (#set! conceal ""))

;; Function names
; ((function_call name: (identifier) @TSFuncBuiltin (#eq? @TSFuncBuiltin "require")) (#set! conceal ""))
; ((function_call name: (identifier) @TSFunction (#eq? @TSFunction "map")) (#set! conceal ""))

;; table.
((dot_index_expression table: (identifier) @keyword  (#eq? @keyword  "math" )) (#set! conceal ""))

;; break_statement
(((break_statement) @keyword) (#set! conceal "ﰈ"))

;; vim.*
(
    (dot_index_expression) @function
    (#eq? @function  "vim.api.nvim_create_autocmd" )
    ; (#set! conceal "a")
    ; (#set! conceal "🪝")
    (#set! conceal "ﯠ")
)
(((dot_index_expression) @field (#eq? @field "vim.cmd"     )) (#set! conceal ""))
(((dot_index_expression) @field (#eq? @field "vim.keymap.set")) (#set! conceal ""))
