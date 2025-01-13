; From https://github.com/zed-industries/zed/blob/2db2b636f24cce2066b722fd3167898e53b5296f/crates/languages/src/go/outline.scm

(comment) @annotation
(type_declaration
    "type" @context
    (type_spec
        name: (_) @name)) @item

(function_declaration
    "func" @context
    name: (identifier) @name
    parameters: (parameter_list
      "("
      ")")) @item

(method_declaration
    "func" @context
    receiver: (parameter_list
        "(" @context
        (parameter_declaration
            name: (_) @name
            type: (_) @context)
        ")" @context)
    name: (field_identifier) @name
    parameters: (parameter_list
      "("
      ")")) @item

(const_declaration
    "const" @context
    (const_spec
        name: (identifier) @name) @item)

(source_file
    (var_declaration
        "var" @context
        (var_spec
            name: (identifier) @name) @item))

(method_elem
    name: (_) @name
    parameters: (parameter_list
      "(" @context
      ")" @context)) @item

(field_declaration
    name: (_) @name) @item
