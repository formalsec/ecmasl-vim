syn region Comment  start="/\*"  end="\*/"
syn region String   start=+"+    end=+"+         skip=+\\"+

syn keyword Operator parse_number parse_string octal_to_decimal hex_decode utf8_decode float_to_string float_of_string obj_to_list obj_fields to_int to_int32 to_uint32 to_uint16 from_char_code from_char_code_u to_char_code to_char_code_u to_lower_case to_upper_case trim abs acos asin atan atan2 ceil cos exp floor log_e log_10 max min random sin sqrt tan in_obj in_list l_len l_nth l_add l_prepend l_concat l_remove_last l_sort l_reverse hd tl t_len t_nth fst snd s_split s_concat s_len s_len_u s_nth s_nth_u s_substr s_substr_u int_to_float int_to_string int_of_string int_of_float int_to_four_hex typeof gen_wrapper print "=" "!"
syn keyword Conditional if else elif assert 
syn keyword Repeat while foreach repeat until
syn keyword Label default switch case sdefault
syn keyword Keyword function return delete match with lambda
syn keyword Exception catch throw fail
syn keyword Macro macro
syn keyword Include import extern
syn keyword Constant PI MAX_VALUE MIN_VALUE None 'null null 'undefined undefined true false NaN Infinity
