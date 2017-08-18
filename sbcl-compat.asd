#|
  This file is a part of sbcl-compat project.
  Copyright (c) 2017 Shaka Chen (scchen@libgirl.com)
|#

#|
  Author: Shaka Chen (scchen@libgirl.com)
|#

(in-package :cl-user)
(defpackage sbcl-compat-asd
  (:use :cl :asdf))
(in-package :sbcl-compat-asd)

(defsystem sbcl-compat
  :version "0.1"
  :author "Shaka Chen"
  :license ""
  :depends-on (:defpackage-plus :let-plus)
  :components ((:module "src"
                :components
                ((:file "sbcl-compat"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op sbcl-compat-test))))
