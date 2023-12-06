;; extends
(module
	(import_statement
    	(aliased_import
        	name: (dotted_name
            	(identifier) @module.name ))))

(import_statement
  (aliased_import
    alias: (identifier) @module.alias))

 (expression_statement
  (assignment
right:(call
function:(attribute
object:(identifier) @object.python))))

object: (identifier) @object.python

(import_statement
  name: (dotted_name (identifier) @module.name))

(import_from_statement
  module_name: (dotted_name
    (identifier) @module.name))
(import_from_statement
  name: (dotted_name
    (identifier) @module.name))

(import_from_statement
  name: (aliased_import
    name: (dotted_name
        (identifier) @module.name)))

["class"] @class

["def"] @def

("->" @concealarrow (#set! conceal "" priority 120))

(ERROR) @customised_error
