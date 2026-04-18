(component_declaration
    "templ" @context
    name: (component_identifier) @name
) @item

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

(component_import
    "@" @context
    (package_identifier) @name
    "." @name
    (component_identifier) @name
) @item

(css_declaration
    "css" @context
    name: (css_identifier) @name
) @item

(script_declaration
    "script" @context
    name: (script_identifier) @name
) @item

(style_element
    [
        (style_tag_start 
            "style" @context )
        (self_closing_style_tag
            "style" @context )
    ]
) @item

(script_element
    [
        (script_tag_start
            "script" @context)
        (self_closing_script_tag
            "script" @context)
    ]
) @item

(element
    [
        (tag_start
            "<"
            name: (element_identifier) @name)
        (self_closing_tag
            "<"
            name: (element_identifier) @name)
    ]
) @item
