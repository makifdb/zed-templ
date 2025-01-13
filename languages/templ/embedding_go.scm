; From https://github.com/zed-industries/zed/blob/0f584cb353afe0483d8a044619b7dabcfcd10e40/crates/languages/src/go/embedding.scm
(
    (comment)* @context
    .
    (type_declaration
        (type_spec
            name: (_) @name)
    ) @item
)

(
    (comment)* @context
    .
    (function_declaration
        name: (_) @name
    ) @item
)

(
    (comment)* @context
    .
    (method_declaration
        name: (_) @name
    ) @item
)
