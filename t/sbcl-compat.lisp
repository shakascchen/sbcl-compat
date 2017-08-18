(in-package :cl-user)
(defpackage sbcl-compat-test
  (:use :cl
        :sbcl-compat
        :prove))
(in-package :sbcl-compat-test)

;; NOTE: To run this test file, execute `(asdf:test-system :sbcl-compat)' in your Lisp.

(plan nil)

;; blah blah blah.

(finalize)
