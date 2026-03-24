; Keywords
[
  "let"
  "import"
  "typedef"
  "macro"
  "function"
  "print"
  "return"
  "delete"
  "extern"
  "lambda"
  "assert"
  "fail"
  "throw"
  "catch"
  "if"
  "else"
  "while"
  "foreach"
  "repeat"
  "until"
  "switch"
  "case"
  "default"
  "match"
  "with"
  "sigma"
] @keyword

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
] @type

(type_target (identifier) @type)
(tdef_target name: (identifier) @type)
(typing_target (type_target (identifier) @type))

; Functions
(func_target name: (identifier) @function)
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
