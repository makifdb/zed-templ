; From https://github.com/zed-industries/zed/blob/9d681bda8d607384703f14d9e6549165e5cb9ae4/crates/languages/src/go/injections.scm

; Refer to https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/go/injections.scm#L4C1-L16C41
(call_expression
  (selector_expression) @_function
  (#any-of? @_function
    "regexp.Match" "regexp.MatchReader" "regexp.MatchString" "regexp.Compile" "regexp.CompilePOSIX"
    "regexp.MustCompile" "regexp.MustCompilePOSIX")
  (argument_list
    .
    [
      (raw_string_literal)
      (interpreted_string_literal)
    ] @content
    (#set! "language" "regex")))
