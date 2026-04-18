(component_declaration
  name: (component_identifier) @function)

(component_import
  name: (component_identifier) @function)

(component_render) @function.call @function

"package" @keyword
"import" @keyword

[
  "templ"
  "css"
  "script"
  "break"
  "case"
  "chan"
  "continue"
  "default"
  "return"
  "defer"
  "else"
  "fallthrough"
  "func"
  "go"
  "goto"
  "if"
  "interface"
  "map"
  "range"
  "select"
  "struct"
  "switch"
  "type"
  "const"
  "var"
  "for"
] @keyword

(package_identifier) @module @type

(parameter_declaration
  name: (identifier) @variable.parameter)

(variadic_parameter_declaration
  name: (identifier) @variable.parameter)

(type_spec
  name: (type_identifier) @type)

(type_identifier) @type

(field_identifier) @variable.member @property

(keyed_element
  .
  (literal_element
    (identifier) @variable.member @property))

(identifier) @variable

(function_declaration
  name: (identifier) @function)

(method_declaration
  name: (field_identifier) @function.method @function)

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  "--"
  "-"
  "-="
  ":="
  "!"
  "!="
  "..."
  "*"
  "*="
  "/"
  "/="
  "&"
  "&&"
  "&="
  "%"
  "%="
  "^"
  "^="
  "+"
  "++"
  "+="
  "<-"
  "<"
  "<<"
  "<<="
  "<="
  "="
  "=="
  ">"
  ">="
  ">>"
  ">>="
  "|"
  "|="
  "||"
  "~"
] @operator

(call_expression
  function: (identifier) @function.call @function)

(call_expression
  function: (selector_expression
    field: (field_identifier) @function.method @function.call @function))

[
  (interpreted_string_literal)
  (raw_string_literal)
  (rune_literal)
] @string

(escape_sequence) @string.escape

[
  (int_literal)
  (float_literal)
  (imaginary_literal)
] @number

[
  (true)
  (false)
  (nil)
  (iota)
] @constant.builtin

[
  (tag_start)
  (tag_end)
  (self_closing_tag)
  (script_tag_start)
  (script_tag_end)
  (self_closing_script_tag)
  (style_tag_start)
  (style_tag_end)
  (self_closing_style_tag)
] @tag

(attribute
  name: (attribute_name) @tag.attribute @attribute)

(attribute
  value: (quoted_attribute_value) @string)

[
  (element_text)
  (style_element_text)
] @string.special @text.literal

(css_identifier) @function

(css_property
  name: (css_property_name) @property)

(css_property
  value: (css_property_value) @string)

[
  (expression)
  (dynamic_class_attribute_value)
] @function.method @embedded

[
  (element_comment)
  (comment)
] @comment

"@" @operator
