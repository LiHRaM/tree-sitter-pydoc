# tree-sitter-pydoc

A tree-sitter grammar supporting Python docstrings.

Inspired by https://github.com/tree-sitter/tree-sitter-python/issues/251

## Configuration

Configure your editor using injections, required for Python and Pydoc.

### Helix Editor

```scheme
; ~/.config/helix/runtime/queries/python/injections.scm
(expression_statement
  (string
    (string_start)
    (string_content) @injection.content
    (string_end))
  (#set! injection.language "pydoc"))
```

```scheme
; ~/.config/helix/runtime/queries/pydoc/injections.scm
(docstring
  (statement
    (statement_content) @injection.content)
    (#set! injection.language "python"))

(docstring
  (statement
    (statement_result) @injection.content)
    (#set! injection.language "python"))
```
