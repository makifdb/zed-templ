((element_comment) @injection.content
  (#set! injection.language "comment"))

((script_block_text) @injection.content
  (#set! injection.language "javascript"))

((script_element_text) @injection.content
  (#set! injection.language "javascript"))

((style_element_text) @injection.content
  (#set! injection.language "css"))

; Keep regex string injection without restoring the full Go overlay stack.
(call_expression
  (selector_expression) @_function
  (#any-of? @_function
    "regexp.Match"
    "regexp.MatchReader"
    "regexp.MatchString"
    "regexp.Compile"
    "regexp.CompilePOSIX"
    "regexp.MustCompile"
    "regexp.MustCompilePOSIX")
  (argument_list
    .
    [
      (raw_string_literal)
      (interpreted_string_literal)
    ] @injection.content
    (#set! injection.language "regex")))
