; inherits: go

(component_declaration
    "templ" @context
    name: (component_identifier) @name
) @item

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
    name: "style" @context
) @item

(script_element
    name: "script" @context
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
