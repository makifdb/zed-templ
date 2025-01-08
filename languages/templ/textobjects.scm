(component_declaration
    (component_block
        "{"
        (_)* @function.inside
        "}")) @function.around

(component_declaration
    (component_block
        "{"
        (_)* @class.inside
        "}")) @class.around

; TODO: CSS blocks require the _css_block rule but it is marked private in templ/tree-sitter, not sure why.

(script_declaration
    (script_block
        "{"
        (_)* @class.inside
        "}")) @class.around

(script_declaration
    (script_block
        "{"
        (_)* @function.inside
        "}")) @function.around
