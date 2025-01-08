; From https://github.com/zed-industries/zed/blob/0f584cb353afe0483d8a044619b7dabcfcd10e40/crates/languages/src/go/indents.scm

[
    (assignment_statement)
    (call_expression)
    (selector_expression)
] @indent

(_ "[" "]" @end) @indent
(_ "{" "}" @end) @indent
(_ "(" ")" @end) @indent
