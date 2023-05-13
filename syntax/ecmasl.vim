syn spell notoplevel

syn match eslSeparator "[,;]"
syn match eslNumber "\<[0-9]\+\>\|\<[0-9_]\+\>\|\<0[xX][0-9a-fA-F_]\+\>\|\<0[oO][0-7_]\+\>\|\<0[bB][10_]\+\>"
syn match eslFloat "\<[0-9]\+\.[0-9_]\+\([eE][-+]\=[0-9_]\+\)\=\>"
syn keyword eslValues PI MAX_VALUE MIN_VALUE None null undefined true false NaN Infinity
syn region eslComment start="/\*" end="\*/"
      \ contains =
      \ eslComment,
      \ eslTodo,
      \ @Spell
syn keyword eslTodo TODO FIXME contained
syn region eslString start=+"+ end=+"+ skip=+\\"+
syn keyword eslConditional if else elif
syn keyword eslRepeat while foreach repeat until
syn keyword eslLabel default switch case sdefault
syn keyword eslFunction function
syn keyword eslKeyword return delete lambda assert 
syn keyword eslMatch match with
syn keyword eslException catch throw fail
syn keyword eslMacro macro
syn keyword eslImport import extern
syn match eslQuote "\<'\+" contained
syn region haskellQuoted start="\<'\+" end="\>"
      \ contains=
      \ eslOperators,
      \ eslIdentifier
syn match eslIdentifier "[_a-z][a-zA-Z0-9_']*" contained
syn region eslParens matchgroup=eslDelimiter start="(" end=")" contains=TOP,@Spell
syn region eslBrackets matchgroup=eslDelimiter start="\[" end="]" contains=TOP,@Spell
syn region eslBlock matchgroup=eslDelimiter start="{" end="}" contains=TOP,@Spell
syn match eslOperators "[-!#$%&\*\+/<=>\?@\\^|~:.]\+\|\<_\>"
syn keyword eslStdlib parse_number parse_string octal_to_decimal hex_decode utf8_decode float_to_string float_of_string obj_to_list obj_fields to_int to_int32 to_uint32 to_uint16 from_char_code from_char_code_u to_char_code to_char_code_u to_lower_case to_upper_case trim abs acos asin atan atan2 ceil cos exp floor log_e log_10 max min random sin sqrt tan in_obj in_list l_len l_nth l_add l_prepend l_concat l_remove_last l_sort l_reverse hd tl t_len t_nth fst snd s_split s_concat s_len s_len_u s_nth s_nth_u s_substr s_substr_u int_to_float int_to_string int_of_string int_of_float int_to_four_hex typeof gen_wrapper print "=" "!"

highlight def link eslMacro Macro
highlight def link eslImport Include
highlight def link eslValues Constant
highlight def link eslNumber Number
highlight def link eslFloat Float
highlight def link eslComment Comment
highlight def link eslTodo Todo
highlight def link eslString String
highlight def link eslConditional Conditional
highlight def link eslRepeat Repeat
highlight def link eslLabel Label
highlight def link eslKeyword Keyword
highlight def link eslMatch Keyword
highlight def link eslException Exeption
highlight def link eslSeparator Delimiter
highlight def link eslDelimiter Delimiter
highlight def link eslQuote Operator
highlight def link eslQuoted Operator
highlight def link eslOperatos Operator
highlight def link eslStdlib Operator
highlight def link eslFunction Structure
highlight def link eslIdentifier Identifier
