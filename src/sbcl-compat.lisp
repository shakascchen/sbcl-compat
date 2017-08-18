(in-package :cl-user)
(defpackage sbcl-compat
  (:use :cl))
(in-package :sbcl-compat)

;;; is there better way to do the encapsulation and package clean?


(excl:without-package-locks
  (setf (macro-function 'cl-user::defpackage)
	(macro-function 'defpackage+-user-1::defpackage+)))

(format t
	"~%WARNING: cl-user::defpackage is redefined as defpackage+-user-1::defpackage+ .~%")
(format t "Old defpackage is kept in package COMMON-LISP-ORIGINAL.~%")

;;; should use something like this in the future http://quickdocs.org/local-package-aliases/
(defmethod defpackage+-user-1::defpackage+-dispatch ((option (eql :local-nicknames)) params package)
  (dolist (package-name-pair params)
    (let-plus:let+ (((local-nickname package-original-name) (mapcar (lambda (package-name)
								      (format nil
									      "~:@(~a~)"
									      package-name))
								    package-name-pair)))
      ;; make global-nickname to make work around for local-nicknames of SBCL's defpackage
      (rename-package package-original-name
		      package-original-name
		      (list local-nickname)))))

(format t
	"WARNING: we got global package nicknames for compatibility of SBCL's defpackage's :local-nicknames option.~%")
