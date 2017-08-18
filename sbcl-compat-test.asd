#|
  This file is a part of sbcl-compat project.
  Copyright (c) 2017 Shaka Chen (scchen@libgirl.com)
|#

(in-package :cl-user)
(defpackage sbcl-compat-test-asd
  (:use :cl :asdf))
(in-package :sbcl-compat-test-asd)

(defsystem sbcl-compat-test
  :author "Shaka Chen"
  :license ""
  :depends-on (:sbcl-compat
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "sbcl-compat"))))
  :description "Test system for sbcl-compat"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
