/**
 * @file Python Documentation Format
 * @author Hilmar Gústafsson <LiHRaM@users.noreply.github.com>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

const NEWLINE = /\r?\n/;
const ANYTHING = /[^\r\n]+/;

module.exports = grammar({
  name: "pydoc",

  rules: {
    docstring: $ => choice($.statement, $._text),
    statement: $ => seq($._statement_line, optional(repeat($._statement_line_continued)), optional($.statement_result)),

    _statement_line: $ => seq($._prompt, $.statement_content, NEWLINE),
    _statement_line_continued: $ => seq($._prompt_contd, $.statement_content, NEWLINE),

    _prompt: _ => '>>>',
    _prompt_contd: _ => '...',

    statement_content: $ => $._text,
    statement_result: $ => $._text,

    _text: _ => token(prec(-1, ANYTHING)),
  }
});
