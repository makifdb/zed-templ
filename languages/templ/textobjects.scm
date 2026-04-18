(component_declaration
    (component_block
        "{"
        (_)* @function.inside
        "}")) @function.around

(function_declaration
    body: (_
        "{"
        (_)* @function.inside
        "}")) @function.around

(method_declaration
    body: (_
        "{"
        (_)* @function.inside
        "}")) @function.around

(component_declaration
    (component_block
        "{"
        (_)* @class.inside
        "}")) @class.around

(type_declaration
    (type_spec (struct_type (field_declaration_list (
        "{"
        (_)* @class.inside
        "}")?)))) @class.around

(type_declaration
    (type_spec (interface_type
        (_)* @class.inside))) @class.around

(type_declaration) @class.around

(comment)+ @comment.around

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
