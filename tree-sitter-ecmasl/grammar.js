module.exports = grammar({
  name: 'ecmasl',

  extras: $ => [
    /\s/,
    $.comment,
  ],

  conflicts: $ => [
    [$.type_target, $.no_blocklike_expr_target],
    [$.type_target, $.var_expr_target],
    [$.type_target, $.call_expr_target],
    [$.type_target, $.op_expr_target],
    [$.type_target, $.val_expr_target],
    [$.type_target, $.expr_target],
    [$.union_type_target, $.binopt_target],
    [$.tuple_type_target, $.binopt_target],
    [$.iteration_stmt_target],
    [$.selection_stmt_target],
    [$.match_cases_target],
  ],

  word: $ => $.identifier,

  rules: {
    prog_target: $ => seq(
      repeat($.import_target),
      repeat($.prog_element_target)
    ),

    prog_element_target: $ => choice(
      $.tdef_target,
      $.macro_target,
      $.func_target
    ),

    import_target: $ => seq(
      'import',
      choice($.string, $.identifier),
      ';'
    ),

    tdef_target: $ => seq(
      'typedef',
      field('name', $.identifier),
      ':=',
      field('type', $.type_target),
      ';'
    ),

    macro_target: $ => seq(
      'macro',
      field('name', $.identifier),
      $.func_params_target,
      $.block_stmt_target
    ),

    func_target: $ => seq(
      'function',
      field('name', $.identifier),
      $.func_tparams_target,
      optional($.typing_target),
      $.block_stmt_target
    ),

    stmt_target: $ => choice(
      $.aux_stmt_target,
      seq($.expr_stmt_target, ';'),
      seq($.exec_stmt_target, ';'),
      seq($.update_stmt_target, ';'),
      $.block_stmt_target,
      $.selection_stmt_target,
      $.iteration_stmt_target
    ),

    aux_stmt_target: $ => seq('#', $.stmt_target),

    expr_stmt_target: $ => $.no_blocklike_expr_target,

    exec_stmt_target: $ => choice(
      seq('print', $.expr_target),
      seq('return', optional($.expr_target)),
      seq('assert', $.expr_target),
      seq('fail', $.expr_target),
      seq('throw', $.expr_target),
      seq('@', $.identifier, $.call_args_target)
    ),

    update_stmt_target: $ => choice(
      seq('let', field('variable', $.identifier), '=', $.expr_target),
      seq(field('variable', $.identifier), ':=', $.expr_target),
      seq(field('variable', $.gid), ':=', $.expr_target),
      seq($.no_blocklike_expr_target, $.lookup_target, ':=', $.expr_target),
      seq('delete', $.expr_target, $.lookup_target),
      seq(
        field('variable', $.identifier),
        ':=',
        'lambda',
        $.func_params_target,
        $.ctx_vars_target,
        $.block_stmt_target
      )
    ),

    block_stmt_target: $ => choice(
      ';',
      seq('{', repeat($.stmt_target), '}')
    ),

    selection_stmt_target: $ => choice(
      prec.dynamic(2, seq('if', $.guard_target, $.stmt_target)),
      prec.dynamic(3, seq('if', $.guard_target, $.stmt_target, 'else', $.stmt_target)),
      seq('switch', $.guard_target, '{', repeat($.switch_case_target), optional($.switch_default_target), '}'),
      seq('match', $.expr_target, optional($.match_discrm_target), 'with', $.match_cases_target)
    ),

    iteration_stmt_target: $ => choice(
      seq('while', $.guard_target, $.stmt_target),
      seq('foreach', '(', $.identifier, ':', $.expr_target, ')', $.stmt_target),
      prec.dynamic(2, seq('repeat', $.stmt_target)),
      prec.dynamic(3, seq('repeat', $.stmt_target, 'until', $.guard_target, ';'))
    ),

    guard_target: $ => seq('(', $.expr_target, ')'),

    switch_case_target: $ => seq('case', $.expr_target, ':', $.stmt_target),

    switch_default_target: $ => seq('default', ':', $.stmt_target),

    match_discrm_target: $ => seq(':', $.identifier),

    match_cases_target: $ => repeat1($.match_case_target),

    match_case_target: $ => seq('|', $.pattern_target, '->', $.stmt_target),

    pattern_target: $ => choice(
      seq('{', sepBy1(',', $.pattern_binding_target), '}'),
      'default'
    ),

    pattern_binding_target: $ => seq(
      choice($.identifier, $.string),
      ':',
      $.pattern_value_target
    ),

    pattern_value_target: $ => choice(
      $.identifier,
      $.val_target,
      seq('[', ']'),
      'None'
    ),

    expr_target: $ => choice(
      $.no_blocklike_expr_target,
      $.obj_expr_target
    ),

    no_blocklike_expr_target: $ => choice(
      seq('(', $.expr_target, ')'),
      $.val_expr_target,
      $.var_expr_target,
      $.op_expr_target,
      $.call_expr_target
    ),

    val_expr_target: $ => $.val_target,

    var_expr_target: $ => choice(
      $.identifier,
      $.gid,
      prec.left(10, seq($.no_blocklike_expr_target, $.lookup_target))
    ),

    op_expr_target: $ => choice(
      prec(9, seq($.unopt_target, $.expr_target)),
      prec.left(1, seq($.no_blocklike_expr_target, $.binopt_target, $.expr_target)),
      prec.right(2, seq($.no_blocklike_expr_target, '?', $.expr_target, ':', $.expr_target)),
      seq('[', sepBy(',', $.expr_target), ']')
    ),

    call_expr_target: $ => choice(
      seq(field('function', $.identifier), $.call_args_target, optional($.catch_target)),
      seq('{', field('function', $.no_blocklike_expr_target), '}', $.call_args_target, optional($.catch_target)),
      seq('extern', field('function', $.identifier), $.call_args_target),
      seq('{', field('function', $.no_blocklike_expr_target), '}', '@', $.call_args_target)
    ),

    obj_expr_target: $ => seq('{', sepBy(',', $.field_init_target), '}'),

    func_tparams_target: $ => seq('(', sepBy(',', $.typed_id_target), ')'),

    func_params_target: $ => seq('(', sepBy(',', $.identifier), ')'),

    ctx_vars_target: $ => seq('[', sepBy(',', $.identifier), ']'),

    call_args_target: $ => seq('(', sepBy(',', $.expr_target), ')'),

    field_init_target: $ => seq(
      choice($.identifier, $.string),
      ':',
      $.expr_target
    ),

    lookup_target: $ => choice(
      seq('.', $.identifier),
      seq('[', $.expr_target, ']')
    ),

    catch_target: $ => seq('catch', $.identifier),

    identifier: $ => token(seq(/[a-zA-Z_][a-zA-Z0-9_]*/, repeat("'"))),

    gid: $ => token(seq('|', /[a-zA-Z_][a-zA-Z0-9_]*/, repeat("'"), '|')),

    val_target: $ => choice(
      $.integer,
      $.float,
      $.string,
      $.boolean,
      $.symbol,
      'null'
    ),

    integer: $ => choice(
      /-?[0-9]+/,
      /0x[0-9a-fA-F]+/
    ),

    float: $ => token(choice(
      /[0-9]+\.[0-9]*([eE][-+][0-9]+)?/,
      /\.[0-9]+([eE][-+][0-9]+)?/
    )),

    string: $ => seq(
      '"',
      repeat(choice(
        /[^"\\\n]+/,
        $.escape_sequence
      )),
      '"'
    ),

    escape_sequence: $ => choice(
      /\\[\\bnrt0vf"]/,
      /\\x[0-9a-fA-F]{2}/,
      /\\u\{[0-9a-fA-F]{4,6}\}/
    ),

    boolean: $ => choice('true', 'false'),

    symbol: $ => token(seq("'", choice(/[a-zA-Z_][a-zA-Z0-9_]*/, /-?[0-9]+/))),

    unopt_target: $ => choice(
      '-', '~', '!', 'hd', 'tl', 'typeof',
      'int_to_float', 'int_to_string', 'float_to_int', 'float_to_string',
      'string_to_int', 'string_to_float', 'obj_to_list', 'obj_fields'
    ),

    binopt_target: $ => choice(
      '+', '-', '*', '/', '%', '**', '&', '|', '^', '<<', '>>', '>>>',
      '&&', '||', '&&&', '|||', '==', '!=', '<', '>', '<=', '>=', 'in_obj'
    ),

    typed_id_target: $ => seq($.identifier, optional($.typing_target)),

    typing_target: $ => seq(':', $.type_target),

    type_target: $ => choice(
      seq('(', $.type_target, ')'),
      'any', 'unknown', 'never', 'undefined', 'null', 'void',
      'int', 'float', 'string', 'boolean', 'symbol',
      $.literal_type_target,
      $.object_type_target,
      prec(10, seq($.type_target, '[', ']')),
      $.tuple_type_target,
      $.union_type_target,
      $.sigma_type_target,
      $.identifier
    ),

    literal_type_target: $ => choice(
      $.integer,
      $.float,
      $.string,
      $.boolean,
      $.symbol
    ),

    object_type_target: $ => seq('{', sepBy(',', $.object_type_prop_target), '}'),

    object_type_prop_target: $ => seq(
      choice($.identifier, '*'),
      optional('?'),
      ':',
      $.type_target
    ),

    tuple_type_target: $ => prec.left(1, seq($.type_target, '*', $.type_target)),

    union_type_target: $ => prec.left(1, seq($.type_target, '|', $.type_target)),

    sigma_type_target: $ => seq(
      'sigma',
      '[',
      $.identifier,
      ']',
      optional('|'),
      $.type_target
    ),

    comment: $ => choice(
      seq('//', /.*/),
      seq(
        '/*',
        /[^*]*\*+([^/*][^*]*\*+)*/,
        '/'
      )
    ),
  }
});

function sepBy1(sep, rule) {
  return seq(rule, repeat(seq(sep, rule)));
}

function sepBy(sep, rule) {
  return optional(sepBy1(sep, rule));
}
