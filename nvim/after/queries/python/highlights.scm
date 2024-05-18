;; extends
(module (import_statement name: (dotted_name (identifier) @module.name))) 
(import_statement name: (aliased_import name: (dotted_name (identifier) @module.name)))
(import_from_statement module_name: (dotted_name (identifier) @module.name))

(import_from_statement 
  name: (dotted_name 
    (identifier) @module.import.class 
      (#lua-match? @module.import.class "^[A-Z][a-zA-Z0-9_]*$")))
(import_from_statement 
  name: (dotted_name 
    (identifier) @module.import.method
      (#lua-match? @module.import.method "^[a-z][a-zA-Z0-9_]*$")))

(import_from_statement 
  name: (aliased_import 
    name: (dotted_name 
      (identifier) @module.import.class 
        (#lua-match? @module.import.class "^[A-Z][a-zA-Z0-9_]*$"))))
(import_from_statement 
  name: (aliased_import 
    name: (dotted_name 
      (identifier) @module.import.method 
        (#lua-match? @module.import.method "^[a-z][a-zA-Z0-9_]*$"))))

(import_statement (aliased_import alias: (identifier) @module.alias))
(import_from_statement name: (aliased_import alias: (identifier) @module.alias))

object: (identifier) @object.python
