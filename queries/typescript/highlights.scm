; inherits: ecma

[
  "declare"
  "enum"
  "export"
  "implements"
  "interface"
  "keyof"
  "type"
  "namespace"
  "override"
  "satisfies"
  "module"
  "infer"
] @keyword

(as_expression "as" @keyword)

[
  "abstract"
  "private"
  "protected"
  "public"
  "readonly"
] @type.qualifier

; types

(type_identifier) @type
(predefined_type) @type.builtin

(import_statement "type"
  (import_clause
    (named_imports
      ((import_specifier
          name: (identifier) @type)))))

(template_literal_type) @string

;; punctuation

(type_arguments
  ["<" ">"] @punctuation.bracket)

(type_parameters
  ["<" ">"] @punctuation.bracket)

(union_type
  "|" @punctuation.delimiter)

(intersection_type 
  "&" @punctuation.delimiter)

(type_annotation
  ":" @punctuation.delimiter)

(pair
  ":" @punctuation.delimiter)

(index_signature
  ":" @punctuation.delimiter)

(opting_type_annotation
  "?:" @punctuation.delimiter)

"?." @punctuation.delimiter

(property_signature "?" @punctuation.special)
(optional_parameter "?" @punctuation.special)

(template_type ["${" "}"] @punctuation.special)

(conditional_type ["?" ":"] @conditional.ternary)

; Variables

(undefined) @variable.builtin

;;; Parameters
(required_parameter (identifier) @parameter)
(optional_parameter (identifier) @parameter)

(required_parameter
  (rest_pattern
    (identifier) @parameter))

;; ({ a }) => null
(required_parameter
  (object_pattern
    (shorthand_property_identifier_pattern) @parameter))

;; ({ a: b }) => null
(required_parameter
  (object_pattern
    (pair_pattern
      value: (identifier) @parameter)))

;; ([ a ]) => null
(required_parameter
  (array_pattern
    (identifier) @parameter))

;; a => null
(arrow_function
  parameter: (identifier) @parameter)
