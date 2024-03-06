;; extends
(module (import_statement name: (dotted_name (identifier) @module.name))) 
(import_statement name: (aliased_import name: (dotted_name (identifier) @module.name)))
(import_from_statement module_name: (dotted_name (identifier) @module.name))

(import_from_statement name: (dotted_name (identifier) @module.import))
(import_from_statement name: (aliased_import name: (dotted_name (identifier) @module.import)))

(import_statement (aliased_import alias: (identifier) @module.alias))
(import_from_statement name: (aliased_import alias: (identifier) @module.alias))
