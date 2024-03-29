syn spell notoplevel

syn keyword eslValues PI MAX_VALUE MIN_VALUE None null undefined true false NaN Infinity
hi def link eslValues Constant

syn match eslNumber "\<[0-9]\+\>\|\<[0-9_]\+\>\|\<0[xX][0-9a-fA-F_]\+\>\|\<0[oO][0-7_]\+\>\|\<0[bB][10_]\+\>"
hi def link eslNumber Number

syn match eslFloat "\<[0-9]\+\.[0-9_]\+\([eE][-+]\=[0-9_]\+\)\=\>"
hi def link eslFloat Float

syn region eslString start=+"+ end=+"+ skip=+\\"+ contains=@Spell
hi def link eslString String

syn match eslIdentifier "[_a-z][a-zA-Z0-9_']*" contained
hi def link eslIdentifier Identifier

syn match eslKeychar "|"
hi def link eslKeychar Keyword

syn match eslSeparator "[,;]"
hi def link eslSeparator Delimiter

syn region eslParens   matchgroup=eslDelimiter start="(" end=")" contains=TOP,@Spell
syn region eslBrackets matchgroup=eslDelimiter start="\[" end="]" contains=TOP,@Spell
syn region eslBlock    matchgroup=eslDelimiter start="{" end="}" contains=TOP,@Spell
hi def link eslDelimiter Delimiter

syn region eslComment start="/\*" end="\*/"
      \ contains =
      \ eslComment,
      \ eslTodo,
      \ @Spell
hi def link eslComment Comment

syn keyword eslTodo TODO FIXME contained
hi def link eslTodo Todo

syn match eslTypeAnnotation ":\s*\zs\(\k\+\)"
hi def link eslTypeAnnotation Type

syn keyword eslConditional if else elif
hi def link eslConditional Conditional

syn keyword eslRepeat while foreach repeat until
hi def link eslRepeat Repeat

syn keyword eslLabel default switch case sdefault
hi def link eslLabel Label

syn keyword eslFunction function
hi def link eslFunction Structure

syn keyword eslKeyword return delete lambda assert
hi def link eslKeyword Keyword

syn keyword eslMatch match with
hi def link eslMatch Keyword

syn keyword eslException catch throw fail
hi def link eslException Exception

syn keyword eslMacro macro
hi def link eslMacro Macro

syn keyword eslImport import extern
hi def link eslImport Include

syn keyword eslStdlib parse_number parse_string octal_to_decimal hex_decode utf8_decode float_to_string float_of_string obj_to_list obj_fields to_int to_int32 to_uint32 to_uint16 from_char_code from_char_code_u to_char_code to_char_code_u to_lower_case to_upper_case trim abs acos asin atan atan2 ceil cos exp floor trunc log_e log_10 max min random sin sqrt tan in_obj in_list l_len l_nth l_add l_prepend l_concat l_remove_last l_sort l_reverse hd tl t_len t_nth fst snd s_split s_concat s_len s_len_u s_nth s_nth_u s_substr s_substr_u int_to_float int_to_string int_of_string int_of_float int_to_four_hex typeof gen_wrapper print :=
hi def link eslStdlib Operator
