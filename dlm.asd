(asdf:defsystem "dlm"
  :description "The Dungen Lords Monthly"
  :depends-on ("dlm/ecs"))

(asdf:defsystem "dlm/ecs"
  :description "A simple ecs"
  :serial t
  :components ((:file "src/ecs/package")
               (:file "src/ecs/world")))
