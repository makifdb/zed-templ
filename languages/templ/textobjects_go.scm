; From https://github.com/zed-industries/zed/blob/75c9dc179bb3db89915666baf56e5362761cd97c/crates/languages/src/go/textobjects.scm

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
