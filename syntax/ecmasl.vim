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
syn region eslString start=+"+ end=+"+ skip=+\\"+ contains=@Spell
syn keyword eslConditional if else elif
syn keyword eslRepeat while foreach repeat until
syn keyword eslLabel default switch case sdefault
syn keyword eslFunction function
syn keyword eslKeyword return delete lambda assert 
syn keyword eslMatch match with
syn keyword eslException catch throw fail
syn keyword eslMacro macro
syn keyword eslImport import extern
syn match eslIdentifier "[_a-z][a-zA-Z0-9_']*" contained
syn region eslParens matchgroup=eslDelimiter start="(" end=")" contains=TOP,@Spell
syn region eslBrackets matchgroup=eslDelimiter start="\[" end="]" contains=TOP,@Spell
syn region eslBlock matchgroup=eslDelimiter start="{" end="}" contains=TOP,@Spell
syn match eslKeychar "|"
syn keyword eslStdlib parse_number parse_string octal_to_decimal hex_decode utf8_decode float_to_string float_of_string obj_to_list obj_fields to_int to_int32 to_uint32 to_uint16 from_char_code from_char_code_u to_char_code to_char_code_u to_lower_case to_upper_case trim abs acos asin atan atan2 ceil cos exp floor log_e log_10 max min random sin sqrt tan in_obj in_list l_len l_nth l_add l_prepend l_concat l_remove_last l_sort l_reverse hd tl t_len t_nth fst snd s_split s_concat s_len s_len_u s_nth s_nth_u s_substr s_substr_u int_to_float int_to_string int_of_string int_of_float int_to_four_hex typeof gen_wrapper print "=" "!"

hidef link eslMacro Macro
hi def link eslImport Include
hi def link eslValues Constant
hi def link eslNumber Number
hi def link eslFloat Float
hi def link eslComment Comment
hi def link eslTodo Todo
hi def link eslString String
hi def link eslConditional Conditional
hi def link eslRepeat Repeat
hi def link eslLabel Label
hi def link eslKeyword Keyword
hi def link eslMatch Keyword
hi def link eslKeychar Keyword
hi def link eslException Exeption
hi def link eslSeparator Delimiter
hi def link eslDelimiter Delimiter
hi def link eslOperatos Operator
hi def link eslStdlib Operator
hi def link eslFunction Structure
hi def link eslIdentifier Identifier
