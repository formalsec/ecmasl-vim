; Standard keywords
[ "let" "import" "typedef" "macro" "function" "extern" "lambda" ] @keyword

; Control Flow (often colored differently, like purple or red)
[
  "if" "else" "while" "foreach" "repeat" "until"
  "switch" "case" "default" "match" "with"
  "return" "throw" "catch" "fail" "assert"
] @keyword.control

; Types
[
  "any"
  "unknown"
  "never"
  "undefined"
  "null"
  "void"
  "int"
  "float"
  "string"
  "boolean"
  "symbol"
] @type.builtin

(type_target (identifier) @type)
; Typedef names are technically "definitions"
(tdef_target name: (identifier) @type.definition)
(typing_target (type_target (identifier) @type))


; Functions
(func_target name: (identifier) @function.method)
(macro_target name: (identifier) @function)
(call_expr_target function: (identifier) @function)
(call_expr_target function: (no_blocklike_expr_target (val_expr_target (val_target (string))))) @function

; Variables and Identifiers
(identifier) @variable
(gid) @variable.builtin

; Constants and Literals
(integer) @number
(float) @number
(string) @string
(boolean) @boolean
(symbol) @constant
"null" @constant
"None" @constant

; Operators and Delimiters
[
  ":="
  "="
  "->"
  "?"
  ":"
  "."
  "@"
  "#"
  "|"
] @operator

(unopt_target) @operator
(binopt_target) @operator

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  ","
  ";"
] @punctuation.delimiter

; Comments and Todo
(comment) @comment
((comment) @comment.todo (#match? @comment.todo "TODO|FIXME"))

; Special operators as functions (stdlib-like)
(unopt_target [
  "typeof"
  "int_to_float"
  "int_to_string"
  "float_to_int"
  "float_to_string"
  "string_to_int"
  "string_to_float"
  "obj_to_list"
  "obj_fields"
] @function.builtin)

(binopt_target "in_obj" @function.builtin)

; Mark the '@' in your custom call syntax
(exec_stmt_target "@" @function.macro)

; Function Parameters
; Added '.' (anchor) and field names for better accuracy
(func_params_target (identifier) @variable.parameter)
(typed_id_target (identifier) @variable.parameter)
(ctx_vars_target (identifier) @variable.parameter)

; Object properties (initialization and lookup)
(field_init_target (identifier) @property)
(lookup_target (identifier) @property)

; Labels or specific patterns
(match_discrm_target (identifier) @variable.parameter)
