(in-package #:dlm.ecs)

(defclass world ()
  ((last-id
    :initform 0
    :accessor world-last-id)
   (entities
    :initform (make-hash-table)
    :accessor world-entities)
   (components
    :initform (make-hash-table)
    :accessor world-components)))

(defun make-world ()
  "Creates the world"
  (make-instance 'world))

(defun make-entity (world)
  "Creates an entity in the world, and returns its id"
  (let ((entity (incf (world-last-id world))))
    (setf (gethash entity (world-entities world)) t)
    entity))

(defun entity-alive-p (world entity)
  "Returns T if entity is alive in the world"
  (values (gethash entity (world-entities world))))

(defun destroy-entity (world entity)
  "Removes entity from world. Returns T if the entity was alive,
NIL otherwise. Destroying an entity is idempotent, so if two
systems remove the same entity on the same tick because both
determine the entity should die it will not trigger an error,
the second attempt at removal will simply do nothing."
  (let ((was-alive (remhash entity (world-entities world))))
    (when was-alive
      (maphash (lambda (kind table)
                 (declare (ignore kind))
                 (remhash entity table))
               (world-components world)))
    was-alive))
